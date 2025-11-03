T U G A S 6
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