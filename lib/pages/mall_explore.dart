import 'package:fashionizt/Api/api_short_konveksi.dart';
import 'package:fashionizt/Models/konveksi_model.dart';
import 'package:fashionizt/Pages/detail_desainer.dart';
import 'package:fashionizt/Pages/pilih_mitra.dart';
import 'package:fashionizt/Widget/vertical_listview.dart';
import 'package:fashionizt/pages/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:fashionizt/Widget/sub_tittle.dart';
import 'package:fashionizt/Widget/category_product.dart';

import '../theme.dart';

class MallExplore extends StatefulWidget {
  const MallExplore({Key? key}) : super(key: key);

  @override
  State<MallExplore> createState() => _MallExploreState();
}

class _MallExploreState extends State<MallExplore> {
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
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          color: Colors.black,
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen()));
            },
            icon: const Icon(
              Icons.shopping_cart,
              size: 25,
            ),
            color: Colors.black,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_active,
              size: 25,
            ),
            color: Colors.black,
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Image.asset(
            "lib/Assets/images/cover1.jpg",
            width: 600.0,
            height: 180,
            fit: BoxFit.cover,
          ),
          SubTittle(sub: "Kategori"),
          CategoryProduct(),

        ],
      )),
    );
  }
}
