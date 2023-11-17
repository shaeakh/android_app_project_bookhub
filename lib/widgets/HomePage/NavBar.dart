import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class NavBar extends StatelessWidget{
  const NavBar({super.key});
  void signOut(){
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              accountName: Text(
                  'Shaeakh Ahmed Chowdhury',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                  'Shaeakh12@gmail.com',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1600',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
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
            onTap:  () => null,
          ),


          ListTile(
            leading: Icon(Icons.message),
            title: Text('Messages'),
            onTap:  () => null,
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: 20,
                height: 20,
                child: Center(
                  child: Text(
                    '8',
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
            onTap:  () => null,
          ),


          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap:  () => null,
          ),


          ListTile(
            leading: Icon(Icons.policy),
            title: Text('Policies'),
            onTap:  () => null,
          ),


          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text('Dashboard'),
            onTap:  () => null,
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: 20,
                height: 20,
                child: Center(
                  child: Text(
                    '8',
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
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap:  signOut,
          ),
        ],
      ),
    );
  }
}