import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashionizt/Models/produk_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fashionizt/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailProduct extends StatelessWidget {
  const DetailProduct({Key? key,required this.detail}) : super(key: key);
  final ProdukElement detail;

  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
//
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
         //   Container(
         //    width: size.width*0.3,
         //    alignment: Alignment.center,
         //    decoration: BoxDecoration(
         //        border: Border(right: BorderSide(width: 0.5,color: Colors.black)),
         //      ),
         //      child: IconButton(
         //        onPressed: () => _launchURL(detail.waDesainer),
         //        icon: Icon(Icons.add_shopping_cart_outlined, color: blacksand),
         //        iconSize: 25.0,
         //      ),
         //    ),
              Container(
                width: size.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: blacksand,
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: ElevatedButton(
          child: Icon(Icons.arrow_back_ios_rounded),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(5),
            primary: Colors.black38,
            onPrimary: Colors.white,
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        //title: const Text('Detail Produk', style: TextStyle(
        //  fontFamily: 'Poppins',
        //  fontWeight: FontWeight.bold,
        //  fontSize: 20,
        //  color: Colors.black,
        //),),
        actions: [
          ElevatedButton(
            child: Icon(Icons.shopping_cart),
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(5),
              primary: Colors.black38,
              onPrimary: Colors.white,
            ),
            onPressed: () {
              _launchURL('https://api.whatsapp.com/send?phone=6285808322783&text=Transaksi%20akan%20dialihkan%20ke%20admin%20Fashionizt');
            },
          ),
        ],
      ),
      extendBodyBehindAppBar: true,

      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Container(
                color: Colors.black,
                height: size.height*0.5,
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
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20,left: 20,right: 20),
                      child: Row(
                        children: [
                          Text(detail.nama,
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Spacer(),
                          Text(
                            'Rp'+detail.harga,
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              color: blacksand,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal:20),
                      child: Row(
                        children: <Widget>[
                          RatingBarIndicator(
                            rating: double.parse(detail.rating),
                            itemBuilder: (_, __) {
                              return Icon(
                                Icons.star,
                                color: Colors.amber,
                              );
                            },
                            itemSize: 20,
                          ),
                          Text(' '+detail.rating,style: TextStyle(fontSize: 15),),
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
                    Divider(
                      color: greyy,
                      height: 25,
                      thickness: 2,
                      indent: 5,
                      endIndent: 5,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 0),
                            child: Padding(
                                padding: EdgeInsets.only(top: 5, left: 30, bottom: 20),
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
                                                style:  TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              SizedBox(height: 2,),
                                              Text(
                                                'Desainer '+detail.kategoriDesainer,
                                                style:  TextStyle(
                                                  fontSize: 13,
                                                  color: darkgrey,
                                                ),
                                              ),
                                            ],
                                          ),
                                          ElevatedButton(
                                            child: Text("Kunjungi",
                                              style:  TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.white,
                                              onPrimary: blacksand,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10.0),
                                                side: BorderSide(color: blacksand, width: 1),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 5),
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
                                                        style:  TextStyle(
                                                          fontSize: 14,
                                                          color: blacksand,
                                                        ),
                                                        // style:subtitleHorizontalCardTextStyle.copyWith(
                                                        //   fontSize: 10,
                                                        // ),
                                                      ),
                                                      Text(
                                                       "  Penilaian"
                                                      ),
                                                      //Icon(Icons.star_border, color: Colors.black),
                                                    ],
                                                  ),
                                                  SizedBox(width: 10,),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        detail.projekDesainer,
                                                        style:  TextStyle(
                                                          fontSize: 14,
                                                          color: blacksand,
                                                        ),
                                                        // style:subtitleHorizontalCardTextStyle.copyWith(
                                                        //   fontSize: 10,
                                                        // ),
                                                      ),
                                                      Text(
                                                        " Projek"

                                                      ),
                                                      //Icon(Icons.task_outlined, color: Colors.black),
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
                      ),
                    Divider(
                      color: greyy,
                      height: 0,
                      thickness: 2,
                      indent: 5,
                      endIndent: 5,
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

