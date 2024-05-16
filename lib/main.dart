import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harmo_futsal/core/network/local/hive_service.dart';

// import 'package:hive_and_api_for_class/core/app.dart';
// import 'package:hive_and_api_for_class/core/network/local/hive_service.dart';

import 'core/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HiveService().init();
  HiveService().deleteHive();
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
}
