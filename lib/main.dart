import 'package:flutter/material.dart';
import 'package:mental_health_app/pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        textTheme: TextTheme(
          bodySmall: TextStyle(fontSize: 18, color: Colors.grey.shade200),
          bodyMedium: TextStyle(fontSize: 20),
          headlineSmall: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ), // светлая тема
      // darkTheme: ThemeData.dark(),
      // themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
