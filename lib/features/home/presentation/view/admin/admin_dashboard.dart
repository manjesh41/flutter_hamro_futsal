import 'package:flutter/material.dart';
import 'package:harmo_futsal/features/home/presentation/view/admin/admin_home.dart';
import 'package:harmo_futsal/features/home/presentation/view/admin/admin_setting.dart';

class AdminDb extends StatefulWidget {
  const AdminDb({Key? key}) : super(key: key);

  @override
  State<AdminDb> createState() => _AdminDbState();
}

class _AdminDbState extends State<AdminDb> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = [
    const AdminHome(),
    const AdminSetting()
    // const SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 12, 12, 12),
        onTap: _onItemTapped,
      ),
    );
  }
}
