# Shopee Affiliate Upload Planner

Tool web lokal untuk menyiapkan antrian konten Shopee Affiliate.

## Fitur

- Input banyak produk sekaligus dari link atau format `judul | link | harga | kategori`.
- Generator caption, hashtag, dan jadwal upload.
- Kolom file video untuk video milik sendiri.
- Input pilih video lokal untuk mencatat nama dan ukuran file.
- Status antrian: Draft, Siap Upload, Sudah Upload, Perlu Dicek.
- Export CSV untuk workflow upload manual atau tool resmi lain.
- Tombol buka portal resmi Shopee Affiliate Indonesia.
- Tombol copy data upload per item.
- Mode upload semi-otomatis: item berikutnya, copy paket upload, dan tandai sudah upload.
- Profil akun aman: username, brand/toko, email kontak, niche, dan template caption.
- Data tersimpan di browser memakai `localStorage`.

## Cara pakai

1. Buka `index.html` di browser, atau jalankan `node server.js` lalu buka `http://127.0.0.1:5173`.
2. Tempel daftar produk di bagian **Input cepat**.
3. Isi **Profil akun** jika ingin username/brand/niche masuk ke caption dan CSV.
4. Isi path/nama file video yang kamu punya hak pakai.
5. Klik **Generate** untuk membuat caption, hashtag, dan jadwal.
6. Pakai **Mode upload** untuk copy paket data, buka Shopee, lalu tandai item yang sudah upload.
7. Klik **Export CSV** jika perlu arsip data.

## Deploy ke Vercel

1. Upload folder ini ke GitHub.
2. Buka Vercel, pilih **Add New Project**.
3. Import repository ini.
4. Biarkan framework preset sebagai **Other** atau static project.
5. Deploy.

Tidak perlu build command dan tidak perlu output directory. `vercel.json` sudah mengarahkan Vercel untuk menyajikan `index.html` sebagai static website.

Lihat juga `DEPLOY_VERCEL.md` untuk setting singkatnya.

## Tentang scrape video

Tool ini tidak otomatis scrape atau download video dari Shopee. Pakai video yang kamu rekam sendiri, dari brand yang memberi izin, atau aset yang memang legal untuk digunakan dalam promosi affiliate.

Browser tidak mengizinkan website menyimpan path asli file video dari laptop. Karena itu tombol pilih video hanya mencatat nama dan ukuran file untuk antrian. Upload file video tetap dilakukan langsung di halaman Shopee saat kamu login manual.

## Tentang login Shopee

Tool ini menyediakan tombol untuk membuka portal resmi Shopee Affiliate (`https://affiliate.shopee.co.id/`). Login tetap dilakukan sendiri oleh pengguna di halaman Shopee. Tool ini tidak menyimpan username, password, OTP, cookie, atau session Shopee.

Profil akun hanya menyimpan data non-rahasia di browser kamu sendiri: username, nama brand/toko, email kontak, niche, dan template caption. Jangan masukkan password, OTP, cookie, token, atau data rahasia lain ke kolom profil.
