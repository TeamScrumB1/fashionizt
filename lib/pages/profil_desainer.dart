import 'package:flutter/material.dart';
import 'package:fashionizt/theme.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/desainer_model.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({Key? key, required this.desainer}) : super(key: key);
  final DesainerElement desainer;

  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
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
              backgroundImage:  NetworkImage(
                  desainer.imgProfil),
              radius: 100,
            ),
            Container(
              margin: const EdgeInsets.only(top: 35.0),
              child: Text(
                desainer.nama,
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
                desainer.bio,
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
                          desainer.rating + '/5 ',
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
                        desainer.jmlhProject + ' ',
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const Icon(Icons.task_outlined, color: Colors.black),
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
                      Ink(
                        decoration: const ShapeDecoration(
                        color: Colors.white10,
                        shape: CircleBorder(),
                      ),
                        child: IconButton(
                            onPressed: () => _launchURL(desainer.linkWa),
                            icon: Icon(Icons.whatsapp, color: Colors.black),
                            iconSize: 35.0,
                            tooltip: 'Contacs me on whatsapp'
                        )
                      )
                    ], // <Widget>[]
                  ),
                  SizedBox(width: 25),
                  Row(
                    children: <Widget> [
                      TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          primary: Colors.black,
                          backgroundColor: fromCssColor('#FAF3E0'),
                          elevation: 5,
                          shadowColor: Colors.black,
                        ),
                        onPressed: () => _launchURL(desainer.linkPorto),
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
                      for (int i = 0; i < 8; i++)
                        Text(
                          'Designer Paris Fashion Week 2022', //ini belum bener ya
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
