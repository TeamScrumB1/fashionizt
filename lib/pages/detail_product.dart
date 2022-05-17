import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashionizt/Models/produk_model.dart';
import 'package:fashionizt/pages/cart_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailProduct extends StatelessWidget {
  const DetailProduct({Key? key,required this.detail}) : super(key: key);
  final ProdukElement detail;

  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
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
                width: size.width*0.3,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(right: BorderSide(width: 0.5,color: Colors.black)),
                ),
                child: IconButton(
                  onPressed: () => _launchURL(detail.waDesainer),
                  icon: Icon(Icons.whatsapp, color: Colors.black),
                  iconSize: 25.0,
                ),
              ),
              Container(
                width: size.width*0.3,
                alignment: Alignment.center,
                child: IconButton(
                  onPressed: () {
                    _launchURL('https://api.whatsapp.com/send?phone=6285808322783&text=Transaksi%20akan%20dialihkan%20ke%20admin%20Fashionizt');
                  },
                  icon: Icon(Icons.add_shopping_cart, color: Colors.black),
                  iconSize: 25.0,
                ),
              ),
              Container(
                width: size.width*0.4,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                child:  TextButton(
                  onPressed: () {
                    _launchURL('https://api.whatsapp.com/send?phone=6285808322783&text=Transaksi%20akan%20dialihkan%20ke%20admin%20Fashionizt');
                  },
                  child: const Text('Buy Now',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                ),
              ),
            ],
          ),
        ),
      ),
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
        title: const Text('Detail Produk', style: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.black,
        ),),
        actions: [
          IconButton(
            onPressed: () {
              _launchURL('https://api.whatsapp.com/send?phone=6285808322783&text=Transaksi%20akan%20dialihkan%20ke%20admin%20Fashionizt');
            },
            icon: const Icon(Icons.shopping_cart, size: 25,),
            color: Colors.black,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Container(
                color: Colors.black,
                height: size.height*0.45,
                alignment: Alignment.center,
                child: Image(
                  image: CachedNetworkImageProvider(
                      detail.imgProduk
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: size.height* 0.4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10,left: 20,right: 20),
                      child: Row(
                        children: [
                          Text(detail.nama,
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Text(
                            'Rp. '+detail.harga,
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal:20),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            size: 25.0,
                            color: Colors.yellow,
                          ),
                          Text(detail.rating,style: TextStyle(fontSize: 20),),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Text(
                        'Flutter adalah sebuah framework aplikasi mobil sumber terbuka yang diciptakan oleh Google. Flutter digunakan dalam pengembangan aplikasi untuk sistem operasi Android, iOS, Windows, Linux, MacOS, serta menjadi metode utama untuk membuat aplikasi Google Fuchsia. ',
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Text(
                      'Desainer',
                      style:  TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Padding(
                          padding: EdgeInsets.only(top: 5),
                          child:Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: fromCssColor('#FAF3E0'),
                            elevation: 5,
                            shadowColor: Colors.black,
                            child: Padding(
                                padding: EdgeInsets.only(top: 13, left: 30, bottom: 13),
                                child:Row(
                                  children:[
                                    CircleAvatar(
                                      backgroundImage: CachedNetworkImageProvider(
                                        detail.imgDesainer,
                                      ),
                                      radius: 40,
                                    ),
                                    SizedBox(width: 43,),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                detail.namaDesainer,
                                              ),
                                              SizedBox(height: 2,),
                                              Text(
                                                'Desainer '+detail.kategoriDesainer,
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 25,),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        detail.ratingDesainer,
                                                        // style:subtitleHorizontalCardTextStyle.copyWith(
                                                        //   fontSize: 10,
                                                        // ),
                                                      ),
                                                      Icon(Icons.star_border, color: Colors.black),
                                                    ],
                                                  ),
                                                  SizedBox(width: 10,),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        detail.projekDesainer,
                                                        // style:subtitleHorizontalCardTextStyle.copyWith(
                                                        //   fontSize: 10,
                                                        // ),
                                                      ),
                                                      Icon(Icons.task_outlined, color: Colors.black),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

