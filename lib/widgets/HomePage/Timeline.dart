import 'package:android_app_project_bookhub/widgets/HomePage/StatusWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Timeline extends StatefulWidget{
  const Timeline({super.key});
  @override
  State<Timeline> createState() => _Timeline();
}

class _Timeline extends State<Timeline>{
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: MediaQuery.of(context).size.height, // Set a finite height for the container
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('status').orderBy(
          'time',
        ).snapshots(),
        builder: (ctx, chatSnapshot) {
          if (chatSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          final chatDocs = chatSnapshot.data?.docs;
          return ListView.builder(
            reverse: true,
            itemCount: chatSnapshot.data?.docs.length,
            itemBuilder: (ctx, index) => StatusWiget(
              chatDocs?[index]['Username'],
              chatDocs?[index]['imgUrl'],
              chatDocs?[index]['statement'],
              chatDocs?[index]['time'],
              chatDocs?[index]['title'],
              chatDocs?[index]['value'],
            ),
          );
        },
      ),
    );
  }
}