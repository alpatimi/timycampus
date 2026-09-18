
// Mengimport package Flutter Material.
// Package ini digunakan untuk membuat tampilan aplikasi.
import 'package:flutter/material.dart';

// Mengimport package sqflite.
// Package ini digunakan untuk membuat dan mengelola database SQLite.
import 'package:sqflite/sqflite.dart';

// Mengimport package path.
// Package ini digunakan untuk menentukan lokasi file database.
import 'package:path/path.dart';


// ============================================================
// MODEL CLASS USER
// ============================================================

// Class User digunakan sebagai bentuk data user di aplikasi.
class User {

  // ID user.
  // Tipe int dan boleh kosong karena ID akan dibuat otomatis oleh database.
  int? id;

  // Menyimpan nama user.
  String nama;

  // Menyimpan email user.
  String email;

  // Menyimpan nomor HP user.
  String nomorHp;

  // Menyimpan password user.
  String password;

  // Menyimpan asal kota user.
  String asalKota;


  // Constructor untuk membuat object User.
  User({
    this.id,
    required this.nama,
    required this.email,
    required this.nomorHp,
    required this.password,
    required this.asalKota,
  });


  // ==========================================================
  // METHOD TOMAP
  // ==========================================================

  // Method toMap digunakan untuk mengubah object User
  // menjadi Map agar dapat disimpan ke database SQLite.
  Map<String, dynamic> toMap() {

    // Mengembalikan data dalam bentuk Map.
    return {

      // ID tidak wajib dikirim ketika insert
      // karena database akan membuat ID secara otomatis.
      'id': id,

      // Menyimpan nama ke kolom nama.
      'nama': nama,

      // Menyimpan email ke kolom email.
      'email': email,

      // Menyimpan nomor HP ke kolom nomor_hp.
      'nomor_hp': nomorHp,

      // Menyimpan password ke kolom password.
      'password': password,

      // Menyimpan asal kota ke kolom asal_kota.
      'asal_kota': asalKota,
    };
  }


  // ==========================================================
  // METHOD FROMMAP
  // ==========================================================

  // Method fromMap digunakan untuk mengubah data dari database
  // menjadi object User.
  factory User.fromMap(Map<String, dynamic> map) {

    // Membuat object User berdasarkan data dari database.
    return User(

      // Mengambil ID dari database.
      id: map['id'],

      // Mengambil nama dari database.
      nama: map['nama'],

      // Mengambil email dari database.
      email: map['email'],

      // Mengambil nomor HP dari database.
      nomorHp: map['nomor_hp'],

      // Mengambil password dari database.
      password: map['password'],

      // Mengambil asal kota dari database.
      asalKota: map['asal_kota'],
    );
  }
}


// ============================================================
// DATABASE HELPER
// ============================================================

// Class DatabaseHelper digunakan untuk mengatur database SQLite.
class DatabaseHelper {

  // Membuat Singleton.
  // Artinya kita hanya menggunakan satu object DatabaseHelper.
  static final DatabaseHelper instance = DatabaseHelper._init();

  // Constructor private.
  // Tanda "_" membuat constructor hanya bisa digunakan
  // dari dalam class ini.
  DatabaseHelper._init();

  // Variabel untuk menyimpan object database.
  Database? _database;


  // ==========================================================
  // GET DATABASE
  // ==========================================================

  // Getter database digunakan untuk mendapatkan database.
  Future<Database> get database async {

    // Jika database sudah pernah dibuat,
    // langsung gunakan database tersebut.
    if (_database != null) {
      return _database!;
    }

    // Jika database belum dibuat,
    // maka buat database baru.
    _database = await _initDatabase();

    // Mengembalikan database.
    return _database!;
  }


  // ==========================================================
  // INIT DATABASE
  // ==========================================================

