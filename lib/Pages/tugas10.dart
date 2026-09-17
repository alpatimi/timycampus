// Mengimport package Material dari Flutter.
import 'package:flutter/material.dart';

// Membuat StatefulWidget karena kita akan menggunakan
// TextEditingController dan melakukan validasi form.
class Tugas10 extends StatefulWidget {
  // Constructor dari class Tugas10.
  const Tugas10({super.key});

  // Membuat State untuk Tugas10.
  @override
  State<Tugas10> createState() => _Tugas10State();
}

// Membuat class State untuk Tugas10.
class _Tugas10State extends State<Tugas10> {
  // Controller untuk mengambil isi input Nama.
  final TextEditingController namaController = TextEditingController();

  // Controller untuk mengambil isi input Email.
  final TextEditingController emailController = TextEditingController();

  // Controller untuk mengambil isi input Nomor HP.
  final TextEditingController hpController = TextEditingController();

  // Controller untuk mengambil isi input Kota.
  final TextEditingController kotaController = TextEditingController();

  // Fungsi untuk menampilkan AlertDialog setelah tombol Daftar ditekan.
  void daftar() {
    // Mengambil isi dari input Nama.
    String nama = namaController.text;

    // Mengambil isi dari input Email.
    String email = emailController.text;

    // Mengambil isi dari input Nomor HP.
    String hp = hpController.text;

    // Mengambil isi dari input Kota.
    String kota = kotaController.text;

    // Mengecek apakah Nama masih kosong.
    if (nama.isEmpty) {
      // Menampilkan pesan error.
      ScaffoldMessenger.of(context).showSnackBar(
        // Membuat SnackBar.
        const SnackBar(
          // Isi pesan error.
          content: Text('Nama lengkap wajib diisi'),
        ),
      );

      // Menghentikan fungsi jika nama kosong.
      return;
    }

    // Mengecek apakah Email kosong atau tidak mengandung @.
    if (email.isEmpty || !email.contains('@')) {
      // Menampilkan pesan error.
      ScaffoldMessenger.of(context).showSnackBar(
        // Membuat SnackBar.
        const SnackBar(
          // Isi pesan error.
          content: Text('Email wajib diisi dan harus mengandung @'),
        ),
      );

      // Menghentikan fungsi jika email tidak valid.
      return;
    }

    // Mengecek apakah Kota masih kosong.
    if (kota.isEmpty) {
      // Menampilkan pesan error.
      ScaffoldMessenger.of(context).showSnackBar(
        // Membuat SnackBar.
        const SnackBar(
          // Isi pesan error.
          content: Text('Kota wajib diisi'),
        ),
      );

      // Menghentikan fungsi jika kota kosong.
      return;
    }

    // Menampilkan AlertDialog jika semua data valid.
    showDialog(
      // Menggunakan context halaman saat ini.
      context: context,

      // Membuat isi dialog.
      builder: (context) {
        // Mengembalikan AlertDialog.
        return AlertDialog(
          // Judul dialog.
          title: const Text('Data Pendaftaran'),

          // Isi dialog.
          content: Column(
            // Membuat ukuran Column mengikuti isi.
            mainAxisSize: MainAxisSize.min,

            // Membuat daftar teks ringkasan data.
            children: [
              // Menampilkan nama.
              Text('Nama: $nama'),

              // Memberikan jarak.
              const SizedBox(height: 8),

              // Menampilkan email.
              Text('Email: $email'),

              // Memberikan jarak.
              const SizedBox(height: 8),

              // Menampilkan nomor HP.
              Text(
                // Jika nomor HP kosong, tampilkan "-".
                'Nomor HP: ${hp.isEmpty ? "-" : hp}',
              ),

              // Memberikan jarak.
              const SizedBox(height: 8),

              // Menampilkan kota.
              Text('Kota: $kota'),
            ],
          ),

          // Tombol pada bagian bawah dialog.
          actions: [
            // Membuat tombol Lanjut.
            TextButton(
              // Ketika tombol ditekan.
              onPressed: () {
                // Menutup AlertDialog terlebih dahulu.
                Navigator.pop(context);

                // Berpindah ke halaman konfirmasi.
                Navigator.push(
                  // Menggunakan context halaman saat ini.
                  context,

                  // Membuat route menuju halaman konfirmasi.
                  MaterialPageRoute(
                    // Membuat halaman Konfirmasi.
                    builder: (context) {
                      // Mengirim nama dan kota ke halaman konfirmasi.
                      return HalamanKonfirmasi(
                        nama: nama,
                        kota: kota,
                      );
                    },
                  ),
                );
              },

              // Tulisan tombol.
              child: const Text('Lanjut'),
            ),
          ],
        );
      },
    );
  }

