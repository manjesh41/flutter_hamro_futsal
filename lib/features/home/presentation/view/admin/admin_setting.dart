import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../viewmodel/home_viewmodel.dart';

class AdminSetting extends ConsumerStatefulWidget {
  const AdminSetting({Key? key}) : super(key: key);

  @override
  ConsumerState<AdminSetting> createState() => _AdminSettingState();
}

class _AdminSettingState extends ConsumerState<AdminSetting> {
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
