//this is for statefull
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class OthersBid extends StatefulWidget{
  const OthersBid({super.key});
  @override
  State<OthersBid> createState() => _OthersBid();
}

class _OthersBid extends State<OthersBid>{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Color(0xfff10d76), // Set the border color
          width: .8, // Set the border width
        ),
      ),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child : ClipOval(
                    child: Image.network(
                      'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1600',
                      width: 50,
                      height: 50,
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
                        fontSize: 15,
                      ),
                    ),

                    Text(
                      "Comment Time",
                    ),

                    Container(
                      width: 100, // Set the width to ensure the Divider spans the full width
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1.0,
                      ),
                    ),
                    Text(
                      "this is my bid",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox( height: 5),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}