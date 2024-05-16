// // import 'package:flutter/material.dart';

// // class UserHistory extends StatefulWidget {
// //   const UserHistory({Key? key}) : super(key: key);

// //   @override
// //   State<UserHistory> createState() => _UserHistoryState();
// // }

// // class _UserHistoryState extends State<UserHistory> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.green,
// //       appBar: AppBar(
// //         backgroundColor: Colors.black,
// //         automaticallyImplyLeading: false,
// //         title: const Text("Booking History"),
// //         centerTitle: true,
// //         elevation: 0,
// //       ),
// //       body: ListView(
// //         children: [
// //           const SizedBox(height: 16),
// //           Card(
// //             color: Colors.white,
// //             elevation: 2,
// //             shape: RoundedRectangleBorder(
// //               borderRadius: BorderRadius.circular(10.0),
// //             ),
// //             child: const ListTile(
// //               title: Text(
// //                 "Hamro Futsal",
// //                 style: TextStyle(
// //                   color: Colors.black,
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //               ),
// //               subtitle: Text("Your booking for the futsal is accepted."),
// //               leading: Icon(
// //                 Icons.person,
// //                 color: Colors.black,
// //               ),
// //               trailing: Text("02/04/2022"),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:intl/intl.dart';

// import '../../../../booking/presentation/viewmodel/booking_viewmodel.dart';

// enum BookingStatus {
//   accepted,
//   canceled,
//   pending,
// }

// class Booking {
//   final String fullName;
//   final String email;
//   final String phoneNumber;
//   final DateTime date;
//   final TimeOfDay startTime;
//   final TimeOfDay endTime;
//   final BookingStatus status;

//   Booking({
//     required this.fullName,
//     required this.email,
//     required this.phoneNumber,
//     required this.date,
//     required this.startTime,
//     required this.endTime,
//     required this.status,
//   });

//   Booking copyWith({
//     String? fullName,
//     String? email,
//     String? phoneNumber,
//     DateTime? date,
//     TimeOfDay? startTime,
//     TimeOfDay? endTime,
//     BookingStatus? status,
//   }) {
//     return Booking(
//       fullName: fullName ?? this.fullName,
//       email: email ?? this.email,
//       phoneNumber: phoneNumber ?? this.phoneNumber,
//       date: date ?? this.date,
//       startTime: startTime ?? this.startTime,
//       endTime: endTime ?? this.endTime,
//       status: status ?? this.status,
//     );
//   }
// }

// class UserHistory extends ConsumerStatefulWidget {
//   const UserHistory({Key? key}) : super(key: key);

//   @override
//   ConsumerState<UserHistory> createState() => _UserHistoryState();
// }

// class _UserHistoryState extends ConsumerState<UserHistory> {
//   final List<Booking> _bookings = [];

//   @override
//   void initState() {
//     super.initState();
//   }

//   String _formatTimeOfDay(TimeOfDay time) {
//     final now = DateTime.now();
//     final dateTime = DateTime(
//       now.year,
//       now.month,
//       now.day,
//       time.hour,
//       time.minute,
//     );
//     final formattedTime = DateFormat.jm().format(dateTime);
//     return formattedTime;
//   }

//   Future<bool> _showCancelConfirmationDialog() async {
//     return await showDialog<bool>(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: const Text('Cancel Booking'),
//               content:
//                   const Text('Are you sure you want to cancel this booking?'),
//               actions: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.of(context).pop(false);
//                   },
//                   child: const Text('No'),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.of(context).pop(true);
//                   },
//                   child: const Text('Yes'),
//                 ),
//               ],
//             );
//           },
//         ) ??
//         false;
//   }

//   void _editBooking(int index) {
//     // Handle editing the booking at the given index
//     // Implement your logic here
//     print('Editing booking at index $index');
//   }

//   void _cancelBooking(int index) async {
//     final shouldCancel = await _showCancelConfirmationDialog();
//     if (shouldCancel) {
//       setState(() {
//         _bookings[index] =
//             _bookings[index].copyWith(status: BookingStatus.canceled);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final userBooking = ref.watch(bookingViewModelProvider);
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.green,
//         title: const Text('My Bookings'),
//       ),
//       body: ListView.builder(
//         itemCount: userBooking.userbookings.length,
//         itemBuilder: (context, index) {
//           return Card(
//             margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//             child: ListTile(
//                 title: Text(
//                   'Name: ${userBooking.userbookings[index].fullname}',
//                 ),
//                 subtitle: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(height: 4.0),
//                     Text('Email: ${userBooking.userbookings[index].email}'),
//                     const SizedBox(height: 4.0),
//                     Text('Phone: ${userBooking.userbookings[index].phoneNum}'),
//                     const SizedBox(height: 4.0),
//                     Text(
//                         'Date:  ${userBooking.userbookings[index].bookingDate}'),
//                     const SizedBox(height: 4.0),
//                     Text(
//                       'Time:  ${userBooking.userbookings[index].startTime}} - ${userBooking.userbookings[index].endTime}}',
//                     ),
//                   ],
//                 ),
//                 trailing: const Text(
//                   'Booked',
//                   style: TextStyle(color: Colors.green),
//                 )),
//           );
//         },
//       ),
//     );
//   }
// }
