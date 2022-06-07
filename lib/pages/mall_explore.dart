import 'package:fashionizt/Api/api_short_konveksi.dart';
import 'package:fashionizt/Data/db_helper.dart';
import 'package:fashionizt/Models/Cart.dart';
import 'package:fashionizt/Models/konveksi_model.dart';
import 'package:fashionizt/Widget/gridview_produk.dart';
import 'package:fashionizt/Widget/my_slideview.dart';
import 'package:fashionizt/constants.dart';
import 'package:fashionizt/pages/Keranjang_produk.dart';
import 'package:flutter/material.dart';
import 'package:fashionizt/Widget/category_product.dart';
import '../theme.dart';
import 'package:badges/badges.dart';

class MallExplore extends StatefulWidget {

  const MallExplore({Key? key}) : super(key: key);

  @override
  State<MallExplore> createState() => _MallExploreState();
}

class _MallExploreState extends State<MallExplore> {
  List<CartShop> listKeranjang = [];
  DbHelper db = DbHelper();
  @override
  late Future<Konveksi> _konveksi;

  @override
  void initState() {
    _getAllKeranjang();
    super.initState();
    _konveksi = ApiServiceMit().topHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _getAllKeranjang,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: blacksand,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            color: blush,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Fashionizt',
            style: titleApps,
          ),
            actions: [
              Center(
                child: Badge(
                  badgeColor: Colors.orange,
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
                ),
              )
            ]
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            SlideView(),
            Container(
              margin: EdgeInsets.only(top: 10),
              //child: SubTittle(sub: "Kategori")
            ),
            Text(
              "Explore Mall",
              style: Theme.of(context).textTheme.headline4!.copyWith(
                fontWeight: FontWeight.w800,
                color: blacksand,
                fontSize: 25,
              ),
            ),
            CategoryProduct(),
            Padding(
              padding: const EdgeInsets.only(left: 25,right: 25, top: 10),
              child: Row(
                children: [
                  Text('Recommended',
                      style: TextStyle(
                        color: blacksand,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      )),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => PilihDesainer(),
                      //   ),
                      // );
                    },
                    child: Text('View All',
                        style: TextStyle(
                          color: blacksand,
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                        )),
                  ),
                ],
              ),
            ),
            GridViewProduk(),
          ],
        )),
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
