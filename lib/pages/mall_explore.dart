import 'package:fashionizt/Api/api_short_konveksi.dart';
import 'package:fashionizt/Models/konveksi_model.dart';
import 'package:fashionizt/Widget/gridview_produk.dart';
import 'package:fashionizt/Widget/my_slideview.dart';
import 'package:fashionizt/constants.dart';
import 'package:fashionizt/pages/Keranjang_produk.dart';
import 'package:flutter/material.dart';
import 'package:fashionizt/Widget/category_product.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme.dart';

class MallExplore extends StatefulWidget {
  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  const MallExplore({Key? key}) : super(key: key);

  @override
  State<MallExplore> createState() => _MallExploreState();
}

class _MallExploreState extends State<MallExplore> {

  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }


  @override
  late Future<Konveksi> _konveksi;

  @override
  void initState() {
    super.initState();
    _konveksi = ApiServiceMit().topHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context){
                    return KeranjangProduk();
                  })
              );
              // _launchURL('https://api.whatsapp.com/send?phone=6285808322783&text=Transaksi%20akan%20dialihkan%20ke%20admin%20Fashionizt');
            },
            icon: const Icon(
              Icons.shopping_cart,
              size: 25,
            ),
            color: blush,
          ),
        ],
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
    );
  }
}
