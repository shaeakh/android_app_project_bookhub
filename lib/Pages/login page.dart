import 'package:android_app_project_bookhub/Auth_Services/AuthService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/Login Page/Button.dart';
import '../widgets/Login Page/txtfield.dart';
import 'ForgetPass.dart';
class LoginPage extends StatefulWidget{
  final Function()? onTap;
  LoginPage({
    super.key,
    required this.onTap
  });
  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage>{
  @override
  Widget build(BuildContext context) {
    final TextEditingController EmailTxt = TextEditingController();
    final TextEditingController PassTxt = TextEditingController();

    //Error msg
    void DisplayError(String Msg){
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(Msg),
          )
      );
    }

    //sign in user method
    void signUserIn ()async{
      //loading
      showDialog(
          context: context,
          builder: (context)=> const Center(child: CircularProgressIndicator(),),
      );

      try{
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: EmailTxt.text,
          password: PassTxt.text,
        );
        if(context.mounted) Navigator.pop(context);
      } on FirebaseAuthException catch (e){
        Navigator.pop(context);
        DisplayError(e.code);
      }
    }


    // double ScreenHeight = MediaQuery.of(context).size.height;
    // double ScreenWeidth = MediaQuery.of(context).size.width;
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
                    'A whole community is waiting for you !',
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
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  ForgetPass(),)
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Text(
                            'Forgot Password ?',
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Button(
                    text:'Sign In',
                    onTap: signUserIn,
                  ),
                  SizedBox(height:20.0),
                  Row(
                    children: [
                      Text('       ',
                        style: GoogleFonts.roboto(
                          color: Colors.transparent,
                          fontSize: 15,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1.0,
                          color: Colors.grey,
                        ),
                      ),
                      Text('   or continue with   ',
                        style: GoogleFonts.roboto(
                          color: Color(0xfff10d76),
                          fontSize: 15,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1.0,
                          color: Colors.grey,
                        ),
                      ),
                      Text('       ',
                        style: GoogleFonts.roboto(
                          color: Colors.transparent,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height:20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => AuthService().signInWithGoogle(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Image.asset(
                            'lib/assets/LoginPage/google_logo.png',
                            height: 60,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child : Image.asset(
                          'lib/assets/LoginPage/Facebook_logo.png',
                          height: 60,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child : Image.asset(
                          'lib/assets/LoginPage/Microsoft_logo.png',
                          height: 60,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height:20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member yet ? ',
                        style: GoogleFonts.roboto(
                          color: Colors.grey[700],
                          fontSize: 17,
                        ),
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          'Register now',
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
        ),
    );
  }
}