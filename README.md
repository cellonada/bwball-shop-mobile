T U G A S 7
1.Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
Widget tree merupakan kumpulan widget yaitu elemen UI seperti teks, tombol, gambar, kolom, baris, dll. Dimana kumpulan widget tersebut saling bertingkat sehingga membentuk struktur seperti pohon, oleh karena itu disebut widget tree
Parent merupakan widget yang membungkus widget lain serta mengatur letaknya, sedangkan child widget merupakan bagian di dalam parent widget yang berisi konten. Sehingga hubungan anatara Parent-Child widget adalah untuk menemtukan akan seperti apa tampilannya serta perilaku UI yang terbentuk dari widget bersarang.

2.Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
-Widget Struktur merupakan kerangkan halaman, terdiri atas; 
    a.Material app -> root dari app Dlutter berbasis Material Design serta berfungsi menjadi parent dari seluruh widget lainnya
    b.Scaffold -> stuktur dasar masing-masing halaman, berfungsi menyediakan kerangka dasar halaman serta menjaga konsistensi tata letak antar halaman
    c.AppBar -> header suatu halaman, berfungsi menampilkan judul app seperti BWBall Shop serta menjadi navigasi dan informasi penting
-Widget Layout untuk mengatur posisi dan jarak antar elemen, terdiri atas
    a.Column -> menyusun child widget secara vertikal, berfungsi mengatur urutan tampilan seperti teks dan grid, misalnya seperti di dalam ItemCard untuk menyusun icon dan teks
    b.Center -> menempatkan child widget ke tengah layar secara vertikal dan horizonntal, berfungsi agar tampilan seimbang
    c.Padding -> memberi space di sekitar widget, berfungsi agar jarak antar elemen terlihat rapih dan tidak terlalu mepet ke tepi layar
    d.GridView.count ->  menampilkan beberapa widget dalam bentuk tabel kotak (grid), misalnya untuk 3 tombol utama sejajar dalam 3 kolom yang menggunakan crossAxisCount:3
    e.SizedBox -> memberikan space secara vertikal antar elemen
-Widget Tampilan untuk menampilkan elemen visual, terdiri atas;
    a.Text -> menampilkan text ke layar
    b.Icon -> menampilkan icon visual seperti gicon shopping bag dll
    c.Card -> widget khusus untuk membuat tampilan beberntuk card yang digunakan pada InfoCard untuk menampilkan informasi
    d.Container -> widget untuk mengatur ukuran, padding, hingga layout element yang digunakan pada InfoCard dan ItemCard
    e.Material -> memberi efek material desig seperti warna dan ripple effect saat ditekan, dimana setiap ItemCard memiliki efek (InkWell) secara benar
-Widget Interaksi untuk menangani event yg di lakukan user, terdiri atas;
    a.Inkwell -> widget interaktif yang memberikan efek saat user melakukan suatu event yaitu menekan tombol
    b.ScaffoldMessenger & SnackBar -> menampilkan notifikasi dan berisi pesan yang muncul saat user menekan tombol
-Widget Tema untuk mengatur warna dan style global, terdiri atas; 
    a.ThemeData & ColorScheme -> menentukan warna utama, sekunder, hingag background yang akan mempengaruhi tampilan seluruh widget

3.Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
Fungsi utama widget MaterialApp adalah sebagai widget utama untuk membangun sebuah aplikasi flutter dengan style dan design buatan Google, widget ini sering digunakan karena Flutter membangun UI secara hierarakis dari atas ke bawah. Oleh karena itu MaterialApp diletakkan paling atas sebagai root agar widget lain yang berada di bawahnya bisa mewariskan tema, warna, menggunkan navigasi dll, serta jika tidak meggukana MaterialApp beberapa widget seperti Scaffold, AppBar tidak akan berfungsi secara optimal

4.Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
StatelessWidget bersifat statis yaitu tampilang yang tidak akan berubah kecuali widget nya dibuat ulang dan lebih cocok digunakan untuk tampilan tetap misalnya seperti logo, label, judul. StatefulWidget bersifat dinamis dimana tampilannya tetap bisa berubah selagi runtime dan lebih cocok digunakan untuk tampilan yang perlu di perbaharui seperti tombol klik dan animasi

