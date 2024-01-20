import 'package:android_app_project_bookhub/Pages/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/Profile/Cng.dart';
class Profile extends StatefulWidget{
  const Profile({super.key});
  @override
  State<Profile> createState() => _Profile();
}

class _Profile extends State<Profile>{
  final double Coverheight = 280;
  final double Profileheight = 144;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff10d76),
        leading: IconButton(
          icon: Icon(
              Icons.arrow_back,
            color: Colors.white,
                size: 35,
          ),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()) );
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children:<Widget> [
          buildtop(),
          buildContent(),
          ProfileCng(data: 'Name',),
          ProfileCng(data: 'Email',),
        ],
      ),
    );
  }

  Widget buildContent() => Container(
    child: Column(
      children: [
        Text(
            'Shaeakh Ahmed Chowdhury',
          style: TextStyle(
            fontSize: 28,
              fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Divider(
            height: 5,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 12,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialIcon(FontAwesomeIcons.slack),
            SizedBox(width: 12,),
            SocialIcon(FontAwesomeIcons.github),
            SizedBox(width: 12,),
            SocialIcon(FontAwesomeIcons.facebook),
            SizedBox(width: 12,),
            SocialIcon(FontAwesomeIcons.linkedin),
          ],
        ),
        SizedBox(height: 12,),
      ],
    ),
  );
  Widget SocialIcon(IconData icon) => CircleAvatar(
    backgroundColor: Color(0xfff10d76),
    radius: 25,
    child: Material(
      shape: CircleBorder(),
      clipBehavior: Clip.hardEdge,
      color: Colors.transparent,
      child: InkWell(
        onTap: (){},
        child: Center(
          child: Icon(
            icon,
            size: 32,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );

  Widget buildtop(){
    final top = Coverheight-Profileheight/2;
    final bottom = Profileheight/2;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: buildCoverImage(),
        ),
        Positioned(
          top: top,
          child: buildProfileImage(),
        ),

      ],
    );
  }

  Widget buildCoverImage() => Container(
    color: Color(0xffe4e5e7),
    child: Image.network(
      'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1600',
      width: double.infinity,
      height: Coverheight,
      fit: BoxFit.cover,
    ),
  );
  Widget buildProfileImage() => CircleAvatar(
    radius: Profileheight/2,
    backgroundImage: NetworkImage(

        'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1600',

    ),
  );
}