import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget{
  final String text;
  final Function()? onTap;
  const Button({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(17.0),
        //margin: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: Color(0xfff10d76),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(text,
            style:  GoogleFonts.roboto(
              color: Color(0xffffffff),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

}