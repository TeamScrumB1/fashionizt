import 'package:fashionizt/pages/home_pages.dart';
import 'package:fashionizt/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState(){
   super.initState();
   Timer(Duration(seconds: 3),() {
     Navigator.pushReplacement(
         context, MaterialPageRoute(builder: (context) => LoginScreen()));
   });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFFAF3E0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/Assets/images/fashionizt.jpeg',
              width: 450,
              height: 600,
            ),
          ],
        ),
      ),
    );
  }
}