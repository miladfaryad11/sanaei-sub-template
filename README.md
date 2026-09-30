# Sanaei Subscription Template

![Repository](https://img.shields.io/badge/GitHub-Repository-181717?style=for-the-badge&logo=github)
![Responsive](https://img.shields.io/badge/Layout-Responsive-2ea44f?style=for-the-badge)
![Bilingual](https://img.shields.io/badge/Languages-FA%20%7C%20EN-4078c0?style=for-the-badge)

A modern, bilingual subscription page for Sanaei, 3x-ui, and X-UI panels.

[راهنمای فارسی](README_FA.md) | [Private Telegram](https://t.me/proxystore11) | [Telegram Channel](https://t.me/proxystoreadmin)

## What This Template Does

Instead of showing users a raw subscription response, the template presents their subscription in a clear dashboard with traffic, expiration, configurations, QR codes, and quick import actions.

## Key Features

- Persian and English interface with RTL support
- Dark and light themes with system preference detection
- Responsive layout for Android, iPhone, Windows, tablets, and desktop browsers
- Traffic usage ring with unlimited, warning, and quota-exceeded states
- Expiration date, remaining time, last connection, and online status
- Quick actions for Clash URL, JSON URL, subscription QR, and support
- One-click import actions for supported Android, iOS, and Windows apps
- Configurations grouped by protocol with search, filters, copy, and QR actions
- Live status refresh every 10 seconds
- No local image dependency for the built-in logo

## User Guide

### Subscription Status

- **Subscription status:** shows whether the subscription is active.
- **Live connection:** shows whether a connection is currently detected.
- **User ID:** shows the user identity supplied by the panel.

### Traffic Usage

- **Used:** traffic consumed so far.
- **Remaining:** traffic left in the subscription.
- **Total:** the subscription limit.
- **Usage ring:** a visual percentage indicator. Unlimited subscriptions use a full cyan ring.

### Expiration And Activity

The activity card shows the expiration date, last online time, and remaining time. Unlimited or non-expiring values are shown clearly instead of displaying an incorrect date.

### Quick Actions

- **Copy Clash URL:** copies the Clash subscription URL.
- **Copy JSON URL:** copies the JSON subscription URL.
- **Subscription QR:** opens a QR code for the subscription URL.
- **Support:** opens the support link configured by the panel.

### Import Into Apps

When the panel provides a subscription URL, the quick import area can offer direct import buttons for supported apps:

- **Android:** v2rayNG, Hiddify, Happ, V2Box, and Incy.
- **iOS:** Hiddify, Happ, V2Box, Incy, Streisand, and Shadowrocket.
- **Windows:** Hiddify and Happ.

The app must be installed on the device for its import button to work.

### Configurations

Configurations are grouped by protocol. Open a configuration to view its full URL, copy it, or create a QR code. Use the search box and protocol filters to find a specific configuration quickly.

## Installation For Administrators

### Requirements

- Sanaei, 3x-ui, or X-UI installed on a Linux server
- SSH access with root or sudo permission
- Internet access from the server
- HTTPS is recommended for the best browser clipboard and link-opening behavior

### Automatic Installation

Run this command as one line on the Linux server:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/miladfaryad11/sanaei-sub-template/main/install.sh)
```

From Windows, run the same one-line command in WSL or in an SSH terminal connected to the Linux server.

The installer downloads the latest `sub.html`, creates `/etc/x-ui/sub`, backs up an existing template with a timestamp, validates the downloaded HTML, and installs:

```text
/etc/x-ui/sub/sub.html
```

### Configure The Panel

1. Open the panel settings.
2. Go to `Subscription -> Information`.
3. Find `Subscription page template folder`.
4. Set it to `/etc/x-ui/sub`.
5. Save the settings and reopen a subscription link.

### Update

Run the same installation command again to download the newest version. A timestamped backup is created before replacement.

## Bug Reports And Feature Requests

Please open an Issue for a bug or feature request:

[Create a GitHub Issue](https://github.com/miladfaryad11/sanaei-sub-template/issues/new/choose)

Include:

- Panel name and version
- Browser, operating system, and device
- Exact steps to reproduce the problem
- What you expected and what actually happened
- A screenshot or short screen recording when useful
- The relevant error message

Never publish a complete private subscription URL. Remove its token or replace it with `REDACTED` before sharing.

## Telegram Support

- **Private messages:** [@proxystore11](https://t.me/proxystore11)
- **Channel:** [@proxystoreadmin](https://t.me/proxystoreadmin)
