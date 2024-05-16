import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../viewmodel/booking_viewmodel.dart';

enum BookingStatus {
  accepted,
  canceled,
  pending,
}

class Booking {
  final String fullName;
  final String email;
  final String phoneNumber;
  final DateTime date;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final BookingStatus status;

  Booking({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.status,
  });

  Booking copyWith({
    String? fullName,
    String? email,
    String? phoneNumber,
    DateTime? date,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
    BookingStatus? status,
  }) {
    return Booking(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      date: date ?? this.date,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      status: status ?? this.status,
    );
  }
}

class BooksPage extends ConsumerStatefulWidget {
  const BooksPage({Key? key}) : super(key: key);

  @override
  ConsumerState<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends ConsumerState<BooksPage> {
  final List<Booking> _bookings = [];

  // @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     ref.watch(bookingViewModelProvider.notifier).getUserBooking();
  //   });
  //   super.initState();
  // }

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  // Function to reload the data when the user triggers a refresh.
  Future<void> _handleRefresh() async {
    // Implement the logic to reload the data here.
    ref.watch(bookingViewModelProvider.notifier).getUserBooking();
  }

  String _formatTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();
    final dateTime = DateTime(
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );
    final formattedTime = DateFormat.jm().format(dateTime);
    return formattedTime;
  }

  Future<void> _showDeleteConfirmation(
      BuildContext context, String bookingId) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: const Text('Are you sure you want to delete this booking?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                ref
                    .read(bookingViewModelProvider.notifier)
                    .deleteUserBooking(bookingId);

                ref.watch(bookingViewModelProvider.notifier).getUserBooking();

                Navigator.of(context).pop();
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final userBooking = ref.read(bookingViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text('My Bookings'),
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _handleRefresh,
        child: ListView.builder(
          itemCount: userBooking.userbookings.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Card(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: ListTile(
                    title: Text(
                      'Name: ${userBooking.userbookings[index].fullname}',
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4.0),
                        Text(
                          'Email: ${userBooking.userbookings[index].email}',
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          'Phone: ${userBooking.userbookings[index].phoneNum}',
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          'Date:  ${userBooking.userbookings[index].bookingDate}',
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          'Time:  ${userBooking.userbookings[index].startTime} - ${userBooking.userbookings[index].endTime}',
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Booked',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            IconButton(
                              onPressed: () {
                                _showDeleteConfirmation(
                                  context,
                                  userBooking.userbookings[index].bookingId!,
                                );
                              },
                              icon: const Icon(Icons.delete, color: Colors.red),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // trailing: Column(
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: [
                    //     const Text(
                    //       'Booked',
                    //       style: TextStyle(
                    //         color: Colors.green,
                    //         fontSize: 16,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //     const SizedBox(height: 15),
                    //     IconButton(
                    //       onPressed: () {
                    //         _showDeleteConfirmation(
                    //           context,
                    //           userBooking.userbookings[index].bookingId!,
                    //         );
                    //       },
                    //       icon: const Icon(Icons.delete, color: Colors.red),
                    //     ),
                    //   ],
                    // ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
