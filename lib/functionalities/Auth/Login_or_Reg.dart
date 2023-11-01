import 'package:android_app_project_bookhub/Pages/Register%20Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Pages/login page.dart';
class Log_or_Reg extends StatefulWidget{
  const Log_or_Reg({super.key});
  @override
  State<Log_or_Reg> createState() => _Log_or_Reg();
}

class _Log_or_Reg extends State<Log_or_Reg>{
  bool ShowLogPage = true;

  void togglePages(){
    setState((){
      ShowLogPage = !ShowLogPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(ShowLogPage){
      return LoginPage(onTap: togglePages);
    }
    else{
      return RegPage(onTap: togglePages);
    }
  }
}


