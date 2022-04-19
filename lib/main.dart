import 'package:fashionizt/pages/pilih.dart';
import 'package:fashionizt/pages/profil.dart';
import 'package:flutter/material.dart';

import 'pages/cari.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: ProfilPage(),
    );
  }
}