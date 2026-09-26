# نصب قالب صفحه اشتراک سنایی

![پیش‌نمایش صفحه اشتراک](preview.png)

این قالب در مسیر زیر نصب می‌شود:

```text
/etc/x-ui/sub/sub.html
```

## پیش‌نیاز

مخزن GitHub باید عمومی باشد و فایل `sub.html` در ریشه‌ی شاخه‌ی `main` قرار داشته باشد:

```text
https://github.com/miladfaryad11/sanaei-sub-template
```

مخزن باید عمومی باشد تا سرور بتواند آرشیو GitHub را دانلود کند.

## نصب خودکار

برای دریافت و اجرای نصب‌کننده:

```bash
curl -fsSL https://github.com/miladfaryad11/sanaei-sub-template/archive/refs/heads/main.tar.gz \
  | tar -xzOf - --wildcards '*/install.sh' > /tmp/x-ui-sub-install.sh
sudo bash /tmp/x-ui-sub-install.sh
```

اسکریپت:

- آرشیو قالب را از GitHub دانلود می‌کند.
- فایل `sub.html` را از آرشیو استخراج می‌کند.
- معتبر بودن HTML را بررسی می‌کند.
- پوشه‌ی `/etc/x-ui/sub` را می‌سازد.
- اگر نسخه‌ی قبلی وجود داشته باشد، از آن backup می‌گیرد.
- فایل را در `/etc/x-ui/sub/sub.html` قرار می‌دهد.
- در پایان موفقیت و مسیر دقیق نصب را نمایش می‌دهد.

اگر می‌خواهید فایل مستقیم دیگری را امتحان کنید:

```bash
sudo ./install.sh --url "https://raw.githubusercontent.com/USER/REPO/BRANCH/sub.html"
```

## تنظیم پنل سنایی

بعد از اجرای موفق نصب، در پنل سنایی به این بخش بروید:

```text
تنظیمات پنل
  → Subscription
    → اطلاعات
      → پوشه قالب صفحه اشتراک
```

مقدار زیر را وارد کنید و ذخیره بزنید:

```text
/etc/x-ui/sub
```

پس از ذخیره، لینک اشتراک را دوباره باز کنید. اگر پنل تغییر را فوری نشان نداد، یک‌بار سرویس x-ui را از روش معمول سرور خود reload یا restart کنید.

## بررسی نصب

برای بررسی وجود فایل:

```bash
ls -lh /etc/x-ui/sub/sub.html
```

برای دیدن محتوای ابتدای فایل:

```bash
head -n 5 /etc/x-ui/sub/sub.html
```

## خطاهای رایج

### خطای دانلود از GitHub

مخزن باید عمومی باشد و فایل باید دقیقاً با نام `sub.html` در آرشیو شاخه‌ی `main` وجود داشته باشد. آدرس آرشیو را با دستور زیر بررسی کنید:

```bash
curl -I "https://github.com/miladfaryad11/sanaei-sub-template/archive/refs/heads/main.tar.gz"
```

### خطای دسترسی

نصب را با `sudo` اجرا کنید؛ چون نوشتن در `/etc/x-ui` به دسترسی root نیاز دارد.

### بازگردانی نسخه قبلی

اسکریپت قبل از جایگزینی، backup را با نامی مانند زیر می‌سازد:

```text
/etc/x-ui/sub/sub.html.bak.20260926-120000
```

برای بازگردانی، فایل backup را به `sub.html` تغییر نام دهید.
