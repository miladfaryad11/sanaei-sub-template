# نصب قالب صفحه اشتراک سنایی

![پیش‌نمایش صفحه اشتراک](preview.png)

## لینک‌های کوتاه

- پروژه: https://github.com/miladfaryad11/sanaei-sub-template
- راهنمای انگلیسی: [README.md](README.md)
- قالب: https://raw.githubusercontent.com/miladfaryad11/sanaei-sub-template/main/sub.html
- اسکرین‌شات: https://raw.githubusercontent.com/miladfaryad11/sanaei-sub-template/main/preview.png

این قالب در مسیر زیر نصب می‌شود:

```text
/etc/x-ui/sub/sub.html
```

## پیش‌نیاز

مخزن GitHub باید عمومی باشد و فایل `sub.html` در ریشه‌ی شاخه‌ی `main` قرار داشته باشد:

```text
https://github.com/miladfaryad11/sanaei-sub-template
```

مخزن عمومی است و فایل‌ها از لینک مستقیم GitHub قابل دریافت هستند.

## نصب خودکار

نصب با یک دستور:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/miladfaryad11/sanaei-sub-template/main/install.sh)
```

اسکریپت:

- فایل `sub.html` را از GitHub دانلود می‌کند.
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

## بازگردانی نسخه قبلی

اسکریپت قبل از جایگزینی، backup را با نامی مانند زیر می‌سازد:

```text
/etc/x-ui/sub/sub.html.bak.20260926-120000
```

برای بازگردانی، فایل backup را به `sub.html` تغییر نام دهید.

## گزارش باگ و پیشنهاد قابلیت

برای گزارش باگ یا پیشنهاد قابلیت جدید، یک Issue باز کنید و این موارد را بنویسید:

- چه اتفاقی افتاد یا چه چیزی انتظار داشتید
- نسخه پنل و مرورگر
- در صورت امکان اسکرین‌شات یا لینک اشتراک قابل بازتولید

لینک ثبت Issue:

https://github.com/miladfaryad11/sanaei-sub-template/issues/new/choose
