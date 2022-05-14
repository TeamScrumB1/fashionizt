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

class MitraExplore extends StatefulWidget {
  const MitraExplore({Key? key}) : super(key: key);

  @override
  State<MitraExplore> createState() => _MitraExploreState();
}

class _MitraExploreState extends State<MitraExplore> {
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
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Container(
          width: 700,
          height: 40,
          decoration: BoxDecoration(
            color: Color(0xd6d6d6d6),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            onChanged: (value){
              //Search Cuy
            },
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: "Search Mitra",
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),

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
            color: Colors.black,
          ),
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.notifications_active,size: 25,),
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
              Padding(
                padding: EdgeInsets.only(top: 20.0, left: 31),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Explore Mitra Produksi",
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        child: SubTittle(sub: "Kategori")
                    ),
                    CategoryProduct(),
                    Row(
                      children: [
                        Text('Recommended',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                            )),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 24),
                          child: TextButton(
                            style: TextButton.styleFrom(),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PilihKonveksi())
                              );
                            },
                            child: Text('View All',
                                style: TextStyle(
                                  color: blackColor,
                                  fontWeight: FontWeight.w200,
                                  fontSize: 13,
                                )),
                          ),
                        ),
                      ],
                    ),
                    Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          FutureBuilder(
                            future: _konveksi,
                            builder: (context, AsyncSnapshot<Konveksi> snapshot) {
                              var state = snapshot.connectionState;
                              if (state != ConnectionState.done) {
                                return Center(child: CircularProgressIndicator());
                              } else {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: snapshot.data?.konveksi.length,
                                    itemBuilder: (context, index) {
                                      var konveksi = snapshot.data?.konveksi[index];
                                      return InkWell(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(builder: (context) {
                                                  return ProfileKonveksi(konveksi: konveksi!);
                                                }));
                                          },
                                          child: VerListMit(konveksi: konveksi!)
                                      );
                                    },
                                  );
                                } else if (snapshot.hasError) {
                                  return Center(child: Text(snapshot.error.toString()));
                                } else {
                                  return Text('');
                                }
                              }
                            },
                          )
                        ]),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
