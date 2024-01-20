import 'package:flutter/material.dart';
class Search extends StatefulWidget{
  const Search({Key? key}) : super(key: key);
  @override
  State<Search> createState() => _Search();
}

class _Search extends State<Search>{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(fontSize: 15.0),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  focusedBorder:  OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xfff10d76)),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 16.0),
          Icon(Icons.search),
          SizedBox(width: 16.0),
        ],
      ),
    );
  }
}