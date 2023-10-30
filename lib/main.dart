import 'package:flutter/material.dart';
import 'Pages/home.dart';
import 'Pages/login page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bookhub',
      theme: ThemeData(
          brightness: Brightness.light,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
      //home: home(),
      home: LoginPage(),
    );
  }
}
