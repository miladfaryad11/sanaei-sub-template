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

## Quick Links

- Project: https://github.com/miladfaryad11/sanaei-sub-template
- Template: https://raw.githubusercontent.com/miladfaryad11/sanaei-sub-template/main/sub.html
- Screenshot: https://raw.githubusercontent.com/miladfaryad11/sanaei-sub-template/main/preview.png

## Preview

![Subscription page preview](preview.png)

## Install

Install with one command:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/miladfaryad11/sanaei-sub-template/main/install.sh)
```

The installer downloads `sub.html` and installs it at:

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
sudo curl -fsSL -o /etc/x-ui/sub/sub.html \
  https://raw.githubusercontent.com/miladfaryad11/sanaei-sub-template/main/sub.html
sudo chmod 644 /etc/x-ui/sub/sub.html
```

See [README_FA.md](README_FA.md) for the Persian installation guide.
