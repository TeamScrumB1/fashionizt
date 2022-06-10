import 'package:fashionizt/Data/ProviderCart.dart';
import 'package:fashionizt/Data/db_helper.dart';
import 'package:fashionizt/constants.dart';
import 'package:fashionizt/Models/Cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Widget/gridview_katproduk.dart';
import '../theme.dart';
import 'package:badges/badges.dart';
import 'package:fashionizt/pages/Keranjang_produk.dart';

class KategoriPage extends StatefulWidget {
  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
  KategoriPage({
    required this.nama_kategori,
  });

  String nama_kategori;

  @override
  State<KategoriPage> createState() => _KategoriPageState(nama_kategori: nama_kategori);
}

class _KategoriPageState extends State<KategoriPage> {
  List<CartShop> listKeranjang = [];
  DbHelper db = DbHelper();

  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  _KategoriPageState({
    required this.nama_kategori,
  });

  String nama_kategori;

  @override
  void initState() {
    _getAllKeranjang();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var keranjang = Provider.of<KeranjangProv>(context, listen: true);
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
          'Kategori $nama_kategori',
          style: titleApps,
        ),
            actions: [
              Center(
                child: listKeranjang.length > 0 ? Badge(
                  badgeColor: Colors.orange,
                  animationType: BadgeAnimationType.slide,
                  borderSide: BorderSide(color: blush),
                  badgeContent: Text(
                    keranjang.jumlah.toString(),
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
      ),
      body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10),
                //child: SubTittle(sub: "Kategori")
              ),
             // Text(
             //   "Kategori $nama_kategori",
             //   style: Theme.of(context).textTheme.headline4!.copyWith(
             //     fontWeight: FontWeight.w800,
             //     color: blacksand,
             //     fontSize: 25,
             //   ),
             // ),
              Padding(
                padding: const EdgeInsets.only(left: 25,right: 25, top: 10),
              ),
              GridViewKatProduk(nama_kategori: nama_kategori),
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
