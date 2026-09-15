import 'package:flutter/material.dart';

class Tugas8 extends StatefulWidget {
  const Tugas8({super.key});

  @override
  State<Tugas8> createState() => _Tugas8State();
}

class _Tugas8State extends State<Tugas8> {
  // =========================
  // BOTTOM NAVIGATION
  // =========================
  int _currentIndex = 0;

  // =========================
  // MENU DRAWER
  // =========================
  int _selectedMenu = 0;

  // =========================
  // CHECKBOX
  // =========================
  bool _isChecked = false;

  // =========================
  // SWITCH
  // =========================
  bool _isDarkMode = false;

  // =========================
  // DROPDOWN
  // =========================
  final List<String> _kategoriList = [
    'Elektronik',
    'Pakaian',
    'Makanan',
    'Lainnya',
  ];

  String? _selectedKategori;

  // =========================
  // DATE PICKER
  // =========================
  DateTime? _selectedDate;

  // =========================
  // TIME PICKER
  // =========================
  TimeOfDay? _selectedTime;

  // =========================
  // JUDUL MENU DRAWER
  // =========================
  final List<String> _judulMenu = [
    'Syarat & Ketentuan',
    'Mode Gelap',
    'Pilih Kategori Produk',
    'Pilih Tanggal Lahir',
    'Atur Pengingat',
  ];

  // =========================
  // ICON MENU DRAWER
  // =========================
  final List<IconData> _iconMenu = [
    Icons.check_box,
    Icons.dark_mode,
    Icons.category,
    Icons.calendar_today,
    Icons.access_time,
  ];

  // =========================
  // DATE PICKER
  // =========================
  Future<void> _pilihTanggal() async {
    final DateTime? tanggal = await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 1, 1),
      firstDate: DateTime(1945),
      lastDate: DateTime.now(),
    );

    if (tanggal != null) {
      setState(() {
        _selectedDate = tanggal;
      });
    }
  }

  // =========================
  // TIME PICKER
  // =========================
  Future<void> _pilihWaktu() async {
    final TimeOfDay? waktu = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (waktu != null) {
      setState(() {
        _selectedTime = waktu;
      });
    }
  }

  // =========================
  // FORMAT TANGGAL
  // =========================
  String _formatTanggal(DateTime tanggal) {
    const namaBulan = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember',
    ];

    return '${tanggal.day} ${namaBulan[tanggal.month - 1]} ${tanggal.year}';
  }

  // =========================
  // FORMAT WAKTU
  // =========================
  String _formatWaktu(TimeOfDay waktu) {
    final jam12 = waktu.hourOfPeriod == 0 ? 12 : waktu.hourOfPeriod;

    final periode = waktu.period == DayPeriod.am ? 'AM' : 'PM';

    final jam = jam12.toString().padLeft(2, '0');
    final menit = waktu.minute.toString().padLeft(2, '0');

    return '$jam:$menit $periode';
  }

  // =========================
  // CHECKBOX PAGE
  // =========================
  Widget _buildCheckboxPage() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Checkbox(
                value: _isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    _isChecked = value ?? false;
                  });
                },
              ),
              const Expanded(
                child: Text(
                  'Saya menyetujui semua persyaratan yang berlaku',
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Text(
            _isChecked
                ? 'Lanjutkan pendaftaran diperbolehkan'
                : 'Anda belum bisa melanjutkan',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: _isChecked ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  // =========================
  // SWITCH PAGE
  // =========================
  Widget _buildSwitchPage() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(24),
      color: _isDarkMode ? Colors.grey[900] : Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Switch(
                value: _isDarkMode,
                onChanged: (bool value) {
                  setState(() {
                    _isDarkMode = value;
                  });
                },
              ),
              Text(
                'Aktifkan Mode Gelap',
                style: TextStyle(
                  color: _isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Text(
            _isDarkMode
                ? 'Mode Gelap Aktif'
                : 'Mode Terang Aktif',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: _isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  // =========================
  // DROPDOWN PAGE
  // =========================
  Widget _buildDropdownPage() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButton<String>(
            value: _selectedKategori,
            hint: const Text('Pilih kategori'),

            items: _kategoriList.map((String kategori) {
              return DropdownMenuItem<String>(
                value: kategori,
                child: Text(kategori),
              );
            }).toList(),

            onChanged: (String? value) {
              setState(() {
                _selectedKategori = value;
              });
            },
          ),

          const SizedBox(height: 20),

          if (_selectedKategori != null)
            Text(
              'Anda memilih kategori: $_selectedKategori',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
        ],
      ),
    );
  }

  // =========================
  // DATE PICKER PAGE
  // =========================
  Widget _buildDatePickerPage() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: _pilihTanggal,
            child: const Text('Pilih Tanggal Lahir'),
          ),

          const SizedBox(height: 20),

          if (_selectedDate != null)
            Text(
              'Tanggal Lahir: ${_formatTanggal(_selectedDate!)}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
        ],
      ),
    );
  }

  // =========================
  // TIME PICKER PAGE
  // =========================
  Widget _buildTimePickerPage() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: _pilihWaktu,
            child: const Text('Pilih Waktu Pengingat'),
          ),

          const SizedBox(height: 20),

          if (_selectedTime != null)
            Text(
              'Pengingat diatur pukul: ${_formatWaktu(_selectedTime!)}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
        ],
      ),
    );
  }

  // =========================
  // BODY TUGAS 7
  // =========================
  Widget _buildBody() {
    switch (_selectedMenu) {
      case 0:
        return _buildCheckboxPage();

      case 1:
        return _buildSwitchPage();

      case 2:
        return _buildDropdownPage();

      case 3:
        return _buildDatePickerPage();

      case 4:
        return _buildTimePickerPage();

      default:
        return const Center(
          child: Text('Pilih menu di Drawer'),
        );
    }
  }

  // =========================
  // TENTANG APLIKASI
  // =========================
  Widget _buildTentangPage() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.apps,
              size: 80,
              color: Colors.blue,
            ),

            const SizedBox(height: 20),

            const Text(
              'Form Input Interaktif',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              'Aplikasi Flutter sederhana yang menyediakan '
              'berbagai komponen input interaktif seperti '
              'Checkbox, Switch, Dropdown, Date Picker, '
              'dan Time Picker.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Dibuat oleh: Timi',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Versi 1.0.0',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // =========================
  // DRAWER
  // =========================
  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Form Input Interaktif',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),

          ...List.generate(
            _judulMenu.length,
            (index) {
              return ListTile(
                leading: Icon(
                  _iconMenu[index],
                ),

                title: Text(
                  _judulMenu[index],
                ),

                selected: _selectedMenu == index,

                onTap: () {
                  setState(() {
                    _selectedMenu = index;
                  });

                  Navigator.pop(context);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  // =========================
  // BUILD
  // =========================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _currentIndex == 0
              ? _judulMenu[_selectedMenu]
              : 'Tentang Aplikasi',
        ),
      ),

      // DRAWER HANYA AKTIF DI HOME
      drawer: _currentIndex == 0
          ? _buildDrawer()
          : null,

      // BODY
      body: _currentIndex == 0
          ? _buildBody()
          : _buildTentangPage(),

      // BOTTOM NAVIGATION BAR
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,

        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Tentang',
          ),
        ],
      ),
    );
  }
}