# MyPortfolio Mobile

Aplikasi mobile multiplatform berbasis Flutter sebagai bagian dari ekosistem portofolio pribadi mata kuliah Pemrograman Berbasis Platform (PBP) Semester Gasal 2026/2027.

- **Nama:** Muhammad Syarifudin
- **NPM:** 2506657112
- **Kelas:** PBP B

---

## Panduan Setup & Menjalankan Proyek Lokal

1. Pastikan **Flutter SDK** sudah terpasang dan terdaftar pada `PATH` sistem (`flutter doctor` tidak menampilkan kendala pada toolchain target).
2. Clone repositori ini:
   ```bash
   git clone [https://github.com/msyarifudin541-del/myportofolio_mobile.git](https://github.com/msyarifudin541-del/myportofolio_mobile.git)
   cd myportofolio_mobile
   ```
3. Unduh dependensi proyek:
   ```bash
   flutter pub get
   ```
4. Jalankan aplikasi pada Google Chrome atau perangkat target yang tersedia:
   ```bash
   flutter run -d chrome
   ```

---

### Tugas 7

1. **Jelaskan apa yang dimaksud dengan *widget tree* pada Flutter dan bagaimana hubungan induk-anak (*parent-child*) bekerja antar-widget!**
   - ***Widget tree*** adalah struktur hierarkis berbentuk pohon (*tree*) yang merepresentasikan seluruh susunan komponen antarmuka pengguna (UI) dalam aplikasi Flutter. Di Flutter, hampir setiap elemen—mulai dari tata letak (*layout*), warna tema, teks, hingga tombol interaksi—adalah sebuah widget.
   - **Hubungan induk-anak (*parent-child*)** bekerja berdasarkan prinsip penyaluran batasan ukuran (*constraints*) dan konteks dari atas ke bawah, serta pelaporan ukuran dari bawah ke atas (*"Constraints go down. Sizes go up. Parent sets position."*):
     - Widget *parent* (misalnya `Container` atau `Row`) memberikan batasan ukuran minimum dan maksimum kepada widget *child*-nya.
     - Widget *child* menentukan ukurannya sendiri di dalam batasan tersebut dan melaporkannya kembali ke *parent*.
     - Widget *parent* kemudian mengatur posisi koordinat penempatan *child* di layar. Selain tata letak, data konfigurasi global seperti tema (`Theme`) juga mengalir secara hierarkis dari *parent* ke seluruh *child* di bawahnya.

2. **Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya masing-masing!**
   - **`MaterialApp`**: Root widget aplikasi yang membungkus keseluruhan antarmuka dengan konfigurasi Material Design, judul aplikasi, tema warna, serta rute halaman utama.
   - **`Scaffold`**: Menyediakan kerangka tata letak standar halaman Material Design, meliputi `AppBar` di bagian atas, `body` utama, serta dukungan lapisan tampilan `SnackBar`.
   - **`AppBar`**: Menampilkan bilah navigasi header di bagian atas layar yang memuat judul halaman (`MyPortfolio`) dan warna latar tema utama.
   - **`SingleChildScrollView`**: Membungkus konten layar agar dapat digulir (*scroll*) secara vertikal sehingga mencegah terjadinya *pixel overflow* pada perangkat dengan layar kecil.
   - **`Padding`**: Memberikan ruang jarak (*whitespace*) di sekeliling widget *child* agar elemen tidak menempel langsung ke tepi layar atau widget lainnya.
   - **`Column`**: Menyusun daftar widget *child* secara vertikal dari atas ke bawah.
   - **`Row`**: Menyusun daftar widget *child* secara horizontal dari kiri ke kanan (digunakan untuk menampilkan 3 `InfoCard` secara sejajar).
   - **`Card`**: Menampilkan wadah panel bergaya Material dengan efek bayangan (*elevation*) dan sudut membulat untuk menampung informasi profil.
   - **`Container`**: Widget kotak serbaguna yang digunakan untuk mengatur lebar proporsional (`MediaQuery`) serta *internal padding* di dalam kartu.
   - **`SizedBox`**: Memberikan jarak pemisah kosong dengan dimensi tinggi/lebar tetap antar-widget.
   - **`Center`**: Memposisikan widget *child* tepat di tengah area yang tersedia pada *parent*-nya.
   - **`Text`**: Menampilkan string teks ke layar dengan pengaturan gaya tipografi (`TextStyle`) seperti ukuran font, ketebalan, dan warna.
   - **`GridView.count`**: Menyusun daftar kartu tombol aksi (`ItemCard`) ke dalam tata letak kisi (*grid*) dengan jumlah kolom tetap (`crossAxisCount: 3`).
   - **`Material`**: Komponen dasar kanvas Material yang merender warna latar unik tiap tombol (`item.color`) dan radius sudut melengkung (`BorderRadius`).
   - **`InkWell`**: Menambahkan area interaktif yang mendeteksi sentuhan pengguna (`onTap`) sekaligus menampilkan efek visual riak air (*ripple effect*) khas Material Design.
   - **`Icon`**: Menampilkan ikon grafis vektor bawaan Flutter (`Icons.folder_special`, `Icons.add_circle`, dan `Icons.logout`).
   - **`SnackBar`** (via `ScaffoldMessenger`): Menampilkan bilah notifikasi sementara di bagian bawah layar sebagai umpan balik visual saat pengguna menekan salah satu tombol aksi.

