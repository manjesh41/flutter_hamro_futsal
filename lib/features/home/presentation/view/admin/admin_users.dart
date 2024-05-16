import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../viewmodel/home_viewmodel.dart';

class AdminUser extends ConsumerStatefulWidget {
  const AdminUser({Key? key}) : super(key: key);

  @override
  ConsumerState<AdminUser> createState() => _AdminUserState();
}

class _AdminUserState extends ConsumerState<AdminUser> {
  @override
  Widget build(BuildContext context) {
    final allUsers = ref.watch(homeViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin User'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.green,
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: allUsers.users!.length,
          itemBuilder: (context, index) {
            return buildUserTile(
              username: allUsers.users![index].userName,
              firstName: allUsers.users![index].fname,
              lastName: allUsers.users![index].lname,
              email: allUsers.users![index].email,
              phoneNumber: allUsers.users![index].phoneNum,
              index: index,
              // onDelete: () {
              //   if (mounted) {
              //     // Check if the widget is still mounted before calling setState()
              //     _showDeleteConfirmationDialog(index);
              //   }
              // },
            );
          },
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog(int index) {
    final allUsers = ref.watch(homeViewModelProvider);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content: const Text('Are you sure you want to delete this user?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                print(allUsers.users![index].id!);
                ref
                    .watch(homeViewModelProvider.notifier)
                    .deleteUser(allUsers.users![index].id!);
                ref.watch(homeViewModelProvider.notifier).getAllUsers();

                Navigator.of(context).pop();
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  Widget buildUserTile({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required int index,
    // required VoidCallback onDelete,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const Icon(Icons.person),
              title: Text(
                '  $username',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.black,
                ),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                color: Colors.red,
                onPressed: () {
                  if (mounted) {
                    // Check if the widget is still mounted before calling setState()
                    _showDeleteConfirmationDialog(index);
                  }
                },
              ),
            ),
            const SizedBox(height: 8),
            buildUserDetail('First Name', firstName),
            buildUserDetail('Last Name', lastName),
            buildUserDetail('Email', email),
            buildUserDetail('Phone Number', phoneNumber),
          ],
        ),
      ),
    );
  }

  Widget buildUserDetail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          children: [
            TextSpan(
              text: '$label: ',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            TextSpan(text: value, style: const TextStyle(color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
