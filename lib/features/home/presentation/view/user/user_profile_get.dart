import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harmo_futsal/features/home/domain/entity/profile_entity.dart';

import '../../viewmodel/home_viewmodel.dart';
import '../../viewmodel/profile_state.dart';

class UserProfilePage extends ConsumerStatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  ConsumerState<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends ConsumerState<UserProfilePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(profileViewModelProvider.notifier).getUserInfo();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var userState = ref.watch(profileViewModelProvider);
    // print(userState.usersData);
    List<ProfileEntity> userList = userState.usersData;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/images/bakd.png'),
            ),
            const SizedBox(height: 20),

            // Check if userList is not empty before accessing its elements
            userList.isNotEmpty
                ? itemProfile(userList[0].userName!, Icons.person)
                : const SizedBox(), // Placeholder when userList is empty
            const SizedBox(height: 10),

            userList.isNotEmpty
                ? itemProfile(userList[0].fname!, Icons.person)
                : const SizedBox(),

            const SizedBox(height: 10),
            userList.isNotEmpty
                ? itemProfile(
                    userList[0].lname!,
                    Icons.person,
                  )
                : const SizedBox(),
            const SizedBox(height: 10),
            userList.isNotEmpty
                ? itemProfile(userList[0].email!, Icons.mail)
                : const SizedBox(),
            const SizedBox(height: 10),
            userList.isNotEmpty
                ? itemProfile(userList[0].phoneNum!, Icons.phone)
                : const SizedBox(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget itemProfile(String title, IconData iconData) {
    if (iconData == Icons.logout) {
      // Logout button with a different design
      return ElevatedButton(
        onPressed: () {
          ref.read(homeViewModelProvider.notifier).logout(context);
          // TODO: Implement logout action here
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    } else {
      // Regular profile item
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              color: Colors.green.withOpacity(.2),
              spreadRadius: 2,
              blurRadius: 10,
            ),
          ],
        ),
        child: ListTile(
          title: Text(title),
          leading: Icon(iconData),
          tileColor: Colors.white,
        ),
      );
    }
  }
}
