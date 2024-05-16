import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harmo_futsal/features/home/presentation/view/user/user_homepage.dart';
import 'package:harmo_futsal/features/home/presentation/view/user/user_profile.dart';

import '../../../../booking/presentation/view/user_bboking/books.dart';

class userDb extends ConsumerStatefulWidget {
  const userDb({super.key});

  @override
  ConsumerState<userDb> createState() => _userDbState();
}

class _userDbState extends ConsumerState<userDb> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOption = [
    const HomeView(),
    const BooksPage(),
    const Profile(),
  ];
  void _onItemTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: _widgetOption[_selectedIndex],
      // bottomNavigationBar: Container(
      //   color: Colors.white,
      //   child: const Padding(
      //     padding: EdgeInsets.symmetric(
      //       horizontal: 15.0,
      //       vertical: 8.0,
      //     ),
      //     child: GNav(
      //       backgroundColor: Colors.white,
      //       color: Colors.black,
      //       tabBackgroundColor: Colors.green,
      //       gap: 12,
      //       padding: EdgeInsets.all(16),
      //       tabs: [
      //         GButton(
      //           icon: Icons.home,
      //           text: "Home",
      //         ),
      //         GButton(
      //           icon: Icons.history,
      //           text: "History",
      //         ),
      //         GButton(
      //           icon: Icons.person,
      //           text: "Profile",
      //         ),
      //       ],
      //     ),
      //   ),
      // ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Booking History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 12, 12, 12),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
