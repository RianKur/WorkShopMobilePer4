import 'package:flutter/material.dart'; //package material flutter

class StateTeksUtama extends State<TeksUtama> {
  // List Makanan yang dtiampilkan dalam aplikasi
  var listMakanan = [
    'Nasi Goreng', 'Lotek', 'Geprek', 'Gado-Gado',
    'Rawon', 'Soto Lamongan', 'Kol Goreng', 'Ayam Goreng'
  ];
  // List Minuman yang ditampilkan pada aplikasi
  var listMinum = [
    'Nutri Sari', 'Susu Jahe', 'Air Putih', 'Susu Putih',
    'Coklat Panas', 'Kopi', 'Jahe Panas', 'Teh'
  ];
  // List warna huruf/font yang ditampilkan pada aplikasi
  var listWarna = [
    Colors.red, Colors.purple, Colors.teal, Colors.lime,
    Colors.indigo, Colors.deepPurple, Colors.cyan,
    Colors.blue, Colors.yellow
  ];
  int index = 0; //inisialisasi index awal dimulai dari nol

  // Fungsi IncrementIndex() untuk tombol Refresh/Random
  void incrementIndex () {
    setState(() {
      index++;
    });
  }

  @override
  // Deklarasi Widget build yang berfungsi untuk membuat statefull widget yang menampilkan tampilan box, dekorasi box, dan text
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50), // Membuat Padding Box
      margin: EdgeInsets.all(20), // Membuat Margin Box

      // Membuat Dekorasi Box/Card
      decoration: BoxDecoration(
        color: Colors.cyan[50], // Membuat Color Box
        borderRadius: BorderRadius.circular(5), // Membuat Border Radius
        
        // Membuat Bayangan pada Box/Card
        boxShadow: [BoxShadow(
          color: Colors.black12,
          spreadRadius: 2,
          offset: Offset.fromDirection(-5.5, 6.0),
          blurRadius: 2
        )]
      ),
      
      // Membuat tampilan pada body
      child: Column(
        children: [
          Text(
            'Makan apa hari ini?',
            textDirection: TextDirection.ltr, // Dekorasi Text
          ),
          Text(
            listMakanan[index % listMakanan.length], // Menampilkan List Makanan berdasarkan index array
            textDirection: TextDirection.ltr, // Dekorasi Text
            style: TextStyle(
              fontSize: 25, // Ukuran Huruf/Font
              fontWeight: FontWeight.bold, // Jenis Font
              color: listWarna[index % listWarna.length] // Menampilkan List Makanan dengan listWarna berdasarkan index array
            ),
          ),
          Text(
            'Minum apa hari ini?',
            textDirection: TextDirection.ltr, // Dekorasi Text
          ),
          Text(
            listMinum[index % listMinum.length], // Menampilkan List Minuman berdasarkan index array
            textDirection: TextDirection.ltr, // Dekorasi Text
            style: TextStyle(
              fontSize: 25, // Ukuran Huruf/Font
              fontWeight: FontWeight.bold, // Jenis Font
              color: listWarna[index % listWarna.length] // Menampilkan List Minuman dengan listWarna berdasarkan index array
            ),
          ),
        ],
      )
    );
  }

}

// Deklarasi kelas TeksUtama dengan parents StatefulWidget
class TeksUtama extends StatefulWidget {

  final state = StateTeksUtama(); // inisialisasi function StateTeksUtama()

  @override
  State<StatefulWidget> createState() => state;
}

void main() {
  TeksUtama teksUtama = TeksUtama(); // Memanggil kelas TeksUtama pada fungsi utama main()

  runApp(
    MaterialApp(
      title: 'Ryan App', // Deklarasi Nama aplikasi
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Warung Ryan'), // Judul/Heading Nama aplikasi
        ),
        body: Center(
          child: Column(
            children: [
              teksUtama // deklarasi kelas teksUtama sebagai children class pada body
            ],
          ),
        ),

        // Inisialisasi function untuk Icon Refresh
        floatingActionButton: FloatingActionButton(
          tooltip: 'Random',
          child: Icon(Icons.refresh),
          onPressed: teksUtama.state.incrementIndex,
        ),
      )
    )
  );
}