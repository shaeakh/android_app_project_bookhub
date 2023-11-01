import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget{
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage>{
  //sign out
  void signOut(){
    FirebaseAuth.instance.signOut();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The wall"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: signOut,
              icon: Icon(Icons.logout)),
        ],
      ),
    );
  }
}