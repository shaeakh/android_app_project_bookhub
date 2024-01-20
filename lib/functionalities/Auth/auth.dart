//this is for stateless
import 'package:android_app_project_bookhub/functionalities/Auth/Login_or_Reg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Pages/HomePage.dart';

class AuthPage extends StatelessWidget{
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          // user is logged in
          if(snapshot.hasData){
            return HomePage();
          }
          else {
            return const Log_or_Reg();
          }
        },
      ),
    );
  }

}