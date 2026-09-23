import 'package:flutter/material.dart';
import 'package:timycampus/Pages/belajar_tipis2.dart';
import 'package:timycampus/Pages/login_screen.dart';
import 'package:timycampus/Pages/tugas12.dart';
import 'package:timycampus/Pages/tugas13.dart';
import 'package:timycampus/Pages/tugas7.dart';
import 'package:timycampus/Pages/tugas8.dart';
import 'package:timycampus/Pages/tugas9.dart';
import 'package:timycampus/Pages/tugas10.dart';
import 'package:timycampus/Pages/tugas11.dart';
import 'package:timycampus/Pages/preference_handler.dart';
import 'package:timycampus/Pages/latihan_bottom_navigator.dart';
import 'package:timycampus/Pages/tugas_14/tugas14.dart';
import 'package:timycampus/day_19/views/post_list_views.dart';

void main() async {

  // Memastikan Flutter siap sebelum menjalankan kode async.
  WidgetsFlutterBinding.ensureInitialized();

  // Melakukan inisialisasi SharedPreferences.
  await PreferenceHandler.init();

  // Menjalankan aplikasi.
  runApp(const MyApp());
}


// Class utama aplikasi.
class MyApp extends StatelessWidget {

  // Constructor MyApp.
  const MyApp({super.key});

  // Method build.
  @override
  Widget build(BuildContext context) {

    // MaterialApp sebagai root aplikasi.
    return MaterialApp(

      // Menghilangkan tulisan debug.
      debugShowCheckedModeBanner: false,

      // Nama aplikasi.
      title: 'TimiCampus',

      // Halaman pertama aplikasi.
      home: const Tugas14Page(),     
    );
  }
}
            