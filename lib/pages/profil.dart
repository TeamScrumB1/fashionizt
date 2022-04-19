import 'package:flutter/material.dart';
import 'package:fashionizt/theme.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilPage extends StatefulWidget {
  Profil createState() => Profil();
}

class Profil extends State<ProfilPage> {

  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconTheme(
          data: new IconThemeData(color: blackColor),
          child: new Icon(Icons.arrow_back_ios_rounded),
        ),
        title: Text('Profil Desainer',
            style: TextStyle(
              color: blackColor,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            )),
        backgroundColor: whiteColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget> [
            new Padding(padding: new EdgeInsets.all(20.0)),
            CircleAvatar(
              backgroundImage: AssetImage('lib/assets/images/igun.jpg'),
              radius: 100,
            ),
            Container(
              margin: const EdgeInsets.only(top: 35.0),
              child: Text(
                'Ivan Gunawan',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Desainer Gaun, Kemeja',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget> [
                      Text(
                          '4/5 ',
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Poppins',
                          )
                      ),
                      const Icon(Icons.star_border, color: Colors.black),
                    ], // <Widget>[]
                  ),
                  SizedBox(width: 25),
                  Row(
                    children: <Widget> [
                      Text(
                        '100k ',
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const Icon(Icons.mode_comment_outlined, color: Colors.black),
                    ], // <Widget>[]
                  ),
                ],
              ), // Row
            ),//Container Icon
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget> [
                      IconButton(
                          onPressed: () => _launchURL('https://wa.me/6289637685785'),
                          icon: Icon(Icons.whatsapp, color: Colors.black),
                          iconSize: 30.0,
                          tooltip: 'Contacs me on whatsapp'
                      )
                    ], // <Widget>[]
                  ),
                  SizedBox(width: 25),
                  Row(
                    children: <Widget> [
                      TextButton(
                        style: TextButton.styleFrom(
                            primary: Colors.black,
                            backgroundColor: fromCssColor('#EABF9F')),
                        onPressed: () => _launchURL('https://www.instagram.com/ivan_gunawan'),
                        child: Text('Portofolio'),
                      ),
                    ], // <Widget>[]
                  ),
                ],
              ), // Row
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0, left: 30.0),
              child: Row(
                children: <Widget>[
                  Row(
                    children: <Widget> [
                      Text(
                        'Pengalaman',
                        style: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ], // <Widget>[]
                  ),
                ],
              ), // Row
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0, left: 30.0),
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget> [
                      for (int i = 0; i < 20; i++)
                        Text(
                          'Designer Paris Fashion Week 2022',
                          style: const TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Poppins',
                          ),
                        ),
                    ],
                  ),
                ],
              ), // Row
            ),
          ],
        ),
      ),
    );
  }
}
