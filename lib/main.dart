import 'package:android_app_project_bookhub/Pages/Profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Pages/Chat_Page.dart';
import 'Pages/Register Page.dart';
import 'Pages/home.dart';
import 'Pages/login page.dart';
import 'firebase_options.dart';
import 'functionalities/Auth/Login_or_Reg.dart';
import 'functionalities/Auth/auth.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Bookhub',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      //home: home(),
      //home: LoginPage(),
     // home: RegPage(),
      //home: Log_or_Reg(),
      home: Profile(),
      //home: AuthPage(),
      //home: ChatPage(receiverUserEmail: 'Shaeakh12@gmail.com', receiverUserID: '123',),
    );
  }
}
/*
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
* */