5.Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
BuildContext merupakan objek yang merepresentasikan posisi atau alamat suatu widget pada widget tree, dimana setiap widget pada flutter pasti memiliki BuildContext masing-masing. BuildContext penting di Flutter karena berfungsi membangun tampilan yang berbentuk widget tree. Selain itu BuildContext juga digunakan agar tiap widget dapat berkomunikasi dengan parentnya dan dapat mengambil data dari widget yang di atas.
Contoh penggunaan dalam metode build yaitu berada pada file main.dart pada class MyHomePage , dimana context dipakai untuk mengambil informasi dari widget yang lebih tinggi sedangkan tanpa adanya context widget tidak akan tau warna dan tema global halaman.

6.Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
Hot Reload merupakan fitur pada flutter yang dapat digunakan untuk melihat perubahan kode secara instan tanpa kehilangan state aplikasi. Biasanya hot reload digunakan untuk mengubah UI dan mengubah logika kecil di build(). Sedangkan Hot Restrat digunakan dengan memuat ulang seluruh aplikasi tanpa kompilasi penuh tetapi akan mengahpus state aplikassi.


T U G A S 8
1.Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
-Navigator.push() digunakan untuk membuka halaman baru di atas halaman yang saat ini sedang dibuka, oleh karena itu terdapat tombol back untuk kembali ke halaman lama. Stack digunakan untuk menumpuk halaman halaman ini, dimana halaman sebelumnya tetap berada di dalam stack
-Navigator.pushReplacement() digunakan untuk mengganti halaman yang sedang dibuka saat ini dengan halaman baru. Stack juga digunakan untuk menumpuk halaman, namun jika metode push() halaman sebelumnya tetap berada di stack, untuk metode pushReplacement() halaman sebelumnya akan terhapus dari stack sehingga kita tidak dapat kembali ke halaman sebelumnya setelah membuka halaman baru.
-Navigator.push() cocok digunakan ketika ingin berpindah-pindah halaman, misalnya dari home page ke add product dan sebaliknya (ada tombol back saat add product). Sedangkan Navigator.pushReplacement() cocok digunakan saat ingin berpindah halaman dan tidak perlu kembali, misalnya ketika login maupun logout


2.Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
Dalam membuat  aplikasi dengan flutter saya memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer tentunya untuk menjaga tampilan tetap konsisten dan untuk navigasi keseluruhan aplikasi. Dimana struktur hierarchy yang umum digunakan seperti di bawah ini
-Scaffold sebagai kerangka utama untuk menyediakan struktur dasar agar setiap halaman terlihat konsisten (memiliki layout yang sama)
-AppBar merupakan bagian atas halaman biasanya berisi Judul seperti "BWBall Shop", tombol navigasi otomatis, hingga beberapa icons
-Drawer merupakan menu yang berada di samping jika user menekan ikon garis tiga yang berada di AppBar, yaitu mempermudah untuk berganti halaman 

3.Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
Beberapa kelebihan menggunakan layout widget saat menampilkan elemen-elemen form adalah
-Padding untuk memberi jarak antar elemen agar terlihat rapi, tidak terlalu rapat, nyaman untuk di baca, contoh penggunaan di aplikasi saya yaitu "padding: const EdgeInsets.all(12)"
-SingleChildScrollView digunakan ketika form yang ada lebih panjang dari layar, dengan menggunakan ini user dapat scroll layar ke bawah untuk melihat keseluruhan form, serta bagian form tidak akan terpotong. Contoh penggunaan di aplikasi saya yaitu
"SingleChildScrollView(
  padding: const EdgeInsets.all(12),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextFormField(...),
      TextFormField(...),
      DropdownButtonFormField(...),
    ],
  ),
),"
-ListView merupakan perpaduan antara column dengan SingleChildScrollView dimana dengan ListView kita dapat scroll secara otomatis tanpa perlu membungkus dengan SingleChildScrollView. Contoh kegunaan di aplikasi saya yaitu untuk membuat halaman My Product

4.Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
Agar tampilan aplikasi saya yakni BWBall Shop memiliki identitas visual yang konsisten dengan brand toko adalah mendeklarasikan tema melalu ThemeDart yang berada di file main.dart, dimana saya telah set berbagai warna mulai dari warna utama, latar belakang, warna pendukung, warna dasarr, hingga warna untuk teksnya.

