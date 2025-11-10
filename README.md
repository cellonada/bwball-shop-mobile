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

