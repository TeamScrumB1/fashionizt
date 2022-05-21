import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashionizt/Models/produk_model.dart';
import 'package:fashionizt/constants.dart';
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
        borderRadius: BorderRadius.circular(15),
      ),
    elevation: 1,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
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
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      produk.nama,
                      style: nameHorizontalCardTextStyle,
                    ),
                  ),
                 // SizedBox(height: 10),
                 // Text(
                 //   produk.deskripsi,
                 //   style: bioHorizontalCardTextStyle,
                 //     textAlign: TextAlign.center
                 // ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children : [
                      Container(
                        child: Text(
                          'Rp '+ produk.harga,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                            color: blacksand,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            size: 20.0,
                            color: Colors.yellow,
                          ),
                          Text(produk.rating, style: ratingHorizontalCardTextStyle,),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
          )
        ],
      ),
    )
    );
  }
}
