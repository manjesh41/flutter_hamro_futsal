import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harmo_futsal/config/router/app_route.dart';
import 'package:harmo_futsal/features/booking/presentation/viewmodel/booking_viewmodel.dart';
import 'package:sensors_plus/sensors_plus.dart';

import '../../viewmodel/profile_state.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  late double _x;
  late double _y;
  late double _z;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(bookingViewModelProvider.notifier).getUserBooking();
    });
    super.initState();
    _startOrientationSensor();
  }
  //orientation sensor

  void _startOrientationSensor() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        _x = event.x;
        _y = event.y;
        _z = event.z;
      });
    });
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var userState = ref.watch(profileViewModelProvider);

    return Scaffold(
      backgroundColor: Colors.green,
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return SingleChildScrollView(
            child: SizedBox(
              height: double.maxFinite,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 40,
                      bottom: 40,
                      right: 20,
                      left: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, AppRoute.userGetProfile);
                                },
                                icon: const Icon(
                                  Icons.person_pin_circle_rounded,
                                  size: 35,
                                ),
                              ),
                              const Text(
                                " Hello ",
                                //${userState.usersData[0].userName!}
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: SizedBox(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(25.0),
                            child: const Image(
                              image: AssetImage("assets/images/bakd.png"),
                            ),
                          ),
                          Positioned.fill(
                            bottom: 27,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, AppRoute.booknow);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 252, 252, 253),
                                ),
                                child: const Text(
                                  "Book Now",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        color: Colors.pink,
                        child: GridView(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10),
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, AppRoute.booknow);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color.fromARGB(255, 22, 22, 22),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/icons8-booking-64.png',
                                    ),
                                    const Text(
                                      "Booking",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, AppRoute.reviews);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color.fromARGB(255, 22, 22, 22),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/icons8-reviews-64.png',
                                    ),
                                    const Text(
                                      "Reviews",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            // InkWell(
                            //   onTap: () {
                            //     Navigator.pushNamed(context, AppRoute.gallery);
                            //   },
                            //   child: Container(
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(20),
                            //       color: const Color.fromARGB(255, 22, 22, 22),
                            //     ),
                            //     child: Column(
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       children: [
                            //         Image.asset(
                            //           'assets/images/icons8-gallery-64.png',
                            //         ),
                            //         const Text(
                            //           "Gallery",
                            //           style: TextStyle(
                            //               color: Colors.white, fontSize: 20),
                            //         )
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, AppRoute.books);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color.fromARGB(255, 22, 22, 22),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/icons8-about-us-100.png',
                                      height: 75,
                                    ),
                                    const Text(
                                      "Books",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (orientation == Orientation.landscape)
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Gyroscope Data:\nX: $_x\nY: $_y\nZ: $_z',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
