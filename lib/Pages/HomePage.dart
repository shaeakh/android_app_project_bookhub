import 'package:android_app_project_bookhub/widgets/HomePage/Bids.dart';

import 'package:android_app_project_bookhub/widgets/HomePage/searchWidget.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:android_app_project_bookhub/widgets/HomePage/NavBar.dart';

import '../widgets/HomePage/BidList.dart';
import '../widgets/HomePage/PostLinkWidget.dart';
import '../widgets/HomePage/StatusWidget.dart';


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
    return Scaffold(
      backgroundColor: Color(0xffe4e5e7) ,
      drawer: NavBar(),
      appBar: AppBar(
        title: Text(
            "The wall",
            style: TextStyle(
            color: Colors.white,
              fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xfff10d76),
      ),
      body:Container(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Search(),
                PostLinkWiget(),
                //BidList(),
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