import 'package:fashionizt/Data/db_helper.dart';
import 'package:fashionizt/Models/Cart.dart';
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
import '../constants.dart';
import '../shared_preferences.dart';
import 'package:badges/badges.dart';

class HomePages extends StatefulWidget {
  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  // const HomePages({Key? key}) : super(key: key);
  final PrefService _prefService = PrefService();
  List<CartShop> listKeranjang = [];
  DbHelper db = DbHelper();
  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  @override
  void initState(){
    _getAllKeranjang();
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
    return RefreshIndicator(
      onRefresh: _getAllKeranjang,
      child: Scaffold(
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
          actions: [
             Center(
              child: listKeranjang.length > 0 ? Badge(
                badgeColor: Colors.orange,
                animationType: BadgeAnimationType.slide,
                borderSide: BorderSide(color: blush),
                  badgeContent: Text(
                    listKeranjang.length.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                position: BadgePosition.topEnd(top: 0, end: 5),
                child: IconButton(icon: Icon(Icons.shopping_cart, size: 25, color: blush),
                    onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context){
                        return KeranjangProduk();
                      })
                  );
                }),
              ) : IconButton(
                  icon: Icon(Icons.shopping_cart, size: 25, color: blush),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context){
                          return KeranjangProduk();
                        })
                    );
                  }
                  ),
            )
          ]


         //actions: <Widget>[
         //      IconButton(
         //        onPressed: () {
         //          Navigator.push(
         //              context,
         //              MaterialPageRoute(builder: (context){
         //                return KeranjangProduk();
         //              })
         //          );
         //        },
         //        icon: Icon(Icons.shopping_cart, size: 25,),
         //        color: blush,
         //      ),
         //      listKeranjang.length == 0 ? Container() : Positioned(
         //        right: 7,
         //        top: 3,
         //        child: Stack(
         //          children: <Widget>[
         //            Icon(
         //              Icons.brightness_1,
         //              size: 20,
         //              color: Colors.amber,
         //            ),
         //            Positioned(
         //              top: 3.0,
         //              right: 7.0,
         //              child: Text(
         //                listKeranjang.length.toString(),
         //                style: TextStyle(
         //                  color: Colors.white,
         //                  fontSize: 10,
         //                ),
         //              ),
         //            )
         //          ],
         //        ),
         //  ),
         //],
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
      ),
    );
  }
  Future<void> _getAllKeranjang() async {
    var list = await db.getAllKeranjang();
    setState(() {
      listKeranjang.clear();
      list!.forEach((keranjang) {
        listKeranjang.add(CartShop.fromMap(keranjang));
      });
    });
  }
}