import 'package:fashionizt/Data/ProviderCart.dart';
import 'package:fashionizt/Data/db_helper.dart';
import 'package:fashionizt/Data/db_helper_user.dart';
import 'package:fashionizt/Models/Cart.dart';
import 'package:fashionizt/Models/User.dart';
import 'package:fashionizt/Widget/button_role.dart';
import 'package:fashionizt/Widget/gridview_produk.dart';
import 'package:fashionizt/Widget/sub_tittle.dart';
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
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../variabels.dart';

class HomePages extends StatefulWidget {
  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  final PrefService _prefService = PrefService();
  List<CartShop> listKeranjang = [];
  List<UserList> listUser = [];
  DbHelper db = DbHelper();
  DbHelperUser dbu = DbHelperUser();
  // UserElement? akun;
  var dataUser;

  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  @override
  void initState(){
    _getAllKeranjang();
    _getUser();
    _prefService.readCache("username").then((value) {
      var namaUser = value.toString().split(' ');
      Akun(namaUser[namaUser.length-1]);
      print('username : ' + value.toString());
    });
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
              child: keranjang.jumlah > 0 ? Badge(
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
  Future<void> insertUser (String DataPack) async {
    var User = DataPack.split(' ');
    if(listUser.length == 0){
      String tingkat = "";
      if(User[3] == "customer"){
        tingkat = "Customer";
      }else if(User[3] == "designer"){
        tingkat = "Desainer";
      }else{
        tingkat = "Mitra Produksi";
      }
      await dbu.saveUser(UserList(
        IDUser: int.parse(User[0]),
        Username: User[1],
        Email: User[2],
        Level: tingkat,
      ));
    }else{
      await dbu.updateUser(UserList.fromMap({
        'Id' : 0,
        'IDUser' : int.parse(User[0]),
        'Username' : User[1],
        'Email' : User[2],
        'Level' : User[3],
      }));
    }
    setState(() {
      IDUserGlob = User[0];
      _getUser();
    });
  }
  Future<void> _getUser() async{
    var list = await dbu.getUser();
    listUser.clear();
    setState(() {
      list!.forEach((user) {
        listUser.add(UserList.fromMap(user));
      });
    });
  }
  // Future<void> updateUser( myUser,int index) async{
  //   await dbu.updateUser(UserList.fromMap({
  //     'Id' : index,
  //     'Nama' : myUser.IDUser,
  //     'Username' : myUser.Username,
  //     'Email' : myUser.Email,
  //     'Level' : myUser.Level,
  //   }));
  // }
  Future<void> Akun(String Username) async{
    final response = await http.post(
        Uri.parse(
            'https://fashionizt.yufagency.com/user.php'),
            body: {"username" : Username}
    );
    setState(() {
      dataUser = json.decode(response.body);
      insertUser(dataUser.toString());
    });
  }
}