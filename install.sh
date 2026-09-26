#!/usr/bin/env bash
set -Eeuo pipefail

DEFAULT_URL="https://raw.githubusercontent.com/miladfaryad11/sanaei-sub-template/main/sub.html"
URL="${TEMPLATE_URL:-$DEFAULT_URL}"
SOURCE_IS_ARCHIVE=0
DEST_DIR="/etc/x-ui/sub"
ORIGINAL_ARGS=("$@")

usage() {
  cat <<'EOF'
نصب قالب صفحه اشتراک سنایی

استفاده:
  sudo bash install.sh
  sudo bash install.sh --url URL
  sudo bash install.sh --dir /etc/x-ui/sub
EOF
}

while (($#)); do
  case "$1" in
    --url)
      [[ $# -ge 2 ]] || { printf 'خطا: برای --url مقدار وارد کنید.\n' >&2; exit 2; }
      URL="$2"
      SOURCE_IS_ARCHIVE=0
      shift 2
      ;;
    --dir)
      [[ $# -ge 2 ]] || { printf 'خطا: برای --dir مقدار وارد کنید.\n' >&2; exit 2; }
      DEST_DIR="$2"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      printf 'خطا: گزینه ناشناخته: %s\n' "$1" >&2
      usage >&2
      exit 2
      ;;
  esac
done

if [[ "$(id -u)" -ne 0 ]]; then
  command -v sudo >/dev/null 2>&1 || { printf 'خطا: این نصب به دسترسی root یا sudo نیاز دارد.\n' >&2; exit 1; }
  exec sudo -E bash "$0" "${ORIGINAL_ARGS[@]}"
fi

die() {
  printf 'خطا: %s\n' "$1" >&2
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
    die "curl یا wget پیدا نشد. یکی از آن‌ها را نصب کنید."
  fi
}

TEMP_DIR="$(mktemp -d)"
TEMP_FILE="$TEMP_DIR/sub.html"
ARCHIVE_FILE="$TEMP_DIR/template.tar.gz"
trap 'rm -rf "$TEMP_DIR"' EXIT

if [[ "$SOURCE_IS_ARCHIVE" -eq 1 ]]; then
  download "$URL" "$ARCHIVE_FILE" || die "دانلود آرشیو قالب از GitHub انجام نشد."
  tar -xOzf "$ARCHIVE_FILE" --wildcards '*/sub.html' > "$TEMP_FILE" || die "استخراج sub.html از آرشیو انجام نشد."
else
  download "$URL" "$TEMP_FILE" || die "دانلود sub.html انجام نشد: $URL"
fi

[[ -s "$TEMP_FILE" ]] || die "فایل دانلودشده خالی است."
grep -qiE '<!doctype[[:space:]]+html|<html[[:space:]>]' "$TEMP_FILE" || die "فایل دانلودشده HTML معتبر نیست."

mkdir -p "$DEST_DIR"
DEST_FILE="$DEST_DIR/sub.html"
if [[ -f "$DEST_FILE" ]]; then
  BACKUP_FILE="$DEST_FILE.bak.$(date +%Y%m%d-%H%M%S)"
  cp -a "$DEST_FILE" "$BACKUP_FILE"
  printf 'نسخه قبلی ذخیره شد: %s\n' "$BACKUP_FILE"
fi

chmod 0644 "$TEMP_FILE"
mv -f "$TEMP_FILE" "$DEST_FILE"

printf '\nقالب با موفقیت نصب شد.\n'
printf 'فایل قالب: %s\n' "$DEST_FILE"
printf 'مسیر قالب برای پنل سنایی: %s\n' "$DEST_DIR"
printf 'منبع دانلود: %s\n' "$URL"
printf '\nاکنون همین مسیر را در تنظیمات پنل سنایی، بخش Subscription، قسمت اطلاعات و «پوشه قالب صفحه اشتراک» وارد و ذخیره کنید.\n'
