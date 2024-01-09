import 'package:android_app_project_bookhub/widgets/HomePage/PostWidget.dart';
import 'package:android_app_project_bookhub/widgets/HomePage/searchWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:android_app_project_bookhub/widgets/HomePage/NavBar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Auth_Services/AuthService.dart';
import '../widgets/HomePage/Button.dart';
import '../widgets/HomePage/StatusWidget.dart';
import '../widgets/HomePage/txtfield.dart';
import 'ForgetPass.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePage();

  void onTap() {
  }
}

class _HomePage extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    var EmailTxt;
    var PassTxt;
    return Scaffold(
      backgroundColor: Color(0xffe4e5e7) ,
      drawer: NavBar(),
      appBar: AppBar(
        title: Text("The wall"),
        centerTitle: true,
        backgroundColor: Color(0xfff10d76),
      ),
      body:Container(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Search(),
                PostWiget(),
                StatusWiget(),
                StatusWiget(),
                StatusWiget(),
              ],
            ),
          ),
        ),
      );
  }
  signUserIn() {
  }
}