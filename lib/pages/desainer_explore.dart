import 'package:fashionizt/Pages/detail_desainer.dart';
import 'package:fashionizt/Pages/pilih_desainer.dart';
import 'package:fashionizt/Widget/desainer_slideview.dart';
import 'package:fashionizt/Widget/vertical_listview.dart';
import 'package:fashionizt/Widget/category_product.dart';
import 'package:fashionizt/constants.dart';
import 'package:fashionizt/pages/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:fashionizt/Models/desainer_model.dart';
import 'package:fashionizt/Api/api_short_desainer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme.dart';

class DesainerExplore extends StatefulWidget {
  const DesainerExplore({Key? key}) : super(key: key);

  @override
  State<DesainerExplore> createState() => _DesainerExploreState();
}

class _DesainerExploreState extends State<DesainerExplore> {
  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
  @override
  late Future<Desainer> _desainer;

  @override
  void initState() {
    super.initState();
    _desainer = ApiServiceDes().topHeadlines();
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
              DesainerSlideView(),
              Container(
                margin: EdgeInsets.only(top: 20),
              ),
              Text(
                "Explore Desainer",
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
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            )),
                        Spacer(),
                        TextButton(
                            style: TextButton.styleFrom(),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PilihDesainer())
                              );
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
                    Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          FutureBuilder(
                            future: _desainer,
                            builder: (context, AsyncSnapshot<Desainer> snapshot) {
                              var state = snapshot.connectionState;
                              if (state != ConnectionState.done) {
                                return Center(child: CircularProgressIndicator());
                              } else {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: snapshot.data?.desainer.length,
                                    itemBuilder: (context, index) {
                                      var desainer = snapshot.data?.desainer[index];
                                      return InkWell(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(builder: (context) {
                                                  return DetailDesainer(desainer: desainer!);
                                                }));
                                          },
                                          child: VerListDes(desainer: desainer!)
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