  // Method untuk membuat atau membuka database.
  Future<Database> _initDatabase() async {

    // Mendapatkan lokasi penyimpanan database SQLite.
    final dbPath = await getDatabasesPath();

    // Menentukan nama file database.
    final path = join(dbPath, 'user_database.db');

    // Membuka database.
    return await openDatabase(

      // Lokasi database.
      path,

      // Versi database.
      version: 1,

      // onCreate akan dijalankan ketika database
      // pertama kali dibuat.
      onCreate: _createDatabase,
    );
  }


  // ==========================================================
  // CREATE TABLE
  // ==========================================================

  // Method untuk membuat tabel users.
  Future<void> _createDatabase(
    Database db,
    int version,
  ) async {

    // Membuat tabel users.
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nama TEXT NOT NULL,
        email TEXT NOT NULL,
        nomor_hp TEXT NOT NULL,
        password TEXT NOT NULL,
        asal_kota TEXT NOT NULL
      )
    ''');
  }


  // ==========================================================
  // INSERT USER
  // ==========================================================

  // Method untuk memasukkan data user ke database.
  Future<int> insertUser(User user) async {

    // Mengambil database.
    final db = await instance.database;

    // Memasukkan data User ke tabel users.
    return await db.insert(
      'users',

      // Mengubah object User menjadi Map.
      user.toMap(),

      // Jika terjadi konflik ID,
      // data baru akan menggantikan data lama.
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }


  // ==========================================================
  // GET USERS
  // ==========================================================

  // Method untuk mengambil semua data user dari database.
  Future<List<User>> getUsers() async {

    // Mengambil database.
    final db = await instance.database;

    // Mengambil semua data dari tabel users.
    final result = await db.query(
      'users',

      // Mengurutkan data berdasarkan ID terbaru.
      orderBy: 'id DESC',
    );

    // Mengubah setiap data Map dari database
    // menjadi object User.
    return result.map((map) => User.fromMap(map)).toList();
  }
}


// ============================================================
// HALAMAN TUGAS 12
// ============================================================

// Tugas12 merupakan halaman utama tugas ini.
class Tugas12 extends StatefulWidget {

  // Constructor Tugas12.
  const Tugas12({super.key});


  // Membuat State untuk Tugas12.
  @override
  State<Tugas12> createState() => _Tugas12State();
}


// ============================================================
// STATE TUGAS 12
// ============================================================

class _Tugas12State extends State<Tugas12> {

  // Controller untuk input nama.
  final TextEditingController namaController = TextEditingController();

  // Controller untuk input email.
  final TextEditingController emailController = TextEditingController();

  // Controller untuk input nomor HP.
  final TextEditingController nomorHpController = TextEditingController();

  // Controller untuk input password.
  final TextEditingController passwordController = TextEditingController();

  // Controller untuk input asal kota.
  final TextEditingController asalKotaController = TextEditingController();


  // GlobalKey digunakan untuk mengontrol Form.
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  // Future digunakan untuk mengambil data user dari database.
  late Future<List<User>> usersFuture;


  // ==========================================================
  // INIT STATE
  // ==========================================================

  @override
  void initState() {

    // Memanggil initState dari parent.
    super.initState();

    // Saat halaman pertama kali dibuka,
    // langsung mengambil data user dari database.
    usersFuture = DatabaseHelper.instance.getUsers();
  }


  // ==========================================================
  // SIMPAN DATA
  // ==========================================================

  // Method untuk menyimpan data user.
  Future<void> simpanData() async {

    // Memeriksa apakah semua input sudah valid.
    if (!_formKey.currentState!.validate()) {
      return;
    }


    // Membuat object User dari data yang dimasukkan.
    final user = User(

      // Mengambil nama dari TextEditingController.
      nama: namaController.text,

      // Mengambil email dari TextEditingController.
      email: emailController.text,

      // Mengambil nomor HP dari TextEditingController.
      nomorHp: nomorHpController.text,

      // Mengambil password dari TextEditingController.
      password: passwordController.text,

      // Mengambil asal kota dari TextEditingController.
      asalKota: asalKotaController.text,
    );


    // Menyimpan object User ke database.
    await DatabaseHelper.instance.insertUser(user);


    // Mengambil kembali data terbaru dari database.
    usersFuture = DatabaseHelper.instance.getUsers();


    // Mengosongkan input setelah berhasil disimpan.
    namaController.clear();
    emailController.clear();
    nomorHpController.clear();
    passwordController.clear();
    asalKotaController.clear();


    // Memperbarui tampilan.
    setState(() {});


    // Menampilkan pesan bahwa data berhasil disimpan.
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Data berhasil disimpan'),
        ),
      );
    }
  }


  // ==========================================================
  // DISPOSE CONTROLLER
  // ==========================================================

  @override
  void dispose() {

    // Menghapus controller nama ketika halaman ditutup.
    namaController.dispose();

    // Menghapus controller email.
    emailController.dispose();

    // Menghapus controller nomor HP.
    nomorHpController.dispose();

    // Menghapus controller password.
    passwordController.dispose();

    // Menghapus controller asal kota.
    asalKotaController.dispose();

    // Memanggil dispose dari parent.
    super.dispose();
  }


  // ==========================================================
  // BUILD
  // ==========================================================

  @override
  Widget build(BuildContext context) {

    // Scaffold merupakan struktur dasar halaman Flutter.
    return Scaffold(

      // AppBar bagian atas aplikasi.
      appBar: AppBar(

        // Judul halaman.
        title: const Text('Pendaftaran User'),
      ),


      // Body berisi form dan daftar user.
      body: SingleChildScrollView(

        // Padding agar isi tidak terlalu menempel
        // dengan sisi layar.
        padding: const EdgeInsets.all(16),

        // Column digunakan untuk menyusun widget
        // dari atas ke bawah.
        child: Column(
          children: [

            // ==================================================
            // FORM
            // ==================================================

            Form(

              // Menghubungkan Form dengan GlobalKey.
              key: _formKey,

              // Column untuk input form.
              child: Column(
                children: [

                  // Input nama.
                  TextFormField(

                    // Controller untuk membaca input nama.
                    controller: namaController,

                    // Mengatur tampilan input.
                    decoration: const InputDecoration(
                      labelText: 'Nama',
                      border: OutlineInputBorder(),
                    ),

                    // Validasi nama.
                    validator: (value) {

                      // Jika kosong, tampilkan pesan error.
                      if (value == null || value.isEmpty) {
                        return 'Nama wajib diisi';
                      }

                      // Jika valid, tidak ada error.
                      return null;
                    },
                  ),

                  // Memberikan jarak antar input.
                  const SizedBox(height: 12),


                  // Input email.
                  TextFormField(

                    // Controller email.
                    controller: emailController,

                    // Tampilan input email.
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),

                    // Keyboard email.
                    keyboardType: TextInputType.emailAddress,

                    // Validasi email.
                    validator: (value) {

                      // Mengecek apakah email kosong.
                      if (value == null || value.isEmpty) {
                        return 'Email wajib diisi';
                      }

                      // Mengecek apakah terdapat karakter @.
                      if (!value.contains('@')) {
                        return 'Masukkan email yang valid';
                      }

                      // Email valid.
                      return null;
                    },
                  ),

                  // Jarak.
                  const SizedBox(height: 12),


                  // Input nomor HP.
                  TextFormField(

                    // Controller nomor HP.
                    controller: nomorHpController,

                    // Tampilan input.
                    decoration: const InputDecoration(
                      labelText: 'Nomor HP',
                      border: OutlineInputBorder(),
                    ),

                    // Keyboard angka.
                    keyboardType: TextInputType.phone,

                    // Validasi nomor HP.
                    validator: (value) {

                      // Mengecek input kosong.
                      if (value == null || value.isEmpty) {
                        return 'Nomor HP wajib diisi';
                      }

                      // Nomor HP valid.
                      return null;
                    },
                  ),

                  // Jarak.
                  const SizedBox(height: 12),


                  // Input password.
                  TextFormField(

                    // Controller password.
                    controller: passwordController,

                    // Menyembunyikan karakter password.
                    obscureText: true,

                    // Tampilan input.
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),

                    // Validasi password.
                    validator: (value) {

                      // Mengecek password kosong.
                      if (value == null || value.isEmpty) {
                        return 'Password wajib diisi';
                      }

                      // Mengecek panjang password.
                      if (value.length < 6) {
                        return 'Password minimal 6 karakter';
                      }

                      // Password valid.
                      return null;
                    },
                  ),

                  // Jarak.
                  const SizedBox(height: 12),


                  // Input asal kota.
                  TextFormField(

                    // Controller asal kota.
                    controller: asalKotaController,

                    // Tampilan input.
                    decoration: const InputDecoration(
                      labelText: 'Asal Kota',
                      border: OutlineInputBorder(),
                    ),

                    // Validasi asal kota.
                    validator: (value) {

                      // Mengecek input kosong.
                      if (value == null || value.isEmpty) {
                        return 'Asal kota wajib diisi';
                      }

                      // Asal kota valid.
                      return null;
                    },
                  ),

                  // Jarak.
                  const SizedBox(height: 16),


                  // Tombol simpan.
                  SizedBox(

                    // Membuat tombol memenuhi lebar yang tersedia.
                    width: double.infinity,

                    // ElevatedButton merupakan tombol dengan efek elevation.
                    child: ElevatedButton(

                      // Ketika tombol ditekan,
                      // jalankan method simpanData().
                      onPressed: simpanData,

                      // Text pada tombol.
                      child: const Text('Daftar'),
                    ),
                  ),
                ],
              ),
            ),


            // Jarak antara form dan daftar.
            const SizedBox(height: 24),


            // Judul daftar user.
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Data Peserta Terdaftar',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),


            // Jarak.
            const SizedBox(height: 12),


            // ==================================================
            // FUTUREBUILDER
            // ==================================================

            // FutureBuilder digunakan untuk menampilkan
            // data yang berasal dari proses asynchronous.
            FutureBuilder<List<User>>(

              // Future yang mengambil data user.
              future: usersFuture,

              // Builder akan dijalankan ketika Future berubah.
              builder: (context, snapshot) {

                // Jika data masih sedang diambil,
                // tampilkan loading.
                if (snapshot.connectionState ==
                    ConnectionState.waiting) {

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }


                // Jika terjadi error saat mengambil database.
                if (snapshot.hasError) {

                  return Center(
                    child: Text(
                      'Terjadi error: ${snapshot.error}',
                    ),
                  );
                }


                // Mengambil data user dari snapshot.
                final users = snapshot.data ?? [];


                // Jika belum ada data.
                if (users.isEmpty) {

                  return const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Belum ada peserta yang terdaftar.',
                    ),
                  );
                }


                // ==================================================
                // LISTVIEW.BUILDER
                // ==================================================

                // ListView.builder digunakan untuk
                // menampilkan daftar user secara dinamis.
                return ListView.builder(

                  // Agar ListView dapat berada di dalam
                  // SingleChildScrollView.
                  shrinkWrap: true,

                  // Menonaktifkan scroll ListView sendiri.
                  physics: const NeverScrollableScrollPhysics(),

                  // Jumlah data user.
                  itemCount: users.length,

                  // Membuat setiap item user.
                  itemBuilder: (context, index) {

                    // Mengambil user berdasarkan index.
                    final user = users[index];


                    // Card digunakan untuk membuat tampilan
                    // setiap user lebih rapi.
                    return Card(

                      // Memberikan jarak antar Card.
                      margin: const EdgeInsets.only(bottom: 10),

                      // ListTile membuat tampilan data
                      // menjadi lebih sederhana.
                      child: ListTile(

                        // Icon user di sebelah kiri.
                        leading: const CircleAvatar(
                          child: Icon(Icons.person),
                        ),

                        // Menampilkan nama user.
                        title: Text(
                          user.nama,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        // Menampilkan informasi user.
                        subtitle: Text(
                          'Email: ${user.email}\n'
                          'No. HP: ${user.nomorHp}\n'
                          'Kota: ${user.asalKota}',
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

