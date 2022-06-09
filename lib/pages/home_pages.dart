import 'package:fashionizt/Data/ProviderCart.dart';
import 'package:fashionizt/Data/db_helper.dart';
import 'package:fashionizt/Models/Cart.dart';
import 'package:fashionizt/Models/produk_model.dart';
import 'package:fashionizt/Widget/button_role.dart';
import 'package:fashionizt/Widget/gridview_produk.dart';
import 'package:fashionizt/Widget/sub_tittle.dart';
import 'package:fashionizt/api/api_produk.dart';
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
import 'package:provider/provider.dart';

class HomePages extends StatefulWidget {
  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  final PrefService _prefService = PrefService();
  // late Future<Produk> _produk;
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

    // _produk = ApiServiceProd().topHeadlines();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);

    var keranjang = Provider.of<KeranjangProv>(context, listen: true);
    keranjang.jumlahplus();
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
                  // listKeranjang.length.toString(),
                  keranjang.jumlah.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
                position: BadgePosition.topEnd(top: 0, end: 5),
                child: IconButton(icon: Icon(Icons.shopping_cart, size: 25, color: blush),
                    onPressed: ()
                    // async
                    {
                      // final value = await
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context){
                          return KeranjangProduk();
                      })
                    );
                      // setState(() {
                      //   _getAllKeranjang();
                      // });
                }),
              ) : IconButton(
                  icon: Icon(Icons.shopping_cart, size: 25, color: blush),
                  onPressed: ()
                  // async
                  {
                    // final value = await
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context){
                          return KeranjangProduk();
                        })
                    );
                    // setState(() {
                    //   _getAllKeranjang();
                    // });
                  }
                  ),
            )
          ]
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
              // GridViewProduk(),
              // Container(
              //   margin: EdgeInsets.only(right: 8, left: 8),
              //   // height: 250,
              //   child: FutureBuilder(
              //     future: _produk,
              //     builder: (context, AsyncSnapshot<Produk> snapshot){
              //       var state = snapshot.connectionState;
              //       if(state!=ConnectionState.done){
              //         return Center(child: CircularProgressIndicator());
              //       }else{
              //         if(snapshot.hasData){
              //           return GridView.builder(
              //             shrinkWrap: true,
              //             physics: NeverScrollableScrollPhysics(),
              //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //               crossAxisCount: 2,
              //               childAspectRatio: 1/1.53,
              //             ),
              //             itemBuilder: (context, index) {
              //               var produk = snapshot.data?.produk[index];
              //               return InkWell(
              //                   onTap: () async{
              //                     final value = await Navigator.push(
              //                         context,
              //                         MaterialPageRoute(builder: (context){
              //                           return DetailProduct(detail: produk!);
              //                         })
              //                     );
              //                     setState(() {
              //                       _getAllKeranjang();
              //                     });
              //                   },
              //                   child: ProductCard(produk: produk!)
              //               );
              //             },
              //             itemCount: snapshot.data?.produk.length,
              //           );
              //         }else if(snapshot.hasError){
              //           return Center(child: Text(snapshot.error.toString()));
              //         }else{
              //           return Text('');
              //         }
              //       }
              //     },
              //   ),
              // ),
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