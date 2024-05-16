import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harmo_futsal/config/router/app_route.dart';

import '../../viewmodel/home_viewmodel.dart';

class Profile extends ConsumerStatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  ConsumerState<Profile> createState() => _ProfileState();
}

class _ProfileState extends ConsumerState<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Settings"),
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          ListTile(
            leading: const Icon(
              Icons.lock,
              color: Colors.black,
            ),
            title: const Text(
              'Change Password',
              style: TextStyle(color: Colors.black),
            ),
            tileColor: Colors.white, // Customize the background color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            onTap: () {
              Navigator.pushNamed(context, AppRoute.changePassword);
              // Navigate to the change password screen
            },
          ),
          const SizedBox(height: 8.0),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: Colors.black,
            ),
            title: const Text(
              'Update Profile ',
              style: TextStyle(color: Colors.black),
            ),
            tileColor: Colors.white, // Customize the background color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            onTap: () {
              Navigator.pushNamed(context, AppRoute.userEditProfile);
              // Navigate to the update profile picture screen
            },
          ),
          const SizedBox(height: 8.0),
          ListTile(
            leading: const Icon(
              Icons.phone,
              color: Colors.black,
            ),
            title: const Text(
              'Contact Us',
              style: TextStyle(color: Colors.black),
            ),
            tileColor: Colors.white, // Customize the background color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            onTap: () {
              // Navigate to the contact us screen
            },
          ),
          const SizedBox(height: 8.0),
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
            title: const Text(
              'Log Out',
              style: TextStyle(color: Colors.black),
            ),
            tileColor: Colors.white, // Customize the background color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            onTap: () {
              ref.read(homeViewModelProvider.notifier).logout(context);
              // Perform log out action
            },
          ),
        ],
      ),
    );
  }
}
