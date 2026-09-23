import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'model/cocktail_model.dart';
import 'services/cocktail_service.dart';

// Class halaman utama untuk Tugas 14.
// StatefulWidget digunakan karena halaman ini akan mengambil data
// secara asynchronous dari API.
class Tugas14Page extends StatefulWidget {
  // Constructor dari Tugas14Page.
  const Tugas14Page({super.key});

  // Membuat State dari Tugas14Page.
  @override
  State<Tugas14Page> createState() => _Tugas14PageState();
}

// State dari Tugas14Page.
class _Tugas14PageState extends State<Tugas14Page> {
  // Membuat object service untuk mengambil data dari API.
  final CocktailService _cocktailService = CocktailService(Dio());

  @override
  Widget build(BuildContext context) {
    // Scaffold digunakan sebagai struktur dasar halaman.
    return Scaffold(
      // AppBar adalah bagian atas halaman.
      appBar: AppBar(
        // Judul halaman.
        title: const Text('Cocktail List'),

        // Membuat judul berada di tengah.
        centerTitle: true,
      ),

      // FutureBuilder digunakan untuk menangani proses asynchronous.
      //
      // Saat API masih loading:
      // akan menampilkan CircularProgressIndicator.
      //
      // Jika terjadi error:
      // akan menampilkan pesan error.
      //
      // Jika berhasil:
      // akan menampilkan ListView.builder.
      body: FutureBuilder<CocktailModel>(
        // Memanggil method fetchData() dari service.
        future: _cocktailService.fetchData('margarita'),

        // Builder akan dipanggil setiap kali kondisi Future berubah.
        builder: (BuildContext context, AsyncSnapshot<CocktailModel> snapshot) {
          // ----------------------------------------------------------
          // KONDISI 1: LOADING
          // ----------------------------------------------------------
          //
          // Jika data belum selesai diambil dari API,
          // snapshot.connectionState akan bernilai waiting.
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Center digunakan supaya loading berada di tengah layar.
            return const Center(
              // CircularProgressIndicator adalah loading indicator.
              child: CircularProgressIndicator(),
            );
          }

          // ----------------------------------------------------------
          // KONDISI 2: ERROR
          // ----------------------------------------------------------
          //
          // Jika terjadi error ketika mengambil data dari API,
          // snapshot.hasError akan bernilai true.
          if (snapshot.hasError) {
            // Menampilkan pesan error kepada user.
            return Center(
              // Column digunakan untuk menampilkan beberapa widget
              // secara vertikal.
              child: Column(
                // Membuat isi berada di tengah secara vertikal.
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  // Icon error.
                  const Icon(Icons.error_outline, size: 50, color: Colors.red),

                  // Memberikan jarak antara icon dan text.
                  const SizedBox(height: 10),

                  // Menampilkan pesan error.
                  Text(
                    'Terjadi kesalahan:\n${snapshot.error}',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }

          // ----------------------------------------------------------
          // KONDISI 3: DATA BERHASIL
          // ----------------------------------------------------------
          //
          // Jika data berhasil diambil,
          // kita ambil data dari snapshot.
          final cocktails = snapshot.data?.drinks ?? [];

          // Jika API berhasil tetapi tidak mengembalikan data,
          // tampilkan pesan bahwa data kosong.
          if (cocktails.isEmpty) {
            return const Center(child: Text('Data cocktail tidak ditemukan.'));
          }

          // ----------------------------------------------------------
          // MENAMPILKAN DATA
          // ----------------------------------------------------------
          //
          // ListView.builder digunakan untuk membuat daftar
          // cocktail secara dinamis berdasarkan jumlah data dari API.
          return ListView.builder(
            // Jumlah item yang akan dibuat.
            itemCount: cocktails.length,

            // Builder untuk setiap item dalam list.
            itemBuilder: (BuildContext context, int index) {
              // Mengambil satu data cocktail berdasarkan index.
              final Cocktail cocktail = cocktails[index];

              // Card digunakan untuk membuat tampilan
              // setiap cocktail seperti sebuah kartu.
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),

                child: InkWell(
                  // Ketika Card ditekan
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          // Judul menggunakan nama cocktail
                          title: Text(cocktail.strDrink ?? 'Unknown'),

                          // Isi detail
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Gambar cocktail
                              if (cocktail.strDrinkThumb != null &&
                                  cocktail.strDrinkThumb!.isNotEmpty)
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    cocktail.strDrinkThumb!,
                                    width: 220,
                                    height: 180,
                                    fit: BoxFit.cover,
                                  ),
                                ),

                              const SizedBox(height: 12),

                              // Kategori
                              Text(
                                'Kategori: ${cocktail.strCategory ?? 'Tidak tersedia'}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 8),

                              // Jenis minuman
                              Text(
                                'Tipe: ${cocktail.strAlcoholic ?? 'Tidak tersedia'}',
                              ),

                              const SizedBox(height: 8),

                              // Jenis gelas
                              Text(
                                'Gelas: ${cocktail.strGlass ?? 'Tidak tersedia'}',
                              ),
                            ],
                          ),

                          // Tombol tutup
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Tutup'),
                            ),
                          ],
                        );
                      },
                    );
                  },

                  // ====================================================
                  // INI YANG TADI HILANG
                  // ====================================================
                  child: Padding(
                    padding: const EdgeInsets.all(12),

                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        // ==========================================
                        // GAMBAR COCKTAIL
                        // ==========================================
                        if (cocktail.strDrinkThumb != null &&
                            cocktail.strDrinkThumb!.isNotEmpty)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),

                            child: Image.network(
                              cocktail.strDrinkThumb!,

                              width: 100,
                              height: 100,

                              fit: BoxFit.cover,
                            ),
                          )
                        else
                          Container(
                            width: 100,
                            height: 100,

                            color: Colors.grey.shade200,

                            child: const Icon(
                              Icons.image_not_supported,
                              size: 40,
                            ),
                          ),

                        const SizedBox(width: 12),

                        // ==========================================
                        // INFORMASI COCKTAIL
                        // ==========================================
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              // Nama cocktail
                              Text(
                                cocktail.strDrink ?? 'Unknown',

                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 8),

                              // Kategori
                              Text(
                                cocktail.strCategory ??
                                    'Kategori tidak tersedia',

                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade700,
                                ),
                              ),

                              const SizedBox(height: 4),

                              // Tipe alkohol
                              Text(
                                cocktail.strAlcoholic ?? 'Tipe tidak tersedia',

                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
