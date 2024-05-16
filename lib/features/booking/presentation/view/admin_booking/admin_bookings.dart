import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harmo_futsal/features/booking/presentation/viewmodel/booking_viewmodel.dart';
import 'package:intl/intl.dart';

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

class AdminBooking extends ConsumerStatefulWidget {
  const AdminBooking({Key? key}) : super(key: key);

  @override
  ConsumerState<AdminBooking> createState() => _AdminBookingState();
}

class _AdminBookingState extends ConsumerState<AdminBooking> {
  final List<Booking> _bookings = [];

  @override
  void initState() {
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    final allBookings = ref.watch(bookingViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text('Admin Bookings'),
      ),
      body: Container(
        color: Colors.green,
        child: ListView.builder(
          itemCount: allBookings.bookings.length,
          itemBuilder: (context, index) {
            return Card(
              margin:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListTile(
                  title: Text(
                    'Name: ${allBookings.bookings[index].fullname}',
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4.0),
                      Text(
                        'Email: ${allBookings.bookings[index].email}',
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        'Phone: ${allBookings.bookings[index].phoneNum}',
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        'Date: ${allBookings.bookings[index].bookingDate}',
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        'Time: ${allBookings.bookings[index].startTime} - ${allBookings.bookings[index].endTime}',
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  trailing: allBookings.bookings[index].status ==
                          BookingStatus.accepted
                      ? const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        )
                      : const Icon(
                          Icons.lock,
                          color: Colors.green,
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
