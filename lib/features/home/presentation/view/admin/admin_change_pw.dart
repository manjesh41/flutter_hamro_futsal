import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdminChangePassword extends ConsumerStatefulWidget {
  const AdminChangePassword({Key? key}) : super(key: key);

  @override
  ConsumerState<AdminChangePassword> createState() =>
      _AdminChangePasswordState();
}

class _AdminChangePasswordState extends ConsumerState<AdminChangePassword> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final gap = const SizedBox(height: 30.0);
  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  bool isChangePasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text('Change Password'),
        ),
        body: Container(
          height: double.maxFinite,
          color: Colors.green,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 50, bottom: 50, right: 25, left: 25),
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 2, left: 2),
                        child: SizedBox(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _oldPasswordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your old password';
                              }
                              return null;
                            },
                            style: const TextStyle(
                              color: Color.fromARGB(255, 12, 12, 12),
                              fontSize: 20,
                            ),
                            obscureText: !isPasswordVisible,
                            decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              fillColor:
                                  const Color.fromARGB(255, 248, 245, 245),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: "Old Password",
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isPasswordVisible = !isPasswordVisible;
                                  });
                                },
                              ),
                              labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 6, 0, 0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      gap,
                      Padding(
                        padding: const EdgeInsets.only(right: 2, left: 2),
                        child: SizedBox(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _newPasswordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your new password';
                              }
                              return null;
                            },
                            style: const TextStyle(
                              color: Color.fromARGB(255, 12, 12, 12),
                              fontSize: 20,
                            ),
                            obscureText: !isPasswordVisible,
                            decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              fillColor:
                                  const Color.fromARGB(255, 248, 245, 245),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: "New Password",
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isPasswordVisible = !isPasswordVisible;
                                  });
                                },
                              ),
                              labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 6, 0, 0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      gap,
                      Padding(
                        padding: const EdgeInsets.only(right: 2, left: 2),
                        child: SizedBox(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _confirmPasswordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please confirm your new password';
                              }
                              if (value != _newPasswordController.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                            style: const TextStyle(
                              color: Color.fromARGB(255, 12, 12, 12),
                              fontSize: 20,
                            ),
                            obscureText: !isPasswordVisible,
                            decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              fillColor:
                                  const Color.fromARGB(255, 248, 245, 245),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: "Confirm Password",
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isPasswordVisible = !isPasswordVisible;
                                  });
                                },
                              ),
                              labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 6, 0, 0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 50.0,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              // Call the change password API or perform the necessary actions
                              // Here you can use the values from the controllers:
                              // _oldPasswordController.text
                              // _newPasswordController.text
                              // _confirmPasswordController.text

                              // Show a success message or navigate to a new screen
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                          ),
                          child: const Text(
                            "Change Password",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
