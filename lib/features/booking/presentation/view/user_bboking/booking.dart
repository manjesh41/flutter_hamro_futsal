import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:harmo_futsal/features/booking/domain/entity/booking_entiry.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sensors_plus/sensors_plus.dart';

import '../../../data/model/booking_api_model.dart';
import '../../viewmodel/booking_viewmodel.dart';

class BookingPage extends ConsumerStatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  ConsumerState<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends ConsumerState<BookingPage> {
  List<BookingApiModel> lstBookings = [];
  final key = GlobalKey<FormState>();
  DateTime? _lastTapTime;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController dateController =
      TextEditingController(); // Date controller

  TimeOfDay? selectedStartTime;
  TimeOfDay? selectedEndTime;

  @override
  void initState() {
    super.initState();
    accelerometerEvents.listen((event) {
      if (event.x.abs() > 15 && event.y.abs() > 15 && event.z.abs() > 15) {
        _handleDoubleTap();
      }
    });
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    startTimeController.dispose();
    endTimeController.dispose();
    dateController.dispose(); // Dispose the date controller
    super.dispose();
  }

  void _handleDoubleTap() {
    if (_lastTapTime == null ||
        DateTime.now().difference(_lastTapTime!) > const Duration(seconds: 1)) {
      _lastTapTime = DateTime.now();
    } else {
      _captureScreenshot();
    }
  }

  Future<void> _captureScreenshot() async {
    if (await _requestPermissions()) {
      final directory = await getTemporaryDirectory();
      final path = '${directory.path}/screenshot.png';

      await Fluttertoast.showToast(msg: 'Taking screenshot...');
      await Future.delayed(
          const Duration(milliseconds: 200)); // Give some delay to showToast

      final imageBytes = await _takeScreenshot();
      await _saveScreenshot(imageBytes!, path);

      await Fluttertoast.showToast(msg: 'Screenshot captured and saved!');
    } else {
      Fluttertoast.showToast(msg: 'Permission denied to save screenshot.');
    }
  }

  Future<bool> _requestPermissions() async {
    final permissionStatus = await Permission.storage.request();
    return permissionStatus.isGranted;
  }

  Future<Uint8List?> _takeScreenshot() async {
    final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    final boundary = context.findRenderObject() as RenderRepaintBoundary;
    final image = await boundary.toImage(pixelRatio: pixelRatio);
    final byteData = await image.toByteData(format: ImageByteFormat.png);
    return byteData?.buffer.asUint8List();
  }

  Future<void> _saveScreenshot(Uint8List imageBytes, String path) async {
    await ImageGallerySaver.saveImage(imageBytes, name: 'screenshot.png');
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        dateController.text =
            '${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}';
      });
    }
  }

  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      final modifiedTime = TimeOfDay(
        hour: pickedTime.hour,
        minute: 0,
      );

      setState(() {
        selectedStartTime = modifiedTime;
        startTimeController.text =
            '${modifiedTime.hour.toString().padLeft(2, '0')}:00';
        selectedEndTime = TimeOfDay(
          hour: modifiedTime.hour + 1,
          minute: 0,
        );
        endTimeController.text =
            '${selectedEndTime!.hour.toString().padLeft(2, '0')}:00';
      });
    }
  }

  void _bookAppointment() {
    // Implement your booking logic here
    // You can retrieve the form data using the controllers
  }

  @override
  Widget build(BuildContext context) {
    final bookingState = ref.watch(bookingViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Page'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: key,
          child: ListView(
            children: [
              TextFormField(
                controller: fullNameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: phoneNumberController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16.0),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: dateController,
                    decoration: const InputDecoration(
                      labelText: 'Date',
                      suffixIcon: Icon(
                        Icons.calendar_today,
                        color: Colors.green,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              GestureDetector(
                onTap: () => _selectStartTime(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: startTimeController,
                    decoration: const InputDecoration(
                      labelText: 'Start Time',
                      suffixIcon: Icon(
                        Icons.access_time,
                        color: Colors.green,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: endTimeController,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'End Time',
                  suffixIcon: Icon(
                    Icons.access_time,
                    color: Colors.green,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  print("object");
                  if (key.currentState!.validate()) {
                    BookingEntity booking = BookingEntity(
                      fullname: fullNameController.text,
                      email: emailController.text,
                      phoneNum: phoneNumberController.text,
                      startTime: startTimeController.text,
                      endTime: endTimeController.text,
                      bookingDate: dateController.text,
                      status: '',
                    );
                    ref
                        .read(bookingViewModelProvider.notifier)
                        .addBooking(booking, context);

                    ref
                        .watch(bookingViewModelProvider.notifier)
                        .getUserBooking();
                    // if (bookingState.error != null) {
                    //   showSnackBar(
                    //     message: bookingState.error.toString(),
                    //     context: context,
                    //     color: Colors.red,
                    //   );
                    // } else {
                    //   showSnackBar(
                    //     message: 'Booking successfully',
                    //     context: context,
                    //   );
                    // }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: const Text('Book Now'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
