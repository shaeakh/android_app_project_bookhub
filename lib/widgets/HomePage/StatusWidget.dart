import 'dart:io';
import 'package:android_app_project_bookhub/widgets/HomePage/BidList.dart';
import 'package:android_app_project_bookhub/widgets/HomePage/Button.dart';
import 'package:android_app_project_bookhub/widgets/HomePage/MsgButton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StatusWiget extends StatelessWidget {
  final String UserImgUrl;
  final String Username;
  final String imgUrl;
  final String statement;
  final Timestamp time;
  final String title;
  final String value;

  StatusWiget(
      this.Username, this.imgUrl, this.statement, this.time, this.title, this.value, this.UserImgUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Info Row
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                ClipOval(
                  child: Image.network(
                    'https://static.vecteezy.com/system/resources/thumbnails/010/260/479/small_2x/default-avatar-profile-icon-of-social-media-user-in-clipart-style-vector.jpg',
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  )
                ),
                SizedBox(width: 10), // Add spacing between image and text
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Username,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        DateFormat('HH:mm . dd MMM yyyy').format(time.toDate()),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        value,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Statement and Image
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(statement),
                SizedBox(height: 10),
                imgUrl.isNotEmpty
                    ? ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(
                    File(imgUrl),
                    fit: BoxFit.cover, // Ensure image fits well
                  ),
                )
                    : Container(), // Empty container if imgUrl is empty
                SizedBox(height: 10),
              ],
            ),
          ),
          // See Others Bid
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext) {
                    return BidList();
                  },
                );
              },
              child: Text(
                'See Others Bid',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // Bid Section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Place Your Bid \$',
                      hintStyle: TextStyle(fontSize: 15.0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xfff10d76)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Button(
                  text: 'Bid',
                  onTap: () {},
                ),
                SizedBox(width: 10),
                MsgButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
