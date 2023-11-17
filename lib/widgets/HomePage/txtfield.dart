import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Txtfield extends StatelessWidget{
  final controller;
  final String hintText;
  final bool obscureText;

  const Txtfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.send),
          hintText: hintText,
          hintStyle:GoogleFonts.roboto(color: Colors.grey,),
          contentPadding: const EdgeInsets.all(20.0),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xfff10d76)),
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          fillColor: Colors.transparent,
        ),
        style: GoogleFonts.roboto(
          color: const Color(0xff99325f),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

}