T U G A S 9
1.Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?
Kita perlu membuat model Dart untuk mengambil maupun mengirimkan data JSON karena
a.dengan menggunakan model maka setiap field memiliki tipe yang jelas sehingga jika JSON yg terkirim tipenya tidak sesuai akan langsung terdeteksi error
b.model akan meminta untuk mendefinisikan suatu filed merupakan field yang wajib atau opsional dimana hal ini digunakan sebagai null safety
c.Model menyediakan toJson untuk mengirimkan data serta fromJson untuk mengambil data, dengan menggunakan method tersebut maka parsing akan lebih konsisten dan terkontrol
d.Yang tidak kalah penting yaitu model memudahkan programer untuk memahami isi code tanpa perlu cek API secara berulang serta memudahkan programer untuk maintenance 

Jika tidak menggunakan model maka
a.tidak ada validasi tipe sehingga kesalahan hanya dapat diketahui jika aplikasi telah dijalankan 
b.jika tidak menggunakan model maka semua akan bersifat dynamic sehingga rawan terjadi Null
c.Kode lebih berantakan sehingga sukit di pahami dan lebih sulit untuk maintenance

2.Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.
Package http merupakan package umum yang digunakan untuk melakukan HTTP request seperti GET,POST,PUT,DELETE,PATCH, mengirim header,body json, from data. HTTP cocok digunakan untuk api rest yang tidak membutuhkan login session, csrf token, dan autentikais berbasis cookie
CookieRequest merupakan package yang dibuat khusus agar kompatibel dengan Django login system dimana ia memiliki fungsi menyimpan cookie session django secara otomatis, mengelola csrf token, menjaga state login.

Perbedaan antara HTTP dan CookieRequest yaitu
a.Session di http tidak otomatis terapi di CookieRequest otomatis
b.CSRF token dibuat secara manual namun di CookieRequest secara otomatis
c.Sifat HTTP adalah stateless sedangkan Cookierequest adalah stateful
d.HTTP lebih kompleks karena butuh banyak kode tambahan sedangkan CookieRequest lebih simple karna secara otomatis banyak field yg sudah terbuat

3.Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
Beberapa alasan yang membuat instance CookieRequest harus diterpakan untuk seluruh komponen di aplikasi flutter adalah
1.CookieRequest bersifat stateful, hal ini berarti cookie menyimpan sessionid dari Django, data user setelah login, csrf token, dll. Stateini dapat berubah ketika seoeang user berusaha login dan logout. Jika setiap page memiliki instance CookieRequest yg berada akan menyebabkan state berbeda beda sehingga menjadi tidak sinkron, hal ini bisa terlihat ketika seseorang login di halaman A tetapi belum di anggap login di halaman B
2.Django memerlukan auth dan csrf token yang konsisten, dimana kedua hal ini akan di simpan oleh CookieRequest. Jika tiap widget membuat instance baru maka CSRF dan session akan hilang dan membuat user dianggap logout serta request POST gagal di eksekusi
3.Terdapat prinsip single source of truth yang digunakan pada flutter, yakni untuk hal yang bersifat global seperti user profile session id serta authentication state harus dibuat menjadi satu objek global. Hal ini dilakukan agar semua widget dapat mengakses instance , state login konsisten, dan tidak perlu membuat CookieRequest yang baru


4.Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?
Agar flutter dapat berkomunikasi secara lancar dengan django maka kita perlu melakukan hal hal berikut
1.Menambahkan 10.0.2.2 ke ALLOWED_HOSTS di settings.py. Hal ini dilakukan karena django memiliki proteksi kemanan dimana hanya host yang terdapat di ALLOWED_HOSTS yang dapat mengakses ke server. Jika tidak di tambahkan maka Django akan menolak request dengan error 400 yaitu Bad Request
2.Mengaktifkan CORS, ketika flutter mencoba mengakses Django hal ini di anggap memiliki protokol dan domain yang berbeda. Oleh karena itu Django wajib mengizinkan origin tersebut melalui CORS. Jika CROS tidak di atur maka semua request dari flutter tidak dapat dijalankan dan akan menampilkan error seperti Network Error pada flutter
3.Mengatur CookieRequest, ketika menggunakan CookieRequest maka Django akan mengirimkan sessionid beserta csrftoken, namun karna cookie harus dikirim kepada lintas origin, maka perlu ada penyesuaian. Jika pengaturan cookie tidak sesuai maka session cookie tidak akan terkirim dan user akan di anggap selalu logout
4.Menambahkan izin akses internet di andorid, karena android tidak mengizinkan akses internet secara default, maka perlu melakukan pengaturan izin agar flutter dapat melalukan berbagai request. Jika tidak mengatur perizinan internet maka seluruh request dari flutter gagal untuk dijalankan

