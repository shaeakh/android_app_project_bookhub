import 'dart:io';
import 'package:android_app_project_bookhub/widgets/HomePage/StatusWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Timeline extends StatefulWidget {
  const Timeline({super.key});

  @override
  State<Timeline> createState() => _Timeline();
}

class _Timeline extends State<Timeline> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('status').orderBy(
          'time',
        ).snapshots(),
        builder: (ctx, chatSnapshot) {
          if (chatSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (chatSnapshot.hasError) {
            return const Center(child: Text('An error occurred!'));
          }
          if (!chatSnapshot.hasData || chatSnapshot.data?.docs.isEmpty == true) {
            return const Center(child: Text('No data available'));
          }

          final chatDocs = chatSnapshot.data?.docs;

          return ListView.builder(
            reverse: true,
            itemCount: chatDocs?.length ?? 0,
            itemBuilder: (ctx, index) {
              final doc = chatDocs?[index];

              // Provide default values if the data is null
              final username = doc?['Username'] as String? ?? 'Unknown User';
              final imgUrl = doc?['imgUrl'] as String? ?? '';
              final statement = doc?['statement'] as String? ?? '';
              final time = doc?['time'] as Timestamp? ?? Timestamp.now();
              final title = doc?['title'] as String? ?? 'No Title';
              final value = doc?['value'] as String? ?? '';
              final userImgUrl = doc?['UserImgUrl'] as String? ?? '';

              // Check if the image file exists
              final imageFile = File(imgUrl);
              final imageExists = imageFile.existsSync();

              return StatusWiget(
                username,
                imageExists ? imgUrl : 'assets/images/placeholder.png',  // Use a placeholder if the image doesn't exist
                statement,
                time,
                title,
                value,
                userImgUrl,
              );
            },
          );
        },
      ),
    );
  }
}
