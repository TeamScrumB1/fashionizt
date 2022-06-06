// import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashionizt/Data/db_helper.dart';
import 'package:fashionizt/Models/Cart.dart';
import 'package:fashionizt/constants.dart';
import 'package:fashionizt/theme.dart';
// import 'package:line_icons/line_icon.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KeranjangProduk extends StatefulWidget {
  const KeranjangProduk({Key? key}) : super(key: key);

  @override
  State<KeranjangProduk> createState() => _KeranjangProdukState();
}

class _KeranjangProdukState extends State<KeranjangProduk> {
  List<CartShop> listKeranjang = [];
  DbHelper db = DbHelper();
  int total = 0;

  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  @override
  void initState(){
    _getAllKeranjang();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0,3),
                  blurRadius: 3,
                  spreadRadius: 3,
                ),
              ]
          ),
          height: size.height*0.06,
          child: Row(
            children: [
              Container(
                width: size.width*0.6,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                child: Row(
                  children: <Widget>[
                    Text(
                        'Total : ',
                        style:
                        TextStyle(color: blacksand, fontSize: 15.0)
                    ),
                    Text(hitungTotal().toString(),
                        style:
                        TextStyle(color: blacksand, fontSize: 18.0, fontWeight: FontWeight.bold)),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
              Container(
                width: size.width*0.4,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: blacksand,
                ),
                child:  TextButton(
                  onPressed: () {
                    _launchURL('https://api.whatsapp.com/send?phone=6285808322783&text=Transaksi%20akan%20dialihkan%20ke%20admin%20Fashionizt');
                  },
                  child: const Text('Check Out',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                ),
              ),
            ],
          ),
        ),
      ),
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
          'Keranjang',
          style: titleApps,
        ),
      ),
      body: ListView.builder(
          itemCount: listKeranjang.length,
          itemBuilder: (context,index){
            CartShop keranjang = listKeranjang[index];
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F6F9),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.network('${keranjang.Gambar}'),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${keranjang.NamaProduk}',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        maxLines: 2,
                      ),
                      //Text(
                      // cart.product.owner,
                      // style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                      //  maxLines: 2,
                      // ),
                      SizedBox(height: 10),
                      Text.rich(
                        TextSpan(
                          text: "\Rp ${keranjang.Harga}",
                          style: TextStyle(fontWeight: FontWeight.w600, color: brownColor),
                        ),
                      ),
                      Container(
                        height: size.height*0.03,
                        width: size.width*0.25,
                        margin:
                        EdgeInsets.only(top: 10.0),
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(4),
                            border: Border.all(
                                color: blacksand)),
                        child : Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                kurangProduk(keranjang, index);
                                setState(() {
                                  _getAllKeranjang();
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                color: blacksand,
                                size: 22,
                              ),
                            ),
                            Text(
                              "${keranjang.Jumlah}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0),
                            ),
                            InkWell(
                              onTap: () {
                                tambahProduk(keranjang);
                                setState(() {
                                  _getAllKeranjang();
                                });
                              },
                              child: Icon(
                                Icons.add,
                                color: blacksand,
                                size: 22,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: (){
                        _deleteKeranjang(keranjang, index);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: blacksand,
                      ),
                  ),
                  Checkbox(
                    activeColor: blacksand,
                    value: keranjang.Status == 0 ? false : true,
                    onChanged: (bool? value){
                      setState(() {
                        statusKeranjang(keranjang);
                        _getAllKeranjang();
                      });
                    }
                  ),
                ],
              ),
            );
          }
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
  String hitungTotal(){
    double total = 0;
    String output = "0";

    for(int i=0; i < listKeranjang.length; i++){
      if(listKeranjang[i].Status == 1){
        total = total +  (double.parse(listKeranjang[i].Harga) * listKeranjang[i].Jumlah);
      }
    }

    if(total/1000 >= 1){
        output = (total/1000).toInt().toString()+ "."+ (1000+(total%1000)).toString().substring(1,4)+ ".000";
    }else if(total > 0 && total < 1000) {
      output = total.toInt().toString()+".000";
    }
    return "Rp " + output;
  }

  Future<void> _deleteKeranjang(CartShop keranjang, int position) async {
    await db.deleteKeranjang(keranjang.id!);

    setState(() {
      listKeranjang.removeAt(position);
    });
  }
  Future<void> tambahProduk(CartShop keranjang) async{
    await db.updateKeranjang(CartShop.fromMap({
      'Id' : keranjang.id,
      'NamaProduk' : keranjang.NamaProduk,
      'Harga' : keranjang.Harga,
      'Jumlah' : keranjang.Jumlah+1,
      'Gambar' : keranjang.Gambar,
      'Status' : keranjang.Status,
    }));
  }
  Future<void> statusKeranjang(CartShop keranjang) async{
    if(keranjang.Status == 1){
      await db.updateKeranjang(CartShop.fromMap({
        'Id' : keranjang.id,
        'NamaProduk' : keranjang.NamaProduk,
        'Harga' : keranjang.Harga,
        'Jumlah' : keranjang.Jumlah,
        'Gambar' : keranjang.Gambar,
        'Status' : 0,
      }));
    }else{
      await db.updateKeranjang(CartShop.fromMap({
        'Id' : keranjang.id,
        'NamaProduk' : keranjang.NamaProduk,
        'Harga' : keranjang.Harga,
        'Jumlah' : keranjang.Jumlah,
        'Gambar' : keranjang.Gambar,
        'Status' : 1,
      }));
    }
  }
  Future<void> kurangProduk(CartShop keranjang,int index) async{
    if(keranjang.Jumlah-1 == 0){
      _deleteKeranjang(keranjang, index);
    }else{
      await db.updateKeranjang(CartShop.fromMap({
        'Id' : keranjang.id,
        'NamaProduk' : keranjang.NamaProduk,
        'Harga' : keranjang.Harga,
        'Jumlah' : keranjang.Jumlah-1,
        'Gambar' : keranjang.Gambar,
        'Status' : keranjang.Status,
      }));
    }
  }
}