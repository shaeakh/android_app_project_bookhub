import 'dart:io';

import 'package:android_app_project_bookhub/widgets/HomePage/BidList.dart';
import 'package:android_app_project_bookhub/widgets/HomePage/Button.dart';
import 'package:android_app_project_bookhub/widgets/HomePage/MsgButton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class StatusWiget extends StatelessWidget{


  StatusWiget(this.Username, this.imgUrl, this.statement,this.time,this.title,this.value, this.UserImgUrl);
  final String UserImgUrl;
  final String Username;
  final String imgUrl;
  final String statement;
  final Timestamp time;
  final String title;
  final String value;

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
                    child: Image.file(
                      File(UserImgUrl),
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                    // child: Image.network(
                    //   'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1600',
                    //   width: 60,
                    //   height: 60,
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox( height: 6 ),
                    Text(
                      Username,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),

                    Text(
                        time.toDate().hour.toString()+':'+time.toDate().minute.toString()+' . '+DateFormat('dd MMM yyyy').format(time.toDate()),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(value,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16,0,16,0),
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Text(statement),
                  SizedBox( height:  10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(
                      File(imgUrl),
                    ),
                  ),
                  SizedBox( height: 10),

                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Padding(
                child: GestureDetector(
                  onTap: (){
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext){
                        return BidList();
                      },
                    );
                  },
                  child: Text(
                    'See Others Bid',
                    textAlign: TextAlign.left,
                  ),
                ),
                padding: EdgeInsets.fromLTRB(16,0,16,10),
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
                  SizedBox(
                    width: 10,
                  ),
                  Button(
                    text: 'Bid',
                    onTap: () {  },
                  ),
                  MsgButton(),
                ],
              ),

            ),
          ],
        ),
      ),
    );
  }

}