  // Fungsi build untuk membuat tampilan halaman.
  @override
  Widget build(BuildContext context) {
    // Mengembalikan Scaffold sebagai struktur halaman.
    return Scaffold(
      // Membuat AppBar.
      appBar: AppBar(
        // Judul AppBar.
        title: const Text('Form Pendaftaran'),
      ),

      // Isi utama halaman.
      body: Padding(
        // Memberikan jarak 20 dari semua sisi.
        padding: const EdgeInsets.all(20),

        // Membuat halaman bisa di-scroll.
        child: SingleChildScrollView(
          // Membuat Column untuk semua input.
          child: Column(
            // Membuat semua widget memenuhi lebar.
            crossAxisAlignment: CrossAxisAlignment.stretch,

            // Daftar widget di dalam Column.
            children: [
              // Input Nama Lengkap.
              TextField(
                // Menghubungkan input dengan controller nama.
                controller: namaController,

                // Dekorasi input.
                decoration: const InputDecoration(
                  // Label input.
                  labelText: 'Nama Lengkap',

                  // Border input.
                  border: OutlineInputBorder(),
                ),
              ),

              // Memberikan jarak setelah input nama.
              const SizedBox(height: 15),

              // Input Email.
              TextField(
                // Menghubungkan input dengan controller email.
                controller: emailController,

                // Mengatur keyboard menjadi keyboard email.
                keyboardType: TextInputType.emailAddress,

                // Dekorasi input.
                decoration: const InputDecoration(
                  // Label input.
                  labelText: 'Email',

                  // Border input.
                  border: OutlineInputBorder(),
                ),
              ),

              // Memberikan jarak setelah input email.
              const SizedBox(height: 15),

              // Input Nomor HP.
              TextField(
                // Menghubungkan input dengan controller HP.
                controller: hpController,

                // Mengatur keyboard menjadi keyboard angka.
                keyboardType: TextInputType.phone,

                // Dekorasi input.
                decoration: const InputDecoration(
                  // Label input.
                  labelText: 'Nomor HP (opsional)',

                  // Border input.
                  border: OutlineInputBorder(),
                ),
              ),

              // Memberikan jarak setelah input nomor HP.
              const SizedBox(height: 15),

              // Input Kota.
              TextField(
                // Menghubungkan input dengan controller kota.
                controller: kotaController,

                // Dekorasi input.
                decoration: const InputDecoration(
                  // Label input.
                  labelText: 'Kota',

                  // Border input.
                  border: OutlineInputBorder(),
                ),
              ),

              // Memberikan jarak sebelum tombol.
              const SizedBox(height: 25),

              // Tombol Daftar.
              ElevatedButton(
                // Ketika tombol ditekan, jalankan fungsi daftar.
                onPressed: daftar,

                // Tulisan di dalam tombol.
                child: const Text('Daftar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// Membuat halaman konfirmasi.
class HalamanKonfirmasi extends StatelessWidget {
  // Variabel untuk menyimpan nama pengguna.
  final String nama;

  // Variabel untuk menyimpan kota pengguna.
  final String kota;

  // Constructor halaman konfirmasi.
  const HalamanKonfirmasi({
    // Menerima data nama.
    required this.nama,

    // Menerima data kota.
    required this.kota,

    // Key dari widget.
    super.key,
  });

  // Fungsi build untuk membuat tampilan halaman.
  @override
  Widget build(BuildContext context) {
    // Mengembalikan Scaffold.
    return Scaffold(
      // Membuat AppBar.
      appBar: AppBar(
        // Judul AppBar.
        title: const Text('Konfirmasi'),
      ),

      // Isi halaman.
      body: Center(
        // Membuat Column di tengah halaman.
        child: Column(
          // Membuat ukuran Column mengikuti isi.
          mainAxisSize: MainAxisSize.min,

          // Daftar widget.
          children: [
            // Menampilkan icon tanda berhasil.
            const Icon(
              // Icon check.
              Icons.check_circle,

              // Ukuran icon.
              size: 80,
            ),

            // Memberikan jarak.
            const SizedBox(height: 20),

            // Menampilkan pesan sesuai instruksi tugas.
            Text(
              // Menggunakan nama dan kota dari halaman sebelumnya.
              'Terima kasih, $nama dari $kota telah mendaftar.',

              // Mengatur ukuran tulisan.
              textAlign: TextAlign.center,

              // Memberikan style tulisan.
              style: const TextStyle(
                // Ukuran font 20.
                fontSize: 20,

                // Membuat tulisan tebal.
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}