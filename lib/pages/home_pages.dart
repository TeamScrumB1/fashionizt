import 'package:fashionizt/Widget/button_role.dart';
import 'package:fashionizt/Widget/gridview_produk.dart';
import 'package:fashionizt/Widget/sub_tittle.dart';
import 'package:fashionizt/constants.dart';
import 'package:fashionizt/pages/cart_screen.dart';
import 'package:fashionizt/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fashionizt/Widget/horizontal_mit_listview.dart';
import 'package:fashionizt/Widget/my_slideview.dart';
import 'package:fashionizt/Widget/horizontal_des_listview.dart';

class HomePages extends StatelessWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blacksand,
        elevation: 0,
        title: Text(
          'Fashionizt',
          style: titleApps,
        ),
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
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CartScreen())
              );
            },
            icon: const Icon(Icons.shopping_cart, size: 25,),
            color: blush,
          ),
          // IconButton(
          //   onPressed: (){},
          //   icon: const Icon(Icons.notifications_active,size: 25,),
          //   color: blush,
          // ),
        ],
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            SlideView(),
            ButtonRole(),
            SubTittle(sub: "Top Desainer"),
            HorDesListView(),
            Container(
              margin: EdgeInsets.only(top: 10),
              //child: SubTittle(sub: "Kategori")
            ),
            SubTittle(sub: "Top Mitra Produksi"),
            HorMitListView(),
            Container(
              margin: EdgeInsets.only(top: 10),
              //child: SubTittle(sub: "Kategori")
            ),
            SubTittle(sub: "Produk Rekomendasi",),
            GridViewProduk(),
          ],
        ),
      ),
    );
  }
}