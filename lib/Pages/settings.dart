import 'package:android_app_project_bookhub/widgets/HomePage/Button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/Settings/DeactivateButton.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notificationsEnabled = true;
  bool darkmode = true;
  bool sharedate = true;
  bool verification = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notification Settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SwitchListTile(
              title: Text('Enable Notifications'),
              value: notificationsEnabled,
              activeColor: Colors.white,
              activeTrackColor: Colors.pink,
              onChanged: (value) {
                setState(() {
                  notificationsEnabled = value;
                });
              },
            ),
            SizedBox(height: 8),
            Divider(height: 5,),
            SizedBox(height: 8),
            Text(
              'Appearance',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SwitchListTile(
              title: Text('Darkmode'),
              value: darkmode,
              activeColor: Colors.white,
              activeTrackColor: Colors.pink,
              onChanged: (value) {
                setState(() {
                  darkmode = value;
                });
              },
            ),
            SizedBox(height: 8),
            Divider(height: 5,),
            SizedBox(height: 8),
            Text(
              'Privacy',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SwitchListTile(
              title: Text('Share data'),
              value: sharedate,
              activeColor: Colors.white,
              activeTrackColor: Colors.pink,
              onChanged: (value) {
                setState(() {
                  sharedate = value;
                });
              },
            ),
            SizedBox(height: 8),
            Divider(height: 5,),
            SizedBox(height: 8),
            Text(
              'Securiy',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SwitchListTile(
              title: Text('Two-Step Verification'),
              value: verification,
              activeColor: Colors.white,
              activeTrackColor: Colors.pink,
              onChanged: (value) {
                setState(() {
                  verification = value;
                });
              },
            ),
            SizedBox(height: 8),
            Divider(height: 5,),
            SizedBox(height: 8),
            DButton(
                text: 'Deactive Account',
                onTap: (){}
            ),

            // Add more settings sections as needed
          ],
        ),
      ),
    );
  }
}