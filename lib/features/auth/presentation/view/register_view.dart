import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harmo_futsal/features/auth/data/model/auth_api_model.dart';
// import 'package:harmo_futsal/model/users.dart';

import '../../../../core/common/snackbar/my_snackbar.dart';
import '../../domain/entity/student_entity.dart';
import '../viewmodel/auth_view_model.dart';

// ignore: camel_case_types
class Register_page extends ConsumerStatefulWidget {
  const Register_page({super.key});

  @override
  ConsumerState<Register_page> createState() => _Register_pageState();
}

// ignore: camel_case_types
class _Register_pageState extends ConsumerState<Register_page> {
  final key = GlobalKey<FormState>();
  final gap = const SizedBox(height: 8);
  bool isPasswordVisible = false;

  List<Users> lstUsers = [];

  final usernameController = TextEditingController();
  final lastNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final emailController = TextEditingController();
  final numberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authViewModelProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.green,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          // centerTitle: true,
          // title: const Text(
          //   "Register Here",
          //   style: TextStyle(color: Colors.black),
          // ),
        ),
        body: Container(
          color: Colors.green,
          height: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: key,
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  gap,
                  const Text(
                    "Welcome!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Register your account here',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 35),

                  //username
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: TextFormField(
                      controller: usernameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Your Username';
                        }
                        return null;
                      },
                      style: const TextStyle(
                          color: Color.fromARGB(255, 12, 12, 12)),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        fillColor: const Color.fromARGB(255, 248, 245, 245),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "User Name",
                        prefixIcon: const Icon(
                          Icons.person,
                        ),
                        iconColor: Colors.black,
                        labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 6, 0, 0),
                        ),
                      ),
                    ),
                  ),
                  gap,
                  //fname
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: TextFormField(
                      controller: firstNameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter First Name';
                        }
                        return null;
                      },
                      style: const TextStyle(
                          color: Color.fromARGB(255, 12, 12, 12)),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        fillColor: const Color.fromARGB(255, 248, 245, 245),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "First Name",
                        prefixIcon: const Icon(
                          Icons.person,
                        ),
                        iconColor: Colors.black,
                        labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 6, 0, 0),
                        ),
                      ),
                    ),
                  ),
                  gap,
                  //lname
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: TextFormField(
                      controller: lastNameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Last Name';
                        }
                        return null;
                      },
                      style: const TextStyle(
                          color: Color.fromARGB(255, 12, 12, 12)),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        fillColor: const Color.fromARGB(255, 248, 245, 245),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Last Name",
                        prefixIcon: const Icon(
                          Icons.person,
                        ),
                        iconColor: Colors.black,
                        labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 6, 0, 0),
                        ),
                      ),
                    ),
                  ),
                  gap, //number
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: TextFormField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      controller: numberController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Your Contact Number';
                        }
                        return null;
                      },
                      style: const TextStyle(
                          color: Color.fromARGB(255, 12, 12, 12)),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        fillColor: const Color.fromARGB(255, 248, 245, 245),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Number",
                        prefixIcon: const Icon(
                          Icons.phone,
                        ),
                        iconColor: Colors.black,
                        labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 6, 0, 0),
                        ),
                      ),
                    ),
                  ),
                  gap,
                  //email
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty ||
                            !value.contains("@") ||
                            !value.contains(".")) {
                          return 'Please enter the valide Email';
                        }
                        return null;
                      },
                      style: const TextStyle(
                          color: Color.fromARGB(255, 12, 12, 12)),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        fillColor: const Color.fromARGB(255, 248, 245, 245),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Email",
                        prefixIcon: const Icon(
                          Icons.email,
                        ),
                        iconColor: Colors.black,
                        labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 6, 0, 0),
                        ),
                      ),
                    ),
                  ),
                  gap,
                  //password
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        controller: passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter first name';
                          }
                          return null;
                        },
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        obscureText: !isPasswordVisible,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.black)),
                          fillColor: const Color.fromARGB(255, 248, 245, 245),
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          labelText: "Password",
                          prefixIcon: const Icon(Icons.password),
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
                  // Padding(
                  //   padding: const EdgeInsets.only(right: 10, left: 10),
                  //   child: SizedBox(
                  //     width: double.infinity,
                  //     child: TextFormField(
                  //       controller: confirmPasswordController,
                  //       validator: (value) {
                  //         if (value!.isEmpty) {
                  //           return 'Please enter first name';
                  //         } else if (value != passwordController.text) {
                  //           return 'please write the same password ';
                  //         }
                  //         return null;
                  //       },
                  //       style: const TextStyle(
                  //         color: Colors.black,
                  //       ),
                  //       obscureText: !isPasswordVisible,
                  //       decoration: InputDecoration(
                  //         focusedBorder: OutlineInputBorder(
                  //             borderSide: const BorderSide(color: Colors.black),
                  //             borderRadius: BorderRadius.circular(10)),
                  //         fillColor: const Color.fromARGB(255, 248, 245, 245),
                  //         filled: true,
                  //         border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(10)),
                  //         labelText: "Confirm Password",
                  //         prefixIcon: const Icon(Icons.password),
                  //         suffixIcon: IconButton(
                  //           icon: Icon(
                  //             isPasswordVisible
                  //                 ? Icons.visibility
                  //                 : Icons.visibility_off,
                  //           ),
                  //           onPressed: () {
                  //             setState(() {
                  //               isPasswordVisible = !isPasswordVisible;
                  //             });
                  //           },
                  //         ),
                  //         labelStyle: const TextStyle(
                  //           color: Color.fromARGB(255, 6, 0, 0),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 35),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 10.0, left: 10, right: 10),
                    child: SizedBox(
                      height: 50.0,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black),
                        child: const Text(
                          "Register",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        onPressed: () {
                          if (key.currentState!.validate()) {
                            // ignore: non_constant_identifier_names
                            UserEntity Users = UserEntity(
                              fname: firstNameController.text.trim(),
                              lname: lastNameController.text.trim(),
                              userName: usernameController.text.trim(),
                              password: passwordController.text.trim(),
                              email: emailController.text.trim(),
                              phoneNum:
                                numberController.text.trim(),
                              
                            );
                            ref
                                .read(authViewModelProvider.notifier)
                                .registerUser(Users);

                            if (authState.error != null) {
                              showSnackBar(
                                message: authState.error.toString(),
                                context: context,
                                color: Colors.red,
                              );
                            } else {
                              showSnackBar(
                                message: 'Registered successfully',
                                context: context,
                              );
                            }

                            // // lstUsers.add(Users);
                            // // ScaffoldMessenger.of(context)
                            // //     .showSnackBar(const SnackBar(
                            // //   content: Text("Account Created succesfully"),
                            // //   duration: Duration(seconds: 2),
                            // //   backgroundColor: Colors.green,
                            // //   behavior: SnackBarBehavior.floating,
                            // // ));
                            // // Clear the text field values

                            // usernameController.clear();
                            // firstNameController.clear();
                            // lastNameController.clear();
                            // emailController.clear();
                            // numberController.clear();
                            // passwordController.clear();
                            // confirmPasswordController.clear();
                          }
                        },
                      ),
                    ),
                  ),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}
