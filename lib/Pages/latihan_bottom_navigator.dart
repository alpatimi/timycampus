import 'package:flutter/material.dart';

class LatihanBottomNavigator extends StatefulWidget {
  const LatihanBottomNavigator({ Key? key }) : super(key: key);

  @override
  _LatihanBottomNavigatorState createState() => _LatihanBottomNavigatorState();
}

class _LatihanBottomNavigatorState extends State<LatihanBottomNavigator> {
 int _currentIndex = 0;
 final List<Widget> _pages = [
  const Center(
    child: Text('Halaman Beranda 1', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
  ),
  const Center(
    child: Text('Halaman Beranda 2', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
  ),
  const Center(
    child: Text('Halaman Beranda 3', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
  ),
 ];
 
 void _onTap(int index) {
   setState(() {
     _currentIndex = index;
   });
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LatihanBottomNavigator Bottom Navigatior'),
        backgroundColor: Colors.amber,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
 }
