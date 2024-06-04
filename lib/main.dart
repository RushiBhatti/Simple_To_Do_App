import 'package:flutter/material.dart';
import 'package:to_do_app/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        // useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
