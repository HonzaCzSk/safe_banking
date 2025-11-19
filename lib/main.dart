import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const SafeBankingApp());
}

class SafeBankingApp extends StatelessWidget {
  const SafeBankingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Safe Banking',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        brightness: Brightness.light,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
