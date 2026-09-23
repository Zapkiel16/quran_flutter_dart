# 📖 Al-Qur'an Flutter

Aplikasi mobile Al-Qur'an sederhana yang dibuat menggunakan **Flutter**. Aplikasi ini mengambil data surah dan ayat Al-Qur'an secara langsung melalui API **Al Quran Cloud**.

Project ini dibuat sebagai bagian dari pembelajaran pengembangan aplikasi mobile menggunakan Flutter dan REST API.

## ✨ Fitur

* 📚 Menampilkan daftar 114 surah Al-Qur'an
* 🔢 Menampilkan nomor surah
* 🕌 Menampilkan nama surah dalam bahasa Arab
* 🌎 Menampilkan nama surah dalam bahasa Inggris
* 📖 Menampilkan jumlah ayat setiap surah
* 📜 Mengambil detail dan ayat dari surah melalui API
* 🌐 Menggunakan REST API
* ⚡ HTTP request menggunakan Dio
* 🎨 Antarmuka menggunakan Flutter Material Design

## 🛠️ Teknologi yang Digunakan

| Teknologi | Keterangan                 |
| --------- | -------------------------- |
| Flutter   | Framework aplikasi mobile  |
| Dart      | Bahasa pemrograman         |
| Dio       | HTTP client untuk REST API |
| REST API  | Sumber data Al-Qur'an      |
| SVG       | Ikon pada aplikasi         |

## 🌐 API

Aplikasi menggunakan:

**Al Quran Cloud API**

Base URL:

```text
https://api.alquran.cloud/v1
```

### Endpoint Daftar Surah

```text
GET /surah
```

Full URL:

```text
https://api.alquran.cloud/v1/surah
```

Endpoint ini digunakan untuk mengambil daftar 114 surah.

### Endpoint Detail Surah

```text
GET /surah/{nomor}/quran-uthmani
```

Contoh untuk Al-Fatihah:

```text
https://api.alquran.cloud/v1/surah/1/quran-uthmani
```

Endpoint ini digunakan untuk mengambil ayat-ayat dari surah tertentu.

## 📁 Struktur Project

```text
lib/
├── main.dart
├── homepage.dart
├── remote_resource.dart
├── surah_model.dart
└── detail_surah_model.dart
```

### `main.dart`

File utama untuk menjalankan aplikasi Flutter.

### `homepage.dart`

Berisi tampilan halaman utama yang menampilkan daftar surah.

### `remote_resource.dart`

Berfungsi sebagai penghubung antara aplikasi dengan API Al Quran Cloud menggunakan Dio.

Contoh request:

```dart
final response = await dio.get('/surah');
```

### `surah_model.dart`

Berisi model data untuk response daftar surah.

Model ini digunakan untuk membaca data seperti:

```text
number
name
englishName
englishNameTranslation
numberOfAyahs
revelationType
```

### `detail_surah_model.dart`

Berisi model untuk data detail surah dan ayat.

Model ini terdiri dari:

```text
SurahDetailModel
SurahDetailData
Ayah
```

## 🔄 Alur Data

```text
Flutter Application
       │
       ▼
   HomePage
       │
       ▼
RemoteResource
       │
       ▼
     Dio
       │
       ▼
Al Quran Cloud API
       │
       ▼
   JSON Response
       │
       ▼
    Model Class
       │
       ▼
     HomePage
       │
       ▼
Daftar Surah
```

Untuk detail surah:

```text
User memilih Surah
       │
       ▼
fetchSurahDetail()
       │
       ▼
/surah/{nomor}/quran-uthmani
       │
       ▼
JSON Response
       │
       ▼
SurahDetailModel
       │
       ▼
Daftar Ayat
```

## 🚀 Cara Menjalankan Project

### 1. Clone Repository

```bash
git clone <URL_REPOSITORY>
```

Masuk ke folder project:

```bash
cd quran_flutter
```

### 2. Install Dependencies

Jalankan:

```bash
flutter pub get
```

### 3. Jalankan Aplikasi

```bash
flutter run
```

Atau jalankan melalui Android Studio / Visual Studio Code.

## 📦 Dependencies

Pastikan package berikut terdapat di `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter

  dio: ^5.0.0
  flutter_svg: ^2.0.0
```

Versi package dapat disesuaikan dengan versi Flutter yang digunakan.

## 🖼️ Tampilan Aplikasi

Halaman utama menampilkan daftar surah dalam bentuk card.

Setiap card menampilkan:

```text
┌──────────────────────────────────┐
│       1        Al-Faatiha       │
│                The Opening       │
│                    الفاتحة       │
│                       7 Ayat     │
└──────────────────────────────────┘
```

## 🔮 Pengembangan Selanjutnya

Beberapa fitur yang dapat ditambahkan:

* [ ] Halaman detail surah
* [ ] Menampilkan seluruh ayat
* [ ] Terjemahan Bahasa Indonesia
* [ ] Audio bacaan Al-Qur'an
* [ ] Pemutar audio per ayat
* [ ] Pencarian surah
* [ ] Bookmark ayat
* [ ] Riwayat bacaan
* [ ] Dark mode
* [ ] Pilihan qari
* [ ] Tafsir ayat
* [ ] Notifikasi pengingat membaca Al-Qur'an

## ⚠️ Catatan

Aplikasi membutuhkan koneksi internet untuk mengambil data dari API.

Jika API tidak dapat diakses, daftar surah atau detail ayat mungkin tidak dapat ditampilkan.

## 👨‍💻 Developer

**Sean Ryan Al Dziqri**

Project pembelajaran Flutter dan REST API.

## 📄 License

Project ini dibuat untuk tujuan pembelajaran dan pengembangan aplikasi Flutter.

Data Al-Qur'an diperoleh melalui **Al Quran Cloud API**.
