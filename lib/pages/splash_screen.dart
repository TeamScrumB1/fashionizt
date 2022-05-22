import 'package:fashionizt/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import '../constants.dart';

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
        color: blush,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/Assets/images/fashionizt.png',
              width: 450,
              height: 600,
            ),
          ],
        ),
      ),
    );
  }
}