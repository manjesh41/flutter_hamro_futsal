import 'package:flutter/material.dart';

import '../config/router/app_route.dart';
import '../features/proximity.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ProximityBrightnessControl(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hamro Futsal',
        // theme: AppTheme.getApplicationTheme(),
        initialRoute: AppRoute.splashRoute,
    
        // initialRoute: AppRoute.booknow,
        routes: AppRoute.getApplicationRoute(),
      ),
    );
  }
}
