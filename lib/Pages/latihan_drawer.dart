class LatihanDrawer extends StatefulWidget {
  const LatihanDrawer({ Key? key }) : super(key: key);

  @override
  _LatihanDrawerState createState() => _LatihanDrawerState();
}

class _LatihanDrawerState extends State<LatihanDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_tItles[_selectedIndex]),
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
                backgroundImage: circleAvatar(
                  bakcgroundColor: Colors.white,
                  child: Text(
                    "JD",
                    style: TextStyle(fontSize: 40.0, color: Colors.blue),
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
                setState(() {
                  _selectedIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              selected: _selectedIndex == 2,
              onTap: () {
                setState(() {
                  _selectedIndex = 2;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      
    );
  }
}