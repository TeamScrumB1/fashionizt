import 'package:fashionizt/pages/home_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fashionizt/animation/animations.dart';
import 'package:fashionizt/pages/signup_screen.dart';
import '../constants.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final feature = ["Login", "Sign Up"];
  int i = 0;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;

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
                                // height: size.height*0.08,
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
                              ), // Top Text
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Login",
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
                              //TextFiled
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
                                            style: TextStyle(color: blush),
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
                                              style: TextStyle(color: blush),
                                              showCursor: true,
                                              //cursorColor: mainColor,
                                              decoration:
                                                  kTextFiledInputDecoration.copyWith(
                                                          labelText: "Password")),
                                          Container(
                                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.symmetric(horizontal: 1),
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
                                                    textStyle: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontFamily: 'Poppins'),
                                                  ),
                                                  onPressed: () {Navigator.push(context,
                                                        MaterialPageRoute(builder: (context) {
                                                        return HomePages();
                                                        }));},
                                                  child: Text('Login'),
                                                ),
                                              )
                                            ], // <Widget>[]
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Expanded(
                                                child: Divider(
                                                  color: blush,
                                                  height: 1.5,
                                                ),
                                              ),
                                              Text(
                                                "OR  ",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: blush,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Expanded(
                                                    child: Divider(
                                                      color: blush,
                                                      height: 1.5,
                                                    ),
                                                  ),
                                            ], // <Widget>[]
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                  padding: EdgeInsets.symmetric(horizontal: 1,),
                                                width: width / 1.2,
                                                height: 37,
                                                child: TextButton(
                                                  style: TextButton.styleFrom(
                                                    side: (
                                                        BorderSide(
                                                            width: 1, color: blush)),
                                                    padding: const EdgeInsets.all(5.0),
                                                    primary: blush,
                                                    // backgroundColor: blush,
                                                    shadowColor: Colors.black,
                                                    textStyle: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                        FontWeight.w700,
                                                        fontFamily: 'Poppins'),
                                                  ),
                                                  onPressed: () {
                                                      Navigator.push(context,
                                                      MaterialPageRoute(builder: (context) {
                                                      return HomePages();
                                                      }));
                                                  },
                                                  child:
                                                      Text('Login as Designer'),
                                                ),
                                              )
                                            ], // <Widget>[]
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                  padding: EdgeInsets.symmetric(horizontal: 1,),
                                                width: width / 1.2,
                                                height: 37,
                                                child: TextButton(
                                                  style: TextButton.styleFrom(
                                                    side: (
                                                        BorderSide(
                                                            width: 1, color: blush)),
                                                    padding: const EdgeInsets.all(5.0),
                                                    primary: blush,
                                                    // backgroundColor: blush,
                                                    shadowColor: Colors.black,
                                                    textStyle: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                        FontWeight.w700,
                                                        fontFamily: 'Poppins'),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.push(context,
                                                        MaterialPageRoute(builder: (context) {
                                                          return HomePages();
                                                        }));
                                                  },
                                                  child: Text(
                                                      'Login as Mitra Produksi'),
                                                ),
                                              )
                                            ], // <Widget>[]
                                          ),
                                          Container(
                                            height: size.height*0.1,
                                            // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text("Don't have an Account ?",
                                              style: TextStyle(color: blush),
                                              ),
                                              GestureDetector(
                                                onTap: (){
                                                  Navigator.push(context,
                                                      MaterialPageRoute(builder: (context) {
                                                        return SignUpScreen();
                                                      }));
                                                },
                                                child: Text(
                                                  " Sign Up",
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
                )
                 // : SignUpScreen()), //ntar sign up
      ),
    );
  }
}
