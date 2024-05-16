import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sensors_plus/sensors_plus.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  DateTime? _lastTapTime;

  final List<String> photos = [
    'https://images.pexels.com/photos/3148452/pexels-photo-3148452.jpeg?cs=srgb&dl=pexels-stanley-morales-3148452.jpg&fm=jpg',
    'https://images.pexels.com/photos/3148452/pexels-photo-3148452.jpeg?cs=srgb&dl=pexels-stanley-morales-3148452.jpg&fm=jpg',
    'https://images.pexels.com/photos/3148452/pexels-photo-3148452.jpeg?cs=srgb&dl=pexels-stanley-morales-3148452.jpg&fm=jpg',
    'https://images.pexels.com/photos/3148452/pexels-photo-3148452.jpeg?cs=srgb&dl=pexels-stanley-morales-3148452.jpg&fm=jpg',
    'https://images.pexels.com/photos/3148452/pexels-photo-3148452.jpeg?cs=srgb&dl=pexels-stanley-morales-3148452.jpg&fm=jpg',
  ];

  @override
  void initState() {
    super.initState();
    accelerometerEvents.listen((event) {
      if (event.x.abs() > 15 && event.y.abs() > 15 && event.z.abs() > 15) {
        _handleDoubleTap();
      }
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text('Gallery'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: photos.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              // Handle photo tap to view it
              print('View photo at index $index');
            },
            onDoubleTap: _handleDoubleTap,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                photos[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
