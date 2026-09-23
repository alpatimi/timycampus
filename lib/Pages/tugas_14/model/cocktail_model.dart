// Untuk mengubah JSON String menjadi object CocktailModel.
import 'dart:convert';

// Package untuk menggunakan annotation seperti @JsonSerializable().
import 'package:json_annotation/json_annotation.dart';

// File hasil generate dari build_runner.
// JANGAN dibuat atau diedit secara manual.
part 'cocktail_model.g.dart';


// ============================================================
// FUNGSI PARSING COCKTAIL MODEL
// ============================================================

// Mengubah JSON String menjadi object CocktailModel.
CocktailModel cocktailModelFromJson(String str) =>
    CocktailModel.fromJson(json.decode(str));

// Mengubah object CocktailModel menjadi JSON String.
String cocktailModelToJson(CocktailModel data) =>
    json.encode(data.toJson());


// ============================================================
// MODEL UTAMA / RESPONSE
// ============================================================

@JsonSerializable()
class CocktailModel {
  // Data cocktail dari API berada di dalam key "drinks".
  final List<Cocktail>? drinks;

  // Constructor CocktailModel.
  CocktailModel({
    this.drinks,
  });

  // Mengubah JSON menjadi object CocktailModel.
  factory CocktailModel.fromJson(Map<String, dynamic> json) =>
      _$CocktailModelFromJson(json);

  // Mengubah object CocktailModel menjadi JSON.
  Map<String, dynamic> toJson() => _$CocktailModelToJson(this);
}


// ============================================================
// MODEL COCKTAIL
// ============================================================

@JsonSerializable()
class Cocktail {
  // ID cocktail.
  final String? idDrink;

  // Nama cocktail.
  final String? strDrink;

  // Nama alternatif cocktail.
  final String? strDrinkAlternate;

  // Tag cocktail.
  final String? strTags;

  // URL video cocktail jika tersedia.
  final String? strVideo;

  // Kategori cocktail.
  final String? strCategory;

  // Kategori IBA.
  final String? strIBA;

  // Jenis alkohol.
  final String? strAlcoholic;

  // Jenis gelas yang digunakan.
  final String? strGlass;

  // Instruksi pembuatan dalam bahasa Inggris.
  final String? strInstructions;

  // Instruksi dalam bahasa Spanyol.
  @JsonKey(name: 'strInstructionsES')
  final String? strInstructionsES;

  // Instruksi dalam bahasa Jerman.
  @JsonKey(name: 'strInstructionsDE')
  final String? strInstructionsDE;

  // Instruksi dalam bahasa Prancis.
  @JsonKey(name: 'strInstructionsFR')
  final String? strInstructionsFR;

  // Instruksi dalam bahasa Italia.
  @JsonKey(name: 'strInstructionsIT')
  final String? strInstructionsIT;

  // Instruksi dalam bahasa Chinese Simplified.
  @JsonKey(name: 'strInstructionsZH-HANS')
  final String? strInstructionsZhHans;

  // Instruksi dalam bahasa Chinese Traditional.
  @JsonKey(name: 'strInstructionsZH-HANT')
  final String? strInstructionsZhHant;

  // URL gambar cocktail.
  final String? strDrinkThumb;


  // ==========================================================
  // INGREDIENT
  // ==========================================================

  // Ingredient ke-1.
  final String? strIngredient1;

  // Ingredient ke-2.
  final String? strIngredient2;

  // Ingredient ke-3.
  final String? strIngredient3;

  // Ingredient ke-4.
  final String? strIngredient4;

  // Ingredient ke-5.
  final String? strIngredient5;

  // Ingredient ke-6.
  final String? strIngredient6;

  // Ingredient ke-7.
  final String? strIngredient7;

  // Ingredient ke-8.
  final String? strIngredient8;

  // Ingredient ke-9.
  final String? strIngredient9;

