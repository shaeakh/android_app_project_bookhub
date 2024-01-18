import 'package:flutter/material.dart';
import '../widgets/Chat/New_Msg.dart';
import '../widgets/Chat/messeges.dart';

class ChatScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xfff10d76),
        title: Text(
            "Users",
          style: TextStyle(
            color: Colors.white,

          ),
        ),
      ),
      body : Container(
        child: Column(
          children: <Widget>[

            Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(50, 0, 0, 0),
                  child: Messeges(),
                ),
            ),
            New_Msg(),
          ],
        ),
      ),
    );
  }
}