import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashionizt/Models/desainer_model.dart';
import 'package:fashionizt/Models/konveksi_model.dart';
import 'package:fashionizt/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:fashionizt/animation/animations.dart';
import 'package:fashionizt/pages/signup_screen.dart';
import '../constants.dart';


class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final feature = ["Login", "SignUp"];

  int i = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
            backgroundColor: blacksand,
            body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
                            ),
                            // Top Text
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              // width: width,
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Sign Up",
                                      style: TextStyle(
                                        color: blush,
                                        fontSize: 48,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            ),
                            // TextFiled
                            Column(
                              children: [
                            Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        TextField(
                                          // readOnly: true, // * Just for Debug
                                          cursorColor: blush,
                                          style:
                                          TextStyle(color: blush),
                                          showCursor: true,
                                          //cursorColor: mainColor,
                                          decoration:
                                          kTextFiledInputDecoration, //ada di constant.dart
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                        ),
                                        TextField(
                                          // readOnly: true, // * Just for Debug
                                            cursorColor: blush,
                                            style: TextStyle(
                                                color: blush),
                                            showCursor: true,
                                            //cursorColor: mainColor,
                                            decoration:
                                            kTextFiledInputDecoration
                                                .copyWith(
                                                labelText:
                                                "Email")),
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                        ),
                                        TextField(
                                          // readOnly: true, // * Just for Debug
                                            cursorColor: blush,
                                            style: TextStyle(
                                                color: blush),
                                            showCursor: true,
                                            //cursorColor: mainColor,
                                            decoration:
                                            kTextFiledInputDecoration
                                                .copyWith(
                                                labelText:
                                                "Password")),
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                        ),
                                        TextField(
                                          // readOnly: true, // * Just for Debug
                                            cursorColor: blush,
                                            style: TextStyle(
                                                color: blush),
                                            showCursor: true,
                                            //cursorColor: mainColor,
                                            decoration:
                                            kTextFiledInputDecoration
                                                .copyWith(
                                                labelText:
                                                "Confirm Password")),
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                                        ),
                                        Row(
                                          children: <Widget> [
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 0),
                                              width: width / 1.2,
                                              height: 37,
                                              child: TextButton(
                                                style: TextButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(5.0),
                                                  ),
                                                  padding: const EdgeInsets.all(5.0),
                                                  primary: blacksand,
                                                  backgroundColor: blush,
                                                  shadowColor: Colors.black,
                                                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, fontFamily: 'Poppins'),
                                                ),
                                                onPressed: () { //Masih mengarah ke login
                                                  Navigator.push(context,
                                                    MaterialPageRoute(builder: (context) {
                                                      return LoginScreen();
                                                    }));},
                                                child: Text('Sign Up'),
                                              ),
                                            )
                                          ], // <Widget>[]
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text("Already have an Account ?",
                                              style: TextStyle(color: blush),
                                            ),
                                            GestureDetector(
                                              onTap: (){
                                                Navigator.push(context,
                                                  MaterialPageRoute(builder: (context) {
                                                    return LoginScreen();
                                                  }));
                                                },
                                              child: Text(
                                                " Login ",
                                                style: TextStyle(
                                                    color: blush,
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ),
                                            )
                                          ], // <Widget>[]
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
            )
      ),
      )
    );
  }
}
