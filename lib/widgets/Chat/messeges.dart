import 'package:android_app_project_bookhub/widgets/Chat/msg_bbl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Messeges extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('chat').orderBy(
            'time',
            descending: true
        ).snapshots(),
        builder: (ctx, chatSnapshot){
          if(chatSnapshot.connectionState==ConnectionState.waiting){
            return Center( child: CircularProgressIndicator(), );
          }
          final chatDocs = chatSnapshot.data?.docs;
          return ListView.builder(
            reverse: true,
            itemCount: chatSnapshot.data?.docs.length,
            itemBuilder: (ctx,index) => MsgBbl(chatDocs?[index]['text']),
          );
        }
    );
  }
}