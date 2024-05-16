import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entity/password_entity.dart';
import '../../viewmodel/password_viewmodel.dart';

class ChangePassword extends ConsumerStatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  ConsumerState<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends ConsumerState<ChangePassword> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final gap = const SizedBox(height: 30.0);
  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  bool isChangePasswordVisible = false;

  @override
  void dispose() {
    // Dispose the text editing controllers
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var passwordState = ref.watch(passwordViewModelProvider);
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
                              ref
                                  .read(passwordViewModelProvider.notifier)
                                  .changePassword(
                                    PasswordEntity(
                                      oldPassword: _oldPasswordController.text,
                                      newPassword: _newPasswordController.text,
                                      confirmPassword:
                                          _confirmPasswordController.text,
                                    ),
                                  );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Changing password...'),
                                  backgroundColor: Colors.green,
                                ),
                              );
                              _oldPasswordController.clear();
                              _newPasswordController.clear();
                              _confirmPasswordController.clear();

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
