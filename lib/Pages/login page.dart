
import 'package:android_app_project_bookhub/widgets/Login%20Page/txtfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/Login Page/Button.dart';


class LoginPage extends StatelessWidget{
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController EmailTxt = TextEditingController();
    final TextEditingController PassTxt = TextEditingController();
    var _enteredMsg = '';

    //sign in user method
    void signUserIn(){

    }

    // double ScreenHeight = MediaQuery.of(context).size.height;
    // double ScreenWeidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor:  Colors.white,
      body:  SafeArea(
        child: Center(
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
              Row(
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Image.asset(
                        'lib/assets/LoginPage/google_logo.png',
                      height: 60,
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
                        'lib/assets/LoginPage/Apple_Logo.png',
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
                    ),
                  ),
                  Text(
                    'Register now',
                    style: GoogleFonts.roboto(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }


}