import 'package:coin_watch/di/di.dart';
import 'package:coin_watch/pages/splash_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  await getItInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
