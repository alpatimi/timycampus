import 'package:flutter/material.dart';

class BelajarTipis2 extends StatefulWidget {
  const BelajarTipis2({ Key? key }) : super(key: key);

  @override
  _BelajarTipis2State createState() => _BelajarTipis2State();
}
  int _selectedMenu = 0;
  bool _isChecked = false;
  bool _isDarkMode = false;

  final List<String> _judulMenu = [
    'Syarat & Ketentuan',
    'Mode Gelap',
    'Pilih Kategori Produk',
    'Pilih Tanggal Lahir',
    'Atur Pengingat',
  ];
class _BelajarTipis2State extends State<BelajarTipis2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _judulMenu [_selectedMenu],
        ) ,
      ),

      
    );
  }
}