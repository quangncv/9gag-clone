import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nine_gags/common/routes.dart';
import 'package:nine_gags/di/injection.dart';
import 'package:nine_gags/ui/home/home_page.dart';

void main() {
  runZonedGuarded(() async {
    await setupDI();
    runApp(const MyApp());
  }, (error, stack) { });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: const Color(0x00f8f8f8),
        primaryColor: Colors.black,
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.black,
          displayColor: Colors.black
        )
      ),
      onGenerateRoute: generatorRoute,
      initialRoute: '$HomePage',
    );
  }
}
