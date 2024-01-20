import 'dart:io';

import 'package:android_app_project_bookhub/widgets/HomePage/Button.dart';
import 'package:android_app_project_bookhub/widgets/HomePage/PostWidget.dart';
import 'package:flutter/material.dart';
class PostLinkWiget extends StatefulWidget{
  const PostLinkWiget({super.key});
  @override
  State<PostLinkWiget> createState() => _PostLinkWiget();
}

class _PostLinkWiget extends State<PostLinkWiget>{

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(10),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child:Column(
          children: [

            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child : ClipOval(
                    child: Image.file(
                      File('/data/user/0/com.example.android_app_project_bookhub/cache/10abb823-7a12-4c68-ad81-f59ec10f8edf/Shaeakh.jpg'),
                        width: 55,
                        height: 55,
                        fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded (
                  child: TextField(

                    decoration: InputDecoration(
                      hintText: 'Sell/Exchange your book',
                      hintStyle: TextStyle(fontSize: 15.0),
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
                SizedBox(width: 16.0),
                Icon(Icons.attach_file),
                SizedBox(width: 16.0),
                Icon(Icons.image),
                SizedBox(width: 16.0),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 0, 10, 0),
              child: Button(
                text:'Post your sell',
                onTap: (){},
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const PostWiget()) );
      },
    );
  }
}