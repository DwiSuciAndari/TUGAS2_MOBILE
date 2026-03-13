import 'package:flutter/material.dart';
import 'screen/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Mobile',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primaryColor: Colors.pink,
        scaffoldBackgroundColor: Color(0xffFCE4EC),

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.pink,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pinkAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),

      home: LoginPage(),
    );
  }
}
