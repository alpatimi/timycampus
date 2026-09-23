// Package Dio digunakan untuk melakukan HTTP request ke API.
import 'package:dio/dio.dart';

// Package Retrofit digunakan untuk membuat API service.
import 'package:retrofit/retrofit.dart';

// Import model Cocktail yang sudah kita buat.
import '../model/cocktail_model.dart';

// File hasil generate Retrofit.
part 'cocktail_service.g.dart';

// @RestApi menandakan bahwa class ini adalah Retrofit API service.
@RestApi(
  baseUrl: 'https://www.thecocktaildb.com/api/json/v1/1',
)

// Class untuk mengatur proses mengambil data dari API.
abstract class CocktailService {
  // Constructor yang nantinya akan dibuat oleh Retrofit.
  factory CocktailService(Dio dio, {String? baseUrl}) = _CocktailService;

  // Endpoint untuk mencari cocktail.
  @GET('/search.php')
  Future<CocktailModel> fetchData(
    // Parameter ?s=margarita
    @Query('s') String search,
  );
}