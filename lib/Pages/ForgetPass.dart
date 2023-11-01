//this is for statefull
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ForgetPass extends StatefulWidget{
  const ForgetPass({super.key});
  @override
  State<ForgetPass> createState() => _ForgetPass();
}

class _ForgetPass extends State<ForgetPass>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forget Passoword"),
        centerTitle: true,
      ),
    );
  }
}