3. **Apa fungsi dari widget `MaterialApp`? Jelaskan mengapa widget ini umumnya digunakan sebagai root widget pada aplikasi Flutter!**
   - `MaterialApp` berfungsi sebagai pembungkus tingkat atas (*top-level wrapper*) yang mengonfigurasi sistem desain Material Google ke seluruh aplikasi, mencakup manajemen navigasi halaman (`Navigator`), pengelolaan tema global (`ThemeData`), lokalisasi bahasa, serta penyediaan konteks untuk lapisan overlay seperti `SnackBar` dan dialog.
   - Widget ini digunakan sebagai *root widget* karena hampir seluruh widget UI standar Flutter (seperti `Scaffold`, `AppBar`, `Card`, `InkWell`, dan `SnackBar`) bergantung pada konteks yang disediakan oleh `MaterialApp` (seperti `Theme` dan `ScaffoldMessenger`) agar dapat dirender dan berfungsi tanpa error.

4. **Jelaskan perbedaan antara `StatelessWidget` dan `StatefulWidget`! Kapan kita sebaiknya memilih `StatelessWidget` dan kapan harus menggunakan `StatefulWidget`?**
   - **`StatelessWidget`** adalah widget yang bersifat *immutable* (tidak dapat diubah setelah dibangun). Widget ini tidak menyimpan variabel status (*state*) internal yang berubah selama siklus hidupnya; tampilannya hanya bergantung pada parameter konfigurasi yang dikirimkan lewat konstruktor saat pertama kali dibuat.
   - **`StatefulWidget`** adalah widget dinamis yang terhubung dengan objek `State` terpisah yang bersifat *mutable*. Ketika data internal di dalam `State` berubah dan metode `setState()` dipanggil, Flutter akan menjalankan ulang metode `build()` untuk memperbarui tampilan antarmuka secara reaktif.
   - **Kapan memilihnya:**
     - Pilih **`StatelessWidget`** ketika tampilan komponen bersifat statis dan tidak berubah karena interaksi internal di dalam widget itu sendiri (contoh: halaman menu statis, kartu informasi `InfoCard`, atau kartu tombol `ItemCard`).
     - Pilih **`StatefulWidget`** ketika antarmuka perlu merespons perubahan data secara langsung di layar (contoh: halaman *form* input pengguna, tombol penghitung *counter*, *checkbox*, atau tab navigasi aktif).

