import 'package:android_app_project_bookhub/widgets/HomePage/Button.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
class PostWiget extends StatefulWidget{
  const PostWiget({super.key});
  @override
  State<PostWiget> createState() => _PostWiget();
}

class _PostWiget extends State<PostWiget>{

  void _pickFile(){

  }

  @override
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
              onTap: _pickFile,
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
            Container(
              margin: EdgeInsets.fromLTRB(15.0,0.0,15.0,15.0),
              child: Button(
                text:'Post your sell',
                onTap: (){
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