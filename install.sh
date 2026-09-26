#!/usr/bin/env bash
set -Eeuo pipefail

DEFAULT_URL="https://raw.githubusercontent.com/miladfaryad11/sanaei-sub-template/main/sub.html"
URL="${TEMPLATE_URL:-$DEFAULT_URL}"
SOURCE_IS_ARCHIVE=0
DEST_DIR="/etc/x-ui/sub"
ORIGINAL_ARGS=("$@")

usage() {
  cat <<'EOF'
Sanaei subscription template installer

Usage:
  sudo bash install.sh
  sudo bash install.sh --url URL
  sudo bash install.sh --dir /etc/x-ui/sub
EOF
}

while (($#)); do
  case "$1" in
    --url)
      [[ $# -ge 2 ]] || { printf 'Error: --url requires a value.\n' >&2; exit 2; }
      URL="$2"
      SOURCE_IS_ARCHIVE=0
      shift 2
      ;;
    --dir)
      [[ $# -ge 2 ]] || { printf 'Error: --dir requires a value.\n' >&2; exit 2; }
      DEST_DIR="$2"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      printf 'Error: unknown option: %s\n' "$1" >&2
      usage >&2
      exit 2
      ;;
  esac
done

if [[ "$(id -u)" -ne 0 ]]; then
  command -v sudo >/dev/null 2>&1 || { printf 'Error: root or sudo access is required.\n' >&2; exit 1; }
  exec sudo -E bash "$0" "${ORIGINAL_ARGS[@]}"
fi

die() {
  printf 'Error: %s\n' "$1" >&2
  exit 1
}

download() {
  local source_url="$1"
  local output_file="$2"
  if command -v curl >/dev/null 2>&1; then
    curl --fail --silent --show-error --location --retry 3 --connect-timeout 15 --max-time 120 "$source_url" -o "$output_file"
  elif command -v wget >/dev/null 2>&1; then
    wget --quiet --tries=3 --timeout=30 --output-document="$output_file" "$source_url"
  else
    die "curl or wget was not found. Install one of them and try again."
  fi
}

TEMP_DIR="$(mktemp -d)"
TEMP_FILE="$TEMP_DIR/sub.html"
ARCHIVE_FILE="$TEMP_DIR/template.tar.gz"
trap 'rm -rf "$TEMP_DIR"' EXIT

if [[ "$SOURCE_IS_ARCHIVE" -eq 1 ]]; then
  download "$URL" "$ARCHIVE_FILE" || die "Could not download the template archive from GitHub."
  tar -xOzf "$ARCHIVE_FILE" --wildcards '*/sub.html' > "$TEMP_FILE" || die "Could not extract sub.html from the archive."
else
  download "$URL" "$TEMP_FILE" || die "Could not download sub.html: $URL"
fi

[[ -s "$TEMP_FILE" ]] || die "The downloaded file is empty."
grep -qiE '<!doctype[[:space:]]+html|<html[[:space:]>]' "$TEMP_FILE" || die "The downloaded file is not valid HTML."

mkdir -p "$DEST_DIR"
DEST_FILE="$DEST_DIR/sub.html"
if [[ -f "$DEST_FILE" ]]; then
  BACKUP_FILE="$DEST_FILE.bak.$(date +%Y%m%d-%H%M%S)"
  cp -a "$DEST_FILE" "$BACKUP_FILE"
  printf 'Previous version backed up: %s\n' "$BACKUP_FILE"
fi

chmod 0644 "$TEMP_FILE"
mv -f "$TEMP_FILE" "$DEST_FILE"

printf '\nTemplate installed successfully.\n'
printf 'Template file: %s\n' "$DEST_FILE"
printf 'Sanaei template directory: %s\n' "$DEST_DIR"
printf 'Download source: %s\n' "$URL"
printf '\nSet this directory in Sanaei panel settings: Subscription > Information > Subscription page template folder.\n'
