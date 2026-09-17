// Mengimport package Flutter Material.
import 'package:flutter/material.dart';

// Mengimport PreferenceHandler dari file terpisah.
// Sesuaikan path jika folder kamu berbeda.
import 'preference_handler.dart';

// Class utama yang akan dipanggil dari main.dart.
class Tugas11 extends StatelessWidget {
  // Constructor Tugas11.
  const Tugas11({super.key});

  // Method untuk membuat tampilan.
  @override
  Widget build(BuildContext context) {
    // Menampilkan SplashScreen sebagai halaman pertama.
    return const SplashScreen();
  }
}

// Class untuk halaman Splash Screen.
class SplashScreen extends StatefulWidget {
  // Constructor SplashScreen.
  const SplashScreen({super.key});

  // Membuat State dari SplashScreen.
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


// State dari SplashScreen.
class _SplashScreenState extends State<SplashScreen> {

  // Method ini dijalankan saat SplashScreen pertama kali dibuat.
  @override
  void initState() {
    // Menjalankan initState dari parent.
    super.initState();

    // Memanggil method untuk mengecek status login.
    checkLogin();
  }


  // Method untuk mengecek status login.
  void checkLogin() async {

    // Menunggu selama 2 detik.
    await Future.delayed(
      const Duration(seconds: 2),
    );

    // Mengecek apakah halaman masih aktif.
    if (!mounted) return;

    // Jika user sudah login.
    if (PreferenceHandler.isLogin) {

      // Pindah ke HomeScreen.
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );

    } else {

      // Jika belum login, pindah ke LoginScreen.
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    }
  }

  // Membuat tampilan Splash Screen.
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // Warna background Splash Screen.
      backgroundColor: Colors.blue,

      // Isi halaman.
      body: Center(
        child: Column(

          // Membuat isi berada di tengah.
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            // Icon sebagai logo sementara.
            const Icon(
              Icons.school,
              size: 100,
              color: Colors.white,
            ),

            // Memberikan jarak.
            const SizedBox(height: 20),

            // Nama aplikasi.
            const Text(
              'TimiCampus',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            // Memberikan jarak.
            const SizedBox(height: 30),

            // Loading indicator.
            const CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

// Class untuk halaman Login.
class LoginScreen extends StatefulWidget {

  // Variabel untuk mengetahui apakah user baru saja logout.
  final bool showLogoutMessage;

  // Constructor LoginScreen.
  const LoginScreen({
    super.key,
    this.showLogoutMessage = false,
  });

  // Membuat State LoginScreen.
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


// State dari LoginScreen.
class _LoginScreenState extends State<LoginScreen> {

  // Method ini dijalankan ketika halaman Login dibuat.
  @override
  void initState() {
    // Memanggil initState dari parent.
    super.initState();

    // Mengecek apakah perlu menampilkan pesan logout.
    if (widget.showLogoutMessage) {

      // Menunggu sampai tampilan selesai dibuat.
      WidgetsBinding.instance.addPostFrameCallback((_) {

        // Mengecek apakah halaman masih aktif.
        if (!mounted) return;

        // Menampilkan SnackBar.
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Berhasil Logout'),
          ),
        );
      });
    }
  }


  // Membuat tampilan Login.
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // AppBar halaman Login.
      appBar: AppBar(
        title: const Text('Login'),
      ),

      // Isi halaman.
      body: Center(
        child: Padding(

          // Memberikan jarak dari tepi layar.
          padding: const EdgeInsets.all(24),

          child: Column(

            // Membuat isi berada di tengah.
            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              // Icon user.
              const Icon(
                Icons.account_circle,
                size: 100,
                color: Colors.blue,
              ),

              // Memberikan jarak.
              const SizedBox(height: 20),

              // Judul.
              const Text(
                'Selamat Datang',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Memberikan jarak.
              const SizedBox(height: 10),

              // Deskripsi.
              const Text(
                'Silakan masuk untuk melanjutkan',
              ),

              // Memberikan jarak.
              const SizedBox(height: 30),

              // Membuat tombol memenuhi lebar layar.
              SizedBox(
                width: double.infinity,

                child: ElevatedButton(

                  // Aksi ketika tombol ditekan.
                  onPressed: () async {

                    // Menyimpan status login menjadi true.
                    await PreferenceHandler.setLogin(true);

                    // Mengecek apakah halaman masih aktif.
                    if (!context.mounted) return;

                    // Pindah ke HomeScreen.
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },

                  // Tulisan pada tombol.
                  child: const Text('Masuk'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Class untuk halaman Home.
class HomeScreen extends StatelessWidget {

  // Constructor HomeScreen.
  const HomeScreen({super.key});

  // Membuat tampilan Home.
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // AppBar Home.
      appBar: AppBar(

        // Judul AppBar.
        title: const Text('Home'),

        // Tombol Logout.
        actions: [

          IconButton(

            // Icon Logout.
            icon: const Icon(Icons.logout),

            // Aksi ketika Logout ditekan.
            onPressed: () async {

              // Mengubah status login menjadi false.
              await PreferenceHandler.setLogin(false);

              // Mengecek apakah halaman masih aktif.
              if (!context.mounted) return;

              // Kembali ke LoginScreen.
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(
                    showLogoutMessage: true,
                  ),
                ),
              );
            },
          ),
        ],
      ),

      // Isi halaman Home.
      body: const Center(
        child: Text(
          'Selamat Datang di Home!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}