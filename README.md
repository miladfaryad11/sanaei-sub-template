# Sanaei Subscription Template

A clean bilingual subscription page for Sanaei, 3x-ui, and X-UI panels.

[راهنمای فارسی](README_FA.md) | [Private Telegram](https://t.me/proxystore11) | [Telegram Channel](https://t.me/proxystoreadmin)

## Before You Start

- Your panel must run on a Linux server.
- The server needs internet access to download the template.
- You need administrator access to the server.

## Quick Installation

Run this one-line command on the Linux server:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/miladfaryad11/sanaei-sub-template/main/install.sh)
```

From Windows, run the same command in WSL or in an SSH terminal connected to your Linux server.

The installer downloads the latest `sub.html`, creates the template folder, keeps a backup of an existing file, and installs the new template at:

```text
/etc/x-ui/sub/sub.html
```

## Configure Sanaei

1. Open the panel settings.
2. Go to `Subscription -> Information`.
3. Find `Subscription page template folder`.
4. Enter this folder:

```text
/etc/x-ui/sub
```

5. Save the settings and reopen a subscription link.

## Update The Template

Run the same installation command again whenever you want the latest version. The installer creates a timestamped backup before replacing the current file.

## Report A Bug

Open a GitHub Issue for bugs or feature requests:

[Create a GitHub Issue](https://github.com/miladfaryad11/sanaei-sub-template/issues/new/choose)

Please include:

- Panel name and version
- Browser, operating system, and device
- Steps to reproduce the problem
- What you expected and what happened
- A screenshot when useful

Do not post a complete private subscription URL. Remove its token or replace it with `REDACTED` first.

## Direct Telegram Support

- Private messages: [@proxystore11](https://t.me/proxystore11)
- Channel: [@proxystoreadmin](https://t.me/proxystoreadmin)
