import 'package:fashionizt/Widget/bottom_navbar.dart';
import 'package:fashionizt/Widget/button_role.dart';
import 'package:fashionizt/Widget/gridview_produk.dart';
import 'package:fashionizt/Widget/horizontal_prodes_listview.dart';
import 'package:fashionizt/Widget/horizontal_promit_listview.dart';
import 'package:fashionizt/Widget/sub_tittle.dart';
import 'package:fashionizt/pages/cart_screen.dart';
import 'package:fashionizt/pages/my_profile.dart';
import 'package:fashionizt/pages/pre_order.dart';
import 'package:fashionizt/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fashionizt/Widget/horizontal_mit_listview.dart';
import 'package:fashionizt/Widget/my_slideview.dart';
import 'package:fashionizt/Widget/horizontal_des_listview.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fashionizt/constants.dart';
import 'package:fashionizt/Pages/login_screen.dart';

import '../constants.dart';
class DetailProjectUser extends StatelessWidget {
  const DetailProjectUser({Key? key}) : super(key: key);

  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blacksand,
        elevation: 0,
        title: Text(
          'Detail Project',
          style: titleApps,
        ),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          // IconButton(
          //   onPressed: () {
          //     _launchURL('https://api.whatsapp.com/send?phone=6285808322783&text=Transaksi%20akan%20dialihkan%20ke%20admin%20Fashionizt');
          //   },
          //   icon: const Icon(Icons.shopping_cart, size: 25,),
          //   color: blush,
          // ),
        ],
      ),
      body: Container(
        height: size.height*1,
        width: size.width*1,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: size.width*0.03, vertical:size.height*0.03,),
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    //child: SubTittle(sub: "Kategori")
                  ),
                  Text(
                    'Judul :',
                    //konveksi.nama,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      color: blacksand,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    //child: SubTittle(sub: "Kategori")
                  ),
                  Text(
                    'Kaos Event',
                    //konveksi.nama,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'Poppins',
                      color: blacksand,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    //child: SubTittle(sub: "Kategori")
                  ),
                  Text(
                    'Kebutuhan Spesifik : ',
                    //konveksi.nama,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      color: blacksand,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    //child: SubTittle(sub: "Kategori")
                  ),
                  Text(
                    'Saya ingin kaos saya bisa dibuat acara formal dan juga informal',
                    //konveksi.nama,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'Poppins',
                      color: blacksand,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    //child: SubTittle(sub: "Kategori")
                  ),
                  Text(
                    'Pelamar : ',
                    //konveksi.nama,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      color: blacksand,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'Desainer ',
              //konveksi.nama,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
                color: blacksand,
              ),
            ),
            HorProDesListView(),
            Container(
              margin: EdgeInsets.only(top: 20),
              //child: SubTittle(sub: "Kategori")
            ),
            Text(
              'Mitra Produksi ',
              //konveksi.nama,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
                color: blacksand,
              ),
            ),
            HorProMitListView(),
            Container(
              margin: EdgeInsets.only(top: 20),
              //child: SubTittle(sub: "Kategori")
            ),
          ],
        ),
      ),
    );
  }
}