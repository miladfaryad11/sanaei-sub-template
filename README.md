# X-UI Subscription Template

A lightweight bilingual subscription page template for Sanaei / 3x-ui / X-UI panels.

## Features

- Persian and English layouts with RTL support
- Dark and light themes
- Responsive mobile and desktop layout
- Static traffic and remaining-time cards
- Clash and JSON copy buttons
- Subscription QR code
- Inline WebP logo with no local image dependency
- Pure HTML, CSS and JavaScript

## Preview

![Subscription page preview](preview.png)

## Install

Download the installer from the repository archive and run it:

```bash
curl -fsSL https://github.com/miladfaryad11/sanaei-sub-template/archive/refs/heads/main.tar.gz \
  | tar -xzOf - --wildcards '*/install.sh' > /tmp/x-ui-sub-install.sh
sudo bash /tmp/x-ui-sub-install.sh
```

The installer downloads the repository archive, extracts `sub.html`, and installs it at:

```text
/etc/x-ui/sub/sub.html
```

It creates a timestamped backup when an older file already exists.

## Sanaei Settings

In the panel, open:

```text
Panel Settings -> Subscription -> Information -> Subscription page template folder
```

Set the folder to:

```text
/etc/x-ui/sub
```

Then save the settings and reopen a subscription link.

## Manual Download

```bash
sudo mkdir -p /etc/x-ui/sub
curl -fsSL https://github.com/miladfaryad11/sanaei-sub-template/archive/refs/heads/main.tar.gz \
  | tar -xzOf - --wildcards '*/sub.html' \
  | sudo tee /etc/x-ui/sub/sub.html >/dev/null
sudo chmod 644 /etc/x-ui/sub/sub.html
```

See [README_FA.md](README_FA.md) for the Persian installation guide.
