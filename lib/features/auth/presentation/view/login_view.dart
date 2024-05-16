import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harmo_futsal/features/auth/presentation/viewmodel/auth_view_model.dart';

import '../../../../config/router/app_route.dart';

class login_page extends ConsumerStatefulWidget {
  const login_page({super.key});

  @override
  ConsumerState<login_page> createState() => _login_pageState();
}

class _login_pageState extends ConsumerState<login_page> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final gap = const SizedBox(height: 30.0);
  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;

  // get ref => null; // Track password visibility state
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                            10.0), // Adjust the border radius as per your requirements
                        child: const Image(
                          image: AssetImage("assets/images/bakd.png"),
                          alignment: Alignment.center,
                          // height: MediaQuery.of(context).size.height * 0.5,
                          // width: MediaQuery.of(context).size.width * 0.6,

                          fit: BoxFit
                              .cover, // Adjust the fit as per your requirements
                        ),
                      ),
                      gap,
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 60, right: 2, left: 2, bottom: 20),
                        child: SizedBox(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _usernameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Valied User Name';
                              }
                              return null;
                            },
                            style: const TextStyle(
                                color: Color.fromARGB(255, 14, 14, 14),
                                fontSize: 15),
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.black),
                              ),
                              fillColor:
                                  const Color.fromARGB(255, 248, 245, 245),
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelText: "User name",
                              prefixIcon: const Icon(
                                Icons.person_rounded,
                              ),
                              iconColor: Colors.black,
                              labelStyle: const TextStyle(
                                fontSize: 18,
                                fontFamily: "Montserrat-Regular",
                                color: Color.fromARGB(255, 6, 0, 0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 2, left: 2),
                        child: SizedBox(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _passwordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter last name';
                              }
                              return null;
                            },
                            style: const TextStyle(
                                color: Color.fromARGB(255, 12, 12, 12),
                                fontSize: 20),
                            obscureText: !isPasswordVisible,
                            decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              fillColor:
                                  const Color.fromARGB(255, 248, 245, 245),
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
                      const SizedBox(
                        height: 10,
                      ),
                      // const Padding(
                      //   padding: EdgeInsets.only(right: 10, left: 10),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.end,
                      //     children: [
                      //       Text(
                      //         "   forgot password?",
                      //         style: TextStyle(
                      //             fontSize: 15,
                      //             fontFamily: "Montserrat Regular"),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      const SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: SizedBox(
                          height: 50.0,
                          width: double.infinity,
                          child: ElevatedButton(
                            key: const ValueKey('loginButton'),
                            onPressed: () async {
                              if (_usernameController.text.trim() == "admin" &&
                                  _passwordController.text.trim() == "admin") {
                                // ignore: use_build_context_synchronously
                                ref
                                    .read(authViewModelProvider.notifier)
                                    .loginAdmin(
                                      context,
                                      _usernameController.text,
                                      _passwordController.text,
                                    );

                                // ignore: use_build_context_synchronously
                              } else {
                                // ignore: use_build_context_synchronously
                                ref
                                    .read(authViewModelProvider.notifier)
                                    .loginUser(
                                      context,
                                      _usernameController.text,
                                      _passwordController.text,
                                    );
                              }
                            },

                            // ignore: use_build_context_synchronously

                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                            ),
                            child: const Text(
                              "Login",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),

                          // child: ElevatedButton(
                          //     onPressed: () {
                          //       if (key.currentState!.validate()) {
                          //         Navigator.pushNamed(
                          //             context, "/userDashboardRout");
                          //       }
                          //     },
                          //     style: ElevatedButton.styleFrom(
                          //         backgroundColor: Colors.black),
                          //     child: const Text(
                          //       "Login",
                          //       style: TextStyle(fontSize: 18),
                          //     )),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //
                          const Text(
                            "Don't have an acoount?",
                            style: TextStyle(fontSize: 15),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AppRoute.registerRoute);
                            },
                            child: const Text(
                              "Click here!",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 254, 252, 252),
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.black,
                                  decorationStyle: TextDecorationStyle.solid),
                            ),
                          )
                        ],
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
