import 'package:fashionizt/pages/login_screen.dart';
import 'package:fashionizt/pages/splash_screen.dart';
import 'package:fashionizt/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fashionizt/constants.dart';



void main() {
 // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
 //   statusBarColor: blacksand,
 //   statusBarIconBrightness: Brightness.dark,
 // ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fashionizt',
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      initialRoute: SplashRoute,
      routes: routes,
      home: LoginScreen(),
    );
  }
}