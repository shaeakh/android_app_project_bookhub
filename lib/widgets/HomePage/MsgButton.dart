import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MsgButton extends StatelessWidget{


  const MsgButton({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap : (){},
      child: Container(
        padding: EdgeInsets.all(17.0),
        margin: EdgeInsets.fromLTRB(10, 0 , 0 , 0),
        decoration: BoxDecoration(
          color: Color(0xfff10d76),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Icon(
          Icons.send,
          color: Colors.white,
          ),
        ),
      ),
    );
  }

}