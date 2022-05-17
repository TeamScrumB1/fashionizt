import 'package:fashionizt/Api/api_short_konveksi.dart';
import 'package:fashionizt/Models/konveksi_model.dart';
import 'package:fashionizt/Widget/gridview_produk.dart';
import 'package:fashionizt/Widget/my_slideview.dart';
import 'package:fashionizt/constants.dart';
import 'package:fashionizt/pages/cart_screen.dart';
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
          color: nude,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Fashionizt Mall',
          style: titleApps,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _launchURL('https://api.whatsapp.com/send?phone=6285808322783&text=Transaksi%20akan%20dialihkan%20ke%20admin%20Fashionizt');
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
              margin: EdgeInsets.symmetric(vertical: 10),
              child: CategoryProduct()
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25,right: 25, top: 10),
            child: Row(
              children: [
                Text(
                  'Recommended',
                  style: nameHorizontalCardTextStyle,
                ),
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
                    style: ratingHorizontalCardTextStyle,
                  ),
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