5.Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
Mekanisme pengiriman data mulai dari input hingga menjadi sebuah tampilan di flutter adalah
1.Pengguna mengisi data pada form flutter yang telah disediakan
2.Setelah semua data terisi user harus menekan tombol submit, selanjutnya ketika sudah menekan submit maka flutter akan mengirimkan data mentah
3.Flutter mengirimkan data mentah kepada API Django dengan menggunakan CookieRequest sehingga Django telah menerima data mentah
4.Django melakukan validasi data seperti data tidak kosong, format nya benar dll. Kemudian Django akan menyimpan ke dalam database dan akan mengembalikan JSON response
5.Flutter mengambil data (fetch) dari json response yg di kirimkan oleh django, kemudian melakukan mapping ke model agar mudah di pakai serta memastikan null safety . Langkah terakhir adalah flutter akan merender UI menggunakan ListView
 
6.Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
Mekanisme authentication mulai dari login, register, dan logout adalah
1.Register (User membuat akun baru)
User akan mengisi form register mulai dari username password dll dimana tidak boleh ada field yang kosong -> Flutter mengirimkan raw data ke Django -> Django memvalidasi data tersebut jika valid maka akan membuat akun baru dan mengembalikan JSON response -> Flutter menerima JSON dan akan menampilkan hasil -> Register selesai
2.Login (user yang telah terdaftar ingin masuk ke sebuah aplikasi)
User akan mengisi form login kemudian CookieRequest akan mengirimkan POST ke Django -> Django mengembalikan session cookie beserta CSRF cookie kedua hal ini akan disimpan secara otomatis oleh CookieRequest -> Django akan melakukan validasi data -> Jika valid Django memanggil login(request, user), membuat session, mengirimkan Set-Cookie, dan memberikan JSON response -> CookieRequest menerima cookie session & CSRF -> mengubah CookieRequest.loggedIn menjadi true sehingga Flutter mengetahui bahwa user berhasil login -> Flutter menampilkan halaman utama
3.Logout (User ingin keluar dari akun pada aplikasi)
User akan menekan tombol logout yang kemudian flutter akan menggunakan CookieRequest untuk meminta logout -> Django akan menghapus session dari user tersebut -> CookieRequest yang menerima request akan menghapus session id & CSRF token seta mengatur loggedIn menjadi false -> logout berhasil dan flutter akan mengembalikan ke halaman login/halaman yang sesuai dengan pengaturannya

7.Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
-Membuat aplikasi baru yait authentication pada django dan mengatur beberapa di settings.py seperti di installed_apps, middleware, allowed_host, dan menambah beberap variabel untuk cors, csrf, dan session cookie.
-Menambahkan function untuk login dan register pada views.py di direktori authentication
-Menambahkan path url pada urls.py di direktori authentication.
-Menginstal  cors-headers pada Django
-Menginstal beberapa package untuk flutter seperti provider dan django auth
-Mengubah root widget pada main.dart untuk menyediakan cookie request ke semua library menggunakan provider
-Membuat tampilan login dan register dart pada direktori screen di flutter
-Membuat model custom dengan menggunakan quicktype dan copy code yang telah dihasilkan oleh quicktype kedalam product_entry.dart di direktori models
-Menambahkan dependensi HTTP atau internet pada file android
-Untuk megatasi masalah CORS pada gambar tambahkan fungsi baru di views.py yaitu proxy_image dan tambahkan keadalam path urls.py di direktori main
-Membuat berkas product_entry_card pada direktori widget, product_entry_list & product_detail pada direktori screen, serta mengubah fungsi all products pada product_card.dart
-Pada views.py di django tambahkan fungsi untuk membuat product flutter dan tambahkan path nya ke urls.py di direktori main
-Membuat filtering untuk memisahkan antara all product dan my product, serta mmebuat filtering terhap produk produk favorit di bagian product_entry_list. Jika user menekan tombol all product/my product/favorite baik di home page maupun pada drawer kiri maka halaman yang tampil akan terfilter sesuai dengan yang di pilih user


