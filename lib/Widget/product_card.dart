import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashionizt/Models/produk_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({required this.produk});
  final ProdukElement produk;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: Column(
        children: [
          Image(
            fit: BoxFit.fill,
            width: 200,
            height: 200,
            image: CachedNetworkImageProvider(
              produk.imgProduk,
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5,right: 5,top: 5),
                    child: Text(
                      produk.nama,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Text(
                    produk.deskripsi,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children : [
                      Container(
                        child: Text(
                          'Rp.'+ produk.harga,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            size: 30.0,
                            color: Colors.yellow,
                          ),
                          Text(produk.rating,style: TextStyle(fontSize: 18),),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
          )
        ],
      ),
      // child: Container(
      //   margin: EdgeInsets.all(5),
      //   child: Column(
      //     children: [
      //       Text(
      //         produk.nama,
      //         style: TextStyle(
      //           fontSize: 18,
      //           fontWeight: FontWeight.bold,
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(4.0),
      //         child: ClipRRect(
      //           borderRadius: BorderRadius.circular(20.0),
      //           child: Image(
      //             // 'assets/images/Kemeja.jpg',
      //             image: CachedNetworkImageProvider(
      //                 produk.imgProduk
      //             ),
      //             width: 150,
      //             height: 150,
      //           ),
      //         ),
      //       ),
      //       Container(
      //         margin: EdgeInsets.symmetric(vertical: 3),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: <Widget>[
      //             Icon(
      //               Icons.star,
      //               size: 30.0,
      //               color: Colors.grey,
      //             ),
      //             Text(produk.rating,style: TextStyle(fontSize: 18),),
      //           ],
      //         ),
      //       ),
      //       Text(
      //         produk.deskripsi,
      //         style: TextStyle(
      //             fontSize: 15
      //         ),
      //         textAlign : TextAlign.center,
      //       ),
      //       Container(
      //         margin: EdgeInsets.symmetric(vertical: 3),
      //         child: Text(
      //           'Rp.'+ produk.harga,
      //           style: TextStyle(
      //             fontSize: 20,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
