import 'package:fashionizt/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import '../Widget/bottom_navbar.dart';
import '../constants.dart';
import '../routes.dart';
import '../shared_preferences.dart';
import 'home_pages.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PrefService _prefService = PrefService();

  @override
  void initState(){
    _prefService.readCache("username").then((value) {
      print('username : ' + value.toString());
      if (value != null) {
        return Timer(Duration(seconds: 2),
                () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MyBottomNavBar(currentTab: 0,currentScreen: HomePages()),),));
      } else {
        return Timer(Duration(seconds: 2),
                () => Navigator.of(context).pushNamed(LoginRoute));
      }
    });
   super.initState();
   // Timer(Duration(seconds: 3),() {
   //   Navigator.pushReplacement(
   //       context, MaterialPageRoute(builder: (context) => LoginScreen()));
   // });
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