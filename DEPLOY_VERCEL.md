# Deploy ke Vercel

Project ini sudah siap deploy sebagai static website.

## Setting Vercel

- Framework Preset: `Other`
- Build Command: kosongkan
- Output Directory: kosongkan
- Install Command: kosongkan atau default

## Langkah

1. Buat repository GitHub.
2. Upload semua file project ini.
3. Buka Vercel.
4. Klik **Add New Project**.
5. Import repository.
6. Klik **Deploy**.

File utama yang akan dibuka Vercel adalah `index.html`.

## Catatan

`server.js` hanya untuk preview lokal. Vercel tidak perlu menjalankan file itu.

Kalau sebelumnya masih muncul `FUNCTION_INVOCATION_FAILED` atau `No entrypoint found`, lakukan redeploy dengan opsi **Use existing Build Cache** dimatikan. Kalau tetap sama, hapus project di Vercel lalu import ulang repository ini, karena setting lama kemungkinan masih membaca project sebagai server.
