import 'package:android_app_project_bookhub/widgets/Registration%20Page/Button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class ProfileCng extends StatefulWidget{
  final String data;
  const ProfileCng({required this.data, Key? key}) : super(key: key);
  @override
  State<ProfileCng> createState() => _ProfileCng();
}

class _ProfileCng extends State<ProfileCng>{

  bool isEditing = false;
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          isEditing
              ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    hintText: 'Add new '+widget.data,
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
                ),
          )
              : Button(
            text: 'Update '+ widget.data + ' Profile',
            onTap: () {
              setState(() {
                isEditing = true;
              });
            },
          ),
          SizedBox(height: 16.0),
          isEditing
              ? Button(
            text: 'Save',
            onTap: () {
              // Perform save action
              String updatedProfile = _textEditingController.text;
              // Handle the updated profile text as needed
              print('Updated Profile: $updatedProfile');

              setState(() {
                isEditing = false;
              });
            },
          )
              : Container(), // Invisible container when not editing
        ],
      ),
    );
  }
}