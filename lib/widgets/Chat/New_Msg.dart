import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class New_Msg extends StatefulWidget{
  @override
  _New_Msg createState() => _New_Msg() ;
}

class _New_Msg extends State<New_Msg>{

  final _controller = new TextEditingController();
  var _enteredMsg = '';
  Future<void> _sendMsg(var _enteredMsg) async {
    FocusScope.of(context).unfocus();
    FirebaseFirestore.instance.collection('chat').add({
      'text' : _enteredMsg,
      'time' : Timestamp.now(),
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Expanded(child:  TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Send a message',
              hintStyle:GoogleFonts.roboto(color: Colors.grey,),
              contentPadding: const EdgeInsets.all(20.0),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder:  OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xfff10d76)),
                borderRadius: BorderRadius.circular(10.0),
              ),
              filled: true,
              fillColor: Colors.transparent,
            ),
            onChanged: (value){
              setState(() {

                _enteredMsg = value;
              });
            },
          ),
          ),

          IconButton(
            color: Colors.pink,
            icon: Icon(Icons.image),
            onPressed: ()  {},
          ),
          IconButton(
              color: Colors.pink,
              icon: Icon(Icons.send),
              onPressed: (){
                _sendMsg(_enteredMsg);
              }
          )
        ],
      ),
    );//
  }

}