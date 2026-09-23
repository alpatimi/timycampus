import 'package:flutter/material.dart';
import 'model/cocktail_model.dart';

// Halaman untuk menampilkan detail cocktail.
class CocktailDetailPage extends StatelessWidget {
  // Data cocktail yang dikirim dari halaman sebelumnya.
  final Cocktail cocktail;

  // Constructor CocktailDetailPage.
  const CocktailDetailPage({
    super.key,
    required this.cocktail,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar halaman detail.
      appBar: AppBar(
        title: const Text('Detail Cocktail'),
        centerTitle: true,
      ),

      // Isi halaman detail.
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // =====================================================
            // GAMBAR COCKTAIL
            // =====================================================

            if (cocktail.strDrinkThumb != null &&
                cocktail.strDrinkThumb!.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(16),

                child: Image.network(
                  cocktail.strDrinkThumb!,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),

            const SizedBox(height: 20),

            // =====================================================
            // NAMA COCKTAIL
            // =====================================================

            Text(
              cocktail.strDrink ?? 'Unknown',
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // =====================================================
            // KATEGORI
            // =====================================================

            _buildInfo(
              'Kategori',
              cocktail.strCategory ?? 'Tidak tersedia',
            ),

            // =====================================================
            // TIPE MINUMAN
            // =====================================================

            _buildInfo(
              'Tipe',
              cocktail.strAlcoholic ?? 'Tidak tersedia',
            ),

            // =====================================================
            // JENIS GELAS
            // =====================================================

            _buildInfo(
              'Gelas',
              cocktail.strGlass ?? 'Tidak tersedia',
            ),

            // =====================================================
            // INSTRUKSI
            // =====================================================

            if (cocktail.strInstructions != null &&
                cocktail.strInstructions!.isNotEmpty)
              _buildInfo(
                'Instruksi',
                cocktail.strInstructions!,
              ),
          ],
        ),
      ),
    );
  }

  // Widget reusable untuk menampilkan informasi.
  Widget _buildInfo(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            value,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}

