import 'dart:io';

import 'package:android_app_project_bookhub/Pages/Profile.dart';
import 'package:android_app_project_bookhub/widgets/Chat/messeges.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../../Pages/Chat_Page.dart';
import '../../Pages/msg.dart';
import '../../Pages/settings.dart';
class NavBar extends StatefulWidget{
  const NavBar({super.key});
  @override
  State<NavBar> createState() => _NavBar();
}

class _NavBar extends State<NavBar>{
  void signOut(){
    FirebaseAuth.instance.signOut();
  }

  //getting username section
  String? email = FirebaseAuth.instance.currentUser?.email ?? 'Guest';
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              '',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text(
              email!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  "https://cdn.vectorstock.com/i/1000x1000/50/09/user-icon-female-person-symbol-profile-avatar-vector-20715009.webp",
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                )
              ),
            ),
            decoration: BoxDecoration(
              color: Color(0xfff10d76),
              image: DecorationImage(
                image: AssetImage('lib/assets/HomePage/NavBar/BackGroundImage.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),



          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap:  (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Profile()) );
            },
          ),


          ListTile(
            leading: Icon(Icons.message),
            title: Text('Messages'),
            onTap:  (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  MessagePage()) );
            },
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: 20,
                height: 20,
                child: Center(
                  child: Text(
                    '3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),

                  ),
                ),
              ),
            ),
          ),


          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share'),
            onTap:  () async {
              final url = 'https://github.com/shaeakh/android_app_project_bookhub';
                await Share.share('Hello there, You can contribute our app here \n\n$url');
            },
          ),


          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap:  (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>SettingsPage()) );
            },
          ),


          ListTile(
            leading: Icon(Icons.policy),
            title: Text('Policies'),
            onTap:  () => null,
          ),

          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap:  signOut,
          ),
        ],
      ),
    );
  }
}