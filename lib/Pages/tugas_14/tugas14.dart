import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:timycampus/Pages/preference_handler.dart';
import 'package:timycampus/Pages/tugas11.dart';
import 'package:timycampus/Pages/tugas13.dart';

import 'model/cocktail_model.dart';
import 'services/cocktail_service.dart';
import 'cocktail_detail_page.dart';

class Tugas14Page extends StatefulWidget {
  // Constructor Tugas14Page.
  const Tugas14Page({super.key});

  @override
  State<Tugas14Page> createState() => _Tugas14PageState();
}

class _Tugas14PageState extends State<Tugas14Page> {
  // Service untuk mengambil data dari API.
  final CocktailService _cocktailService = CocktailService(Dio());

  // Menyimpan Future data cocktail.
  late Future<CocktailModel> _cocktailFuture;

  // Controller untuk Search Bar.
  final TextEditingController _searchController = TextEditingController();

  // Menyimpan kata pencarian.
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();

    // Mengambil data pertama kali ketika halaman dibuka.
    _loadCocktails();
  }

  void _loadCocktails() {
    setState(() {
      _cocktailFuture = _cocktailService.fetchData('margarita');
    });
  }

  Future<void> _refreshCocktails() async {
    setState(() {
      _cocktailFuture = _cocktailService.fetchData('margarita');
    });

    // Menunggu proses API selesai.
    await _cocktailFuture;
  }

  @override
  void dispose() {
    // Menghapus controller ketika halaman ditutup.
    _searchController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toko Cocktail'),
        centerTitle: true,

        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            //Aksi ketika logout ditekan
            onPressed: () async {
              // Mengubah status login menjadi false
              await PreferenceHandler.setLogin(false);
              //cek apakah halaman masih aktif
              if (!context.mounted) return;

              // Kembali ke LoginScreen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const LoginScreen(showLogoutMessage: true),
                ),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<CocktailModel>(
        // Future yang digunakan untuk mengambil data.
        future: _cocktailFuture,

        builder: (BuildContext context, AsyncSnapshot<CocktailModel> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // ====================================================
          // ERROR
          // ====================================================

          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 50, color: Colors.red),

                  const SizedBox(height: 10),

                  Text(
                    'Terjadi kesalahan:\n${snapshot.error}',
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 15),

                  ElevatedButton(
                    onPressed: _loadCocktails,
                    child: const Text('Coba Lagi'),
                  ),
                ],
              ),
            );
          }

          // ====================================================
          // AMBIL DATA
          // ====================================================

          final cocktails = snapshot.data?.drinks ?? [];

          // ====================================================
          // SEARCH FILTER
          // ====================================================

          final filteredCocktails = cocktails.where((cocktail) {
            final name = cocktail.strDrink?.toLowerCase() ?? '';

            final category = cocktail.strCategory?.toLowerCase() ?? '';

            final query = _searchQuery.toLowerCase();

            return name.contains(query) || category.contains(query);
          }).toList();

          // ====================================================
          // REFRESH INDICATOR
          // ====================================================

          return RefreshIndicator(
            // Ketika user melakukan pull down.
            onRefresh: _refreshCocktails,

            child: Column(
              children: [
                // ==================================================
                // SEARCH BAR
                // ==================================================

                Padding(
                  padding: const EdgeInsets.all(12),

                  child: TextField(
                    // Controller Search Bar.
                    controller: _searchController,

                    // Ketika user mengetik.
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },

                    decoration: InputDecoration(
                      hintText: 'Cari cocktail...',

                      prefixIcon: const Icon(Icons.search),

                      suffixIcon: _searchQuery.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear),

                              onPressed: () {
                                _searchController.clear();

                                setState(() {
                                  _searchQuery = '';
                                });
                              },
                            )
                          : null,

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),

                // ==================================================
                // DATA KOSONG
                // ==================================================
                if (filteredCocktails.isEmpty)
                  const Expanded(
                    child: Center(child: Text('Cocktail tidak ditemukan.')),
                  )
                // ==================================================
                // LIST DATA
                // ==================================================
                else
                  Expanded(
                    child: ListView.builder(
                      // Jumlah data setelah difilter.
                      itemCount: filteredCocktails.length,

                      itemBuilder: (BuildContext context, int index) {
                        // Mengambil data cocktail.
                        final Cocktail cocktail = filteredCocktails[index];

                        // ==================================================
                        // CARD
                        // ==================================================

                        return Card(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),

                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),

                            // ==================================================
                            // PINDAH KE DETAIL PAGE
                            // ==================================================
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CocktailDetailPage(cocktail: cocktail),
                                ),
                              );
                            },

                            // ==================================================
                            // ISI CARD
                            // ==================================================
                            child: Padding(
                              padding: const EdgeInsets.all(12),

                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  // ==================================================
                                  // GAMBAR
                                  // ==================================================

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

                                  // ==================================================
                                  // INFORMASI
                                  // ==================================================
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,

                                      children: [
                                        // Nama cocktail.
                                        Text(
                                          cocktail.strDrink ?? 'Unknown',

                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                        const SizedBox(height: 8),

                                        // Kategori.
                                        Text(
                                          cocktail.strCategory ??
                                              'Kategori tidak tersedia',

                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey.shade700,
                                          ),
                                        ),

                                        const SizedBox(height: 4),

                                        // Tipe alkohol.
                                        Text(
                                          cocktail.strAlcoholic ??
                                              'Tipe tidak tersedia',

                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey.shade600,
                                          ),
                                        ),

                                        const SizedBox(height: 8),

                                        // Petunjuk bahwa item bisa diklik.
                                        const Row(
                                          children: [
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              size: 13,
                                            ),

                                            SizedBox(width: 4),

                                            Text(
                                              'Lihat detail',
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ],
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
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