  // Ingredient ke-10.
  final String? strIngredient10;

  // Ingredient ke-11.
  final String? strIngredient11;

  // Ingredient ke-12.
  final String? strIngredient12;

  // Ingredient ke-13.
  final String? strIngredient13;

  // Ingredient ke-14.
  final String? strIngredient14;

  // Ingredient ke-15.
  final String? strIngredient15;


  // ==========================================================
  // MEASURE / TAKARAN
  // ==========================================================

  // Takaran ingredient ke-1.
  final String? strMeasure1;
  // Takaran ingredient ke-2.
  final String? strMeasure2;
  // Takaran ingredient ke-3.
  final String? strMeasure3;
  // Takaran ingredient ke-4.
  final String? strMeasure4;
  // Takaran ingredient ke-5.
  final String? strMeasure5;
  // Takaran ingredient ke-6.
  final String? strMeasure6;
  // Takaran ingredient ke-7.
  final String? strMeasure7;
  // Takaran ingredient ke-8.
  final String? strMeasure8;
  // Takaran ingredient ke-9.
  final String? strMeasure9;
  // Takaran ingredient ke-10.
  final String? strMeasure10;
  // Takaran ingredient ke-11.
  final String? strMeasure11;
  // Takaran ingredient ke-12.
  final String? strMeasure12;
  // Takaran ingredient ke-13.
  final String? strMeasure13;
  // Takaran ingredient ke-14.
  final String? strMeasure14;
  // Takaran ingredient ke-15.
  final String? strMeasure15;

  // ==========================================================
  // INFORMASI GAMBAR DAN LISENSI
  // ==========================================================

  // Sumber gambar cocktail.
  final String? strImageSource;

  // Attribution atau pembuat gambar.
  final String? strImageAttribution;

  // Status Creative Commons.
  final String? strCreativeCommonsConfirmed;

  // Tanggal data terakhir dimodifikasi.
  final String? dateModified;


  // ==========================================================
  // CONSTRUCTOR
  // ==========================================================

  Cocktail({
    this.idDrink,
    this.strDrink,
    this.strDrinkAlternate,
    this.strTags,
    this.strVideo,
    this.strCategory,
    this.strIBA,
    this.strAlcoholic,
    this.strGlass,
    this.strInstructions,
    this.strInstructionsES,
    this.strInstructionsDE,
    this.strInstructionsFR,
    this.strInstructionsIT,
    this.strInstructionsZhHans,
    this.strInstructionsZhHant,
    this.strDrinkThumb,

    this.strIngredient1,
    this.strIngredient2,
    this.strIngredient3,
    this.strIngredient4,
    this.strIngredient5,
    this.strIngredient6,
    this.strIngredient7,
    this.strIngredient8,
    this.strIngredient9,
    this.strIngredient10,
    this.strIngredient11,
    this.strIngredient12,
    this.strIngredient13,
    this.strIngredient14,
    this.strIngredient15,

    this.strMeasure1,
    this.strMeasure2,
    this.strMeasure3,
    this.strMeasure4,
    this.strMeasure5,
    this.strMeasure6,
    this.strMeasure7,
    this.strMeasure8,
    this.strMeasure9,
    this.strMeasure10,
    this.strMeasure11,
    this.strMeasure12,
    this.strMeasure13,
    this.strMeasure14,
    this.strMeasure15,

    this.strImageSource,
    this.strImageAttribution,
    this.strCreativeCommonsConfirmed,
    this.dateModified,
  });


  // ==========================================================
  // FROM JSON
  // ==========================================================

  // Mengubah JSON menjadi object Cocktail.
  factory Cocktail.fromJson(Map<String, dynamic> json) =>
      _$CocktailFromJson(json);


  // ==========================================================
  // TO JSON
  // ==========================================================

  // Mengubah object Cocktail menjadi JSON.
  Map<String, dynamic> toJson() => _$CocktailToJson(this);
}