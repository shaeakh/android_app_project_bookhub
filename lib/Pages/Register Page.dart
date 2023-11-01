import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import '../widgets/Registration Page/Button.dart';
import '../widgets/Registration Page/txtfield.dart';

class RegPage extends StatefulWidget{
  final Function()? onTap;
  const RegPage({
    super.key,
    required this.onTap
  });
  @override
  State<RegPage> createState() => _RegPage();
}

class _RegPage extends State<RegPage>{
  @override
  Widget build(BuildContext context) {
    final TextEditingController EmailTxt = TextEditingController();
    final TextEditingController PassTxt = TextEditingController();
    final TextEditingController ConfirmPassTxt = TextEditingController();

    //Error msg
    void DisplayError(String Msg){
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(Msg),
          )
      );
    }

    void signUp() async {
      showDialog(
        context: context,
        builder: (context)=> const Center(
          child: CircularProgressIndicator(),
        ),
      );
      if(PassTxt.text != ConfirmPassTxt.text){
        Navigator.pop(context);
        DisplayError("Passwords don't match");
        return;
      }

      try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: EmailTxt.text,
            password: PassTxt.text
        );
        if(context.mounted) Navigator.pop(context);
      } on FirebaseAuthException catch (e){
        Navigator.pop(context);
        DisplayError(e.code);
      }

    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor:  Colors.white,
        body:  SafeArea(
          child: Center(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 50),
                  //logo
                  Image(
                    image: AssetImage('lib/assets/LoginPage/main_logo.png'),
                    width: 200,
                  ),
                  SizedBox(height: 15),

                  //Text
                  Text(
                    'Lets create an account !',
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),

                  //user textfield
                  Txtfield(
                    controller: EmailTxt,
                    hintText: 'Email',
                    obscureText: false,
                  ),
                  SizedBox(height: 15),
                  Txtfield(
                      controller: PassTxt,
                      hintText: 'Password',
                      obscureText: true
                  ),
                  SizedBox(height: 15),
                  Txtfield(
                      controller: ConfirmPassTxt,
                      hintText: 'Confirm Password',
                      obscureText: true
                  ),
                  SizedBox(height: 10),
                  SizedBox(height: 10),
                  Button(
                    text:'Sign Up !',
                    onTap: signUp,
                  ),
                  SizedBox(height:20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already Have an account ? ',
                        style: GoogleFonts.roboto(
                          color: Colors.grey[700],
                          fontSize: 17,
                        ),
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          'Log in',
                          style: GoogleFonts.roboto(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
  
}