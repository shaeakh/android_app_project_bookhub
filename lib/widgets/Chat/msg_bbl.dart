import 'package:flutter/material.dart';

class MsgBbl extends StatelessWidget{
  MsgBbl(this.mesg);
  final String mesg;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.circular(12),
      ),
      width: 10,
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 16,
      ),
      margin:  EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 8,

      ),
      child: Text(
        mesg,
        style:  TextStyle(color: Colors.white),

      ),
    );
  }


}