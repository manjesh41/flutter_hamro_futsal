import 'package:flutter/material.dart';

import '../../../../../config/router/app_route.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hamro Futsal'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.green,
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            GridItem(
              icon: Icons.people,
              label: 'Users',
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              onTap: () {
                Navigator.pushNamed(context, AppRoute.adminUsers);
                // Handle "Users" grid item tap
              },
            ),
            GridItem(
              icon: Icons.calendar_today,
              label: 'Bookings',
              backgroundColor: Colors.pinkAccent,
              textColor: Colors.white,
              onTap: () {
                Navigator.pushNamed(context, AppRoute.adminBooking);
                // Handle "Bookings" grid item tap
              },
            ),
            GridItem(
              icon: Icons.star,
              label: 'Reviews',
              backgroundColor: Colors.orange,
              textColor: Colors.white,
              onTap: () {
                Navigator.pushNamed(context, AppRoute.reviews);
                // Handle "Reviews" grid item tap
              },
            ),
           
            
          ],
        ),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onTap;

  const GridItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.backgroundColor,
    required this.textColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: textColor),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
