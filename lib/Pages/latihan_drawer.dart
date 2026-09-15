import 'package:flutter/material.dart';

class LatihanDrawer extends StatefulWidget {
  const LatihanDrawer({Key? key}) : super(key: key);

  @override
  State<LatihanDrawer> createState() => _LatihanDrawerState();
}

class _LatihanDrawerState extends State<LatihanDrawer> {
  int _selectedIndex = 0;

  final List<String> _titles = [
    'Latihan Icon Avatar',
    'Settings',
    'About',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        backgroundColor: Colors.blue,
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('John Doe'),
              accountEmail: Text('john.doe@example.com'),

              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  'JD',
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.blue,
                  ),
                ),
              ),

              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),

            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Latihan Icon Avatar'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      body: Center(
        child: Text(
          _titles[_selectedIndex],
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

