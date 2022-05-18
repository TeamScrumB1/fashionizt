import 'package:fashionizt/Api/api_short_konveksi.dart';
import 'package:fashionizt/Models/konveksi_model.dart';
import 'package:fashionizt/Pages/detail_desainer.dart';
import 'package:fashionizt/Pages/pilih_mitra.dart';
import 'package:fashionizt/Widget/vertical_listview.dart';
import 'package:fashionizt/constants.dart';
import 'package:fashionizt/pages/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:fashionizt/Widget/category_product.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme.dart';

class MitraExplore extends StatefulWidget {
  const MitraExplore({Key? key}) : super(key: key);

  @override
  State<MitraExplore> createState() => _MitraExploreState();
}

class _MitraExploreState extends State<MitraExplore> {
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
          onPressed: (){
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
              _launchURL('https://api.whatsapp.com/send?phone=6285808322783&text=Transaksi%20akan%20dialihkan%20ke%20admin%20Fashionizt');
            },
            icon: const Icon(Icons.shopping_cart, size: 25,),
            color: blush,
          ),
//           IconButton(
//             onPressed: (){},
//             icon: const Icon(Icons.notifications_active,size: 25,),
//             color: blush,
//           ),
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
              Container(
                margin: EdgeInsets.only(top: 20),
                //child: SubTittle(sub: "Kategori")
              ),
              Text(
                "Explore Mitra Produksi",
                style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontWeight: FontWeight.w800,
                  color: blacksand,
                  fontSize: 25,
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  //child: SubTittle(sub: "Kategori")
              ),
              CategoryProduct(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Recommended',
                            style: TextStyle(
                              color: blacksand,
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                            )),
                        Spacer(),
                        TextButton(
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
                                  color: blacksand,
                                  fontWeight: FontWeight.w200,
                                  fontSize: 13,
                                )),
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
