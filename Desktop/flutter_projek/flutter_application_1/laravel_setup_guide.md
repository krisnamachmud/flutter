# Panduan Setup Laravel untuk Integrasi Flutter

## 1. Tambahkan Route About di Laravel

Buka file `routes/web.php` di proyek Laravel Anda, lalu tambahkan:

```php
Route::get('/about', function () {
    return view('about');
});
```

## 2. Buat View About

Buat file `resources/views/about.blade.php`:

```html
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About - Krisna</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .card {
            background: white;
            border-radius: 16px;
            padding: 40px;
            max-width: 500px;
            width: 90%;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            text-align: center;
        }
        .card h1 {
            color: #5b21b6;
            font-size: 28px;
            margin-bottom: 16px;
        }
        .card p {
            color: #555;
            font-size: 16px;
            line-height: 1.6;
            margin-bottom: 12px;
        }
        .info { color: #7c3aed; font-weight: 600; }
        .divider {
            height: 2px;
            background: linear-gradient(90deg, transparent, #7c3aed, transparent);
            margin: 20px 0;
        }
    </style>
</head>
<body>
    <div class="card">
        <h1>About Me</h1>
        <div class="divider"></div>
        <p class="info">Krisna</p>
        <p>Teknik Informatika</p>
        <p>PENS PSDKU Lamongan</p>
        <div class="divider"></div>
        <p>Halaman ini disajikan oleh <strong>Laravel</strong> dan diakses dari aplikasi <strong>Flutter</strong>.</p>
        <p style="margin-top: 16px; color: #999; font-size: 14px;">
            &copy; {{ date('Y') }} - Laravel + Flutter Integration
        </p>
    </div>
</body>
</html>
```

## 3. Jalankan Laravel Server

```bash
cd /path/to/laravel-project
php artisan serve
```

Server akan berjalan di `http://127.0.0.1:8000`.

## 4. Catatan Penting untuk Android Emulator

| Platform | URL Laravel |
|----------|------------|
| Android Emulator | `http://10.0.2.2:8000` |
| Chrome (Web) | `http://127.0.0.1:8000` |
| Device Fisik (WiFi) | `http://192.168.x.x:8000` (IP PC Anda) |
| Windows Desktop | `http://127.0.0.1:8000` |

Di file `lib/main.dart`, variabel `laravelBaseUrl` sudah diset ke `10.0.2.2:8000` untuk Android Emulator.
Ubah sesuai kebutuhan jika menggunakan platform lain.
