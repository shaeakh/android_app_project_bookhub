import 'package:android_app_project_bookhub/widgets/HomePage/Button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'BidButton.dart';
class StatusWiget extends StatefulWidget{
  const StatusWiget({super.key});
  @override
  State<StatusWiget> createState() => _StatusWiget();
}

class _StatusWiget extends State<StatusWiget>{

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
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child : ClipOval(
                    child: Image.network(
                      'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1600',
                      width: 55,
                      height: 55,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox( height: 6 ),
                    Text(
                        "Users Name",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox( height: 2 ),
                    Text(
                      "Status Time",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox( height: 20, ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16,0,16,0),
              child: Column(
                children: [
                  Text("Paragraphs are the building blocks of papers. Many students define paragraphs in terms of length: a paragraph is a"),
                  SizedBox( height:  10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      image: AssetImage('lib/assets/HomePage/Sample Book.jpg'),
                    ),
                  ),
                  SizedBox( height: 10),

                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(16,0,16,10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: ' Place Your Bid \$ ',
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
                  BidButton(),
                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}