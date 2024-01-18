import 'package:android_app_project_bookhub/widgets/HomePage/Button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PostWiget extends StatefulWidget{
  const PostWiget({super.key});
  @override
  State<PostWiget> createState() => _PostWiget();
}

class _PostWiget extends State<PostWiget>{
  final TextEditingController title = TextEditingController();
  final TextEditingController value = TextEditingController();
  final TextEditingController statement = TextEditingController();
  late String imgUrl;


  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        imgUrl = pickedFile.path;
      });
    }
  }

  //getting username section
  String? email = FirebaseAuth.instance.currentUser?.email;

  Future<String?> getUsernameFromEmail(String email) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    QuerySnapshot querySnapshot = await users.where('email', isEqualTo: email).get();
    if (querySnapshot.docs.isNotEmpty) {
      String username = querySnapshot.docs[0].get('username');
      return username;
    } else {
      return null;
    }
  }



  Future<void> post(String Username,String Title, String Value, String Statement) async {
      String? Username = await getUsernameFromEmail(email!);
      FirebaseFirestore.instance.collection('Status').add({
        'Username' : Username,
        'time' : Timestamp.now(),
        'value': Value,
        'title' : Title,
        'statement' : Statement,
        'imgUrl' : imgUrl,
      });
      //other text clear section
      value.clear();
      title.clear();
      statement.clear();
  }

  @override
  void initState() {
    super.initState();
    imgUrl = ''; // Initialize with an empty string
  }
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.all(10),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(15.0),
              child: TextField(
                controller: title,
                decoration: InputDecoration(
                  hintText: 'Title',
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder:  OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xfff10d76)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15.0,0.0,15.0,15.0),
              child: TextField(
                controller: value,
                decoration: InputDecoration(
                  hintText: 'Value',
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder:  OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xfff10d76)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(15.0,0.0,15.0,15.0),
              child: TextField(
                controller: statement,
                textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Explain Your Statement',
                    hintStyle: TextStyle(
                        fontSize: 15.0,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xfff10d76)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 10.0), // Adjust padding as needed
                  ),
                ),
              ),
            InkWell(
              onTap: _pickImage,
              child: Container(
                margin: EdgeInsets.fromLTRB(15.0,0.0,15.0,15.0),
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Color(0xfff10d76)), // Outline color

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Add Photo'),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.photo, // Replace with the desired icon
                      size: 30.0, // Adjust the size of the icon
                      color: Color(0xfff10d76), // Icon color
                    ),

                  ],
                )
              ),
            ),
            imgUrl.isNotEmpty? Image.file(File(imgUrl), height: 100): Container(),
            SizedBox(height: 15,),
            Container(
              margin: EdgeInsets.fromLTRB(15.0,0.0,15.0,15.0),
              child: Button(
                text:'Post your sell',
                onTap: (){
                  post('abc',title.text,value.text+' \$' ,statement.text);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}