5. **Apa itu `BuildContext` dan mengapa penting di Flutter? Bagaimana penggunaannya di dalam metode `build`?**
   - `BuildContext` adalah objek referensi yang merepresentasikan lokasi spesifik sebuah widget di dalam struktur *widget tree*. Setiap widget memiliki objek `BuildContext`-nya sendiri.
   - `BuildContext` sangat penting karena menjadi jembatan bagi sebuah widget untuk berinteraksi dengan widget leluhur (*ancestor*) yang berada di atasnya dalam hierarki pohon—misalnya untuk mengambil warna tema aplikasi, membaca dimensi layar perangkat, atau memunculkan notifikasi pada `Scaffold` terdekat.
   - **Penggunaan di dalam metode `build(BuildContext context)`:** Parameter `context` diteruskan ke metode `build` agar widget dapat memanggil metode statis berbasis konteks seperti `Theme.of(context)` (mengambil skema warna tema), `MediaQuery.of(context)` (menghitung lebar layar pada `InfoCard`), dan `ScaffoldMessenger.of(context)` (menampilkan `SnackBar` saat `ItemCard` ditekan).

6. **Jelaskan konsep *hot reload* di Flutter dan apa perbedaannya dengan *hot restart*! Kapan kita tidak bisa hanya mengandalkan *hot reload* dan harus melakukan *hot restart* atau *full restart*?**
   - ***Hot Reload*** bekerja dengan cara menyuntikkan berkas kode sumber Dart yang baru dimodifikasi ke dalam *Dart Virtual Machine* (VM) yang sedang berjalan. Setelah VM memperbarui kelas dan fungsi, framework Flutter secara otomatis membangun ulang *widget tree* dengan tetap mempertahankan nilai *state* aplikasi saat itu. Proses ini berlangsung sangat cepat (kurang dari 1 detik).
   - ***Hot Restart*** memuat ulang seluruh kode aplikasi ke dalam Dart VM dan memulai ulang eksekusi program dari awal (`main()`), sehingga seluruh *state* aplikasi direset kembali ke kondisi awal, namun tanpa mengompilasi ulang kode native (Android/iOS) atau menutup emulator/perangkat.
   - **Kapan *Hot Reload* tidak cukup (harus *Hot Restart* atau *Full Restart*):**
     - **Harus *Hot Restart*:** Ketika mengubah inisialisasi *state* awal pada `StatefulWidget`, mengubah nilai variabel global/`static`, memodifikasi fungsi `main()`, atau mengubah tipe widget dari `StatelessWidget` menjadi `StatefulWidget` (maupun sebaliknya).
     - **Harus *Full Restart* (stop dan `flutter run` ulang):** Ketika menambahkan aset baru (gambar/font) atau pustaka dependensi baru di `pubspec.yaml`, maupun saat mengubah konfigurasi kode native di folder `android/` atau `ios/`.

---

#### AI Disclosure & Keterbatasan Penggunaan AI

- **Tools AI yang Digunakan:** Google Gemini.
- **Strategi Prompting & Bagian yang Dibantu:**
  - Mengirimkan tangkapan layar spesifikasi *Individual Assignment 7* dan rubrik penilaian untuk menyusun pembaruan kode dari basis *Tutorial 08*.
  - Meminta bantuan penyusunan struktur modular kelas `ItemHomepage` agar menyimpan properti `Color` secara langsung tanpa percabangan `if-else` berulang pada `ItemCard`.
  - Meminta penyusunan draf jawaban pertanyaan reflektif teknis mengenai arsitektur widget Flutter untuk dokumentasi `README.md`.
- **Analisis Kritis & Penyesuaian Manual:**
  - *Keterbatasan AI:* Pada saran awal, tata letak `Column` utama belum menggunakan pembungkus `SingleChildScrollView` dan properti `primary` pada `GridView.count` masih bernilai `true`, yang berpotensi memicu konflik *scroll* maupun *pixel overflow* ketika diuji pada layar ponsel berukuran kecil.
  - *Perbaikan Manual:* Menambahkan pembungkus `SingleChildScrollView`, mengatur `primary: false` pada `GridView.count`, menyesuaikan identitas diri asli (Muhammad Syarifudin / 2506657112 / PBP B), memilih palet warna kontras (`Colors.blue.shade700`, `Colors.green.shade700`, `Colors.red.shade700`), serta menjalankan verifikasi `flutter analyze` secara mandiri untuk memastikan nihil peringatan maupun kesalahan sintaksis.