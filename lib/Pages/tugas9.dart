import 'package:flutter/material.dart';

// Class ini digunakan untuk membuat bentuk data produk.
class Produk {
  // Nama produk.
  final String nama;

  // Deskripsi produk.
  final String deskripsi;

  // Gambar produk.
  String gambar;

  // Constructor untuk mengisi data produk.
  Produk({
    required this.nama,
    required this.deskripsi,
    required this.gambar,
  });
}
// Class utama yang akan dipanggil dari main.dart.
class Tugas9 extends StatelessWidget {
  const Tugas9({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // Ada 3 tab karena tugas memiliki 3 pendekatan.
      length: 3,

      child: Scaffold(
        // AppBar bagian atas.
        appBar: AppBar(
          // Judul aplikasi.
          title: const Text('Tugas 9 - Kategori Produk'),

          // Membuat 3 tab.
          bottom: const TabBar(
            tabs: [
              // Tab pertama untuk List.
              Tab(text: 'List'),

              // Tab kedua untuk Map.
              Tab(text: 'Map'),

              // Tab ketiga untuk Model.
              Tab(text: 'Model'),
            ],
          ),
        ),

        // Isi dari masing-masing tab.
        body: TabBarView(
          children: [
            // Tab 1.
            HalamanList(),

            // Tab 2.
            HalamanMap(),

            // Tab 3.
            HalamanModel(),
          ],
        ),     
      ),
    );
  }
}
// Class untuk menampilkan data menggunakan List biasa.
class HalamanList extends StatelessWidget {
  const HalamanList({super.key});

  // Membuat List berisi 10 nama kategori.
  final List<String> kategori = const [
    'Buah-buahan',
    'Sayuran',
    'Elektronik',
    'Pakaian Pria',
    'Pakaian Wanita',
    'Alat Tulis Kantor',
    'Buku & Majalah',
    'Peralatan Dapur',
    'Makanan Ringan',
    'Minuman',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // Jumlah data yang akan ditampilkan.
      itemCount: kategori.length,

      // Membuat setiap item.
      itemBuilder: (context, index) {
        return ListTile(
          // Menampilkan nama kategori.
          title: Text(kategori[index]),
        );
      },
    );
  }
}
// Class untuk menampilkan data menggunakan List<Map>.
class HalamanMap extends StatelessWidget {
  const HalamanMap({super.key});

  // Membuat List yang berisi Map.
  final List<Map<String, dynamic>> kategori = const [
    {
      'nama': 'Buah-buahan',
      'icon': Icons.apple,
    },
    {
      'nama': 'Sayuran',
      'icon': Icons.eco,
    },
    {
      'nama': 'Elektronik',
      'icon': Icons.devices,
    },
    {
      'nama': 'Pakaian Pria',
      'icon': Icons.man,
    },
    {
      'nama': 'Pakaian Wanita',
      'icon': Icons.woman,
    },
    {
      'nama': 'Alat Tulis Kantor',
      'icon': Icons.edit,
    },
    {
      'nama': 'Buku & Majalah',
      'icon': Icons.book,
    },
    {
      'nama': 'Peralatan Dapur',
      'icon': Icons.kitchen,
    },
    {
      'nama': 'Makanan Ringan',
      'icon': Icons.fastfood,
    },
    {
      'nama': 'Minuman',
      'icon': Icons.local_drink,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // Jumlah data berdasarkan panjang List.
      itemCount: kategori.length,

      // Membuat setiap item.
      itemBuilder: (context, index) {
        return ListTile(
          // Icon berada di sebelah kiri.
          leading: Icon(kategori[index]['icon']),

          // Nama kategori.
          title: Text(kategori[index]['nama']),
        );
      },
    );
  }
}
// Class untuk menampilkan produk berdasarkan Model.
class HalamanModel extends StatelessWidget {
   HalamanModel({super.key});

  // Membuat 10 data produk menggunakan class Produk.
  final List<Produk> produk = [
    Produk(
      nama: 'Apel',
      deskripsi: 'Buah apel segar dan manis.',
      gambar: 'assets/images/apel.jpg',
    ),
    Produk(
      nama: 'Pisang',
      deskripsi: 'Pisang segar cocok untuk camilan.',
      gambar: 'assets/images/pisang.jpg',
    ),
    Produk(
      nama: 'Jeruk',
      deskripsi: 'Jeruk segar dengan rasa manis dan sedikit asam.',
      gambar: 'assets/images/jeruk.jpg',
    ),
    Produk(
      nama: 'Mangga',
      deskripsi: 'Mangga matang dengan rasa manis.',
      gambar: 'assets/images/mangga.jpg',
    ),
    Produk(
      nama: 'Semangka',
      deskripsi: 'Semangka segar dan banyak mengandung air.',
      gambar: 'assets/images/semangka.jpg',
    ),
    Produk(
      nama: 'Melon',
      deskripsi: 'Melon manis dan menyegarkan.',
      gambar: 'assets/images/melon.jpg',
    ),
    Produk(
      nama: 'Anggur',
      deskripsi: 'Anggur segar dengan rasa manis.',
      gambar: 'assets/images/anggur.jpg',
    ),
    Produk(
      nama: 'Nanas',
      deskripsi: 'Nanas segar dengan rasa manis dan sedikit asam.',
      gambar: 'assets/images/nanas.jpg',
    ),
    Produk(
      nama: 'Pepaya',
      deskripsi: 'Pepaya matang yang lembut dan manis.',
      gambar: 'assets/images/pepaya.jpg',
    ),
    Produk(
      nama: 'Stroberi',
      deskripsi: 'Stroberi segar dengan rasa manis dan asam.',
      gambar: 'assets/images/stroberi.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // Jumlah produk.
      itemCount: produk.length,

      // Membuat setiap item produk.
      itemBuilder: (context, index) {
        // Mengambil data produk berdasarkan index.
        final item = produk[index];

        return ListTile(
          // Gambar produk di sebelah kiri.
          leading: Image.asset(
            item.gambar,

            // Mengatur ukuran gambar.
            width: 60,
            height: 60,

            // Agar gambar memenuhi ukuran yang diberikan.
            fit: BoxFit.cover,

            // Jika gambar belum ada, tampilkan icon.
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.image);
            },
          ),

          // Nama produk.
          title: Text(item.nama),

          // Deskripsi produk.
          subtitle: Text(item.deskripsi),
        );
      },
    );
  }
}