import 'package:fashionizt/Widget/bottom_navbar.dart';
import 'package:fashionizt/Widget/button_role.dart';
import 'package:fashionizt/Widget/gridview_produk.dart';
import 'package:fashionizt/Widget/sub_tittle.dart';
import 'package:fashionizt/pages/Keranjang_produk.dart';
import 'package:fashionizt/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fashionizt/Widget/horizontal_mit_listview.dart';
import 'package:fashionizt/Widget/my_slideview.dart';
import 'package:fashionizt/Widget/horizontal_des_listview.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fashionizt/Pages/login_screen.dart';
import '../constants.dart';
import '../shared_preferences.dart';

class HomePages extends StatefulWidget {
  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  // const HomePages({Key? key}) : super(key: key);
  final PrefService _prefService = PrefService();

  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  @override
  void initState(){
    _prefService.readCache("username").then((value) {
      print('username : ' + value.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);
    return Scaffold(
      appBar: AppBar(
      //  centerTitle: true,
      //  leading: IconButton(
      //    onPressed: () {
      //      Navigator.pop(context, MaterialPageRoute(builder: (context){
      //        return LoginScreen();
      //      }));
      //    },
      //    icon: Icon(Icons.logout_rounded),
      //    color: blush,
      //  ),
        backgroundColor: blacksand,
        elevation: 0,
        title: Text(
          'Fashionizt',
          style: titleApps,
        ),
        automaticallyImplyLeading: false,
        // Container(
        //   width: 700,
        //   height: 40,
        //   decoration: BoxDecoration(
        //     color: Color(0xd6d6d6d6),
        //     borderRadius: BorderRadius.circular(15),
        //   ),
        //   child: TextField(
        //     onChanged: (value){
        //       //Search Cuy
        //     },
        //     decoration: InputDecoration(
        //       enabledBorder: InputBorder.none,
        //       focusedBorder: InputBorder.none,
        //       hintText: "Search Product",
        //       prefixIcon: Icon(Icons.search),
        //     ),
        //   ),
        // ),

        actions: <Widget>[
          IconButton(
            onPressed: () {
              // _launchURL('https://api.whatsapp.com/send?phone=6285808322783&text=Transaksi%20akan%20dialihkan%20ke%20admin%20Fashionizt');
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context){
                    return KeranjangProduk();
                  })
              );
            },
            icon: const Icon(Icons.shopping_cart, size: 25,),
            color: blush,
          ),
        ],
          // IconButton(
          //   onPressed: (){},
          //   icon: const Icon(Icons.notifications_active,size: 25,),
          //   color: blush,
          // ),

      ),
      body: Container(
        child: ListView(
          children: [
            SlideView(),
            Role(),
            SubTittle(sub: "Top Desainer"),
            HorDesListView(),
            Container(
              margin: EdgeInsets.only(top: 20),
              //child: SubTittle(sub: "Kategori")
            ),
            SubTittle(sub: "Top Mitra Produksi"),
            HorMitListView(),
            Container(
              margin: EdgeInsets.only(top: 20),
              //child: SubTittle(sub: "Kategori")
            ),
            SubTittle(sub: "Rekomendasi Produk",),
            GridViewProduk(),
          ],
        ),
      ),
    );
  }
}