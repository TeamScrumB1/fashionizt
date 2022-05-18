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
          SizedBox(height: 10),
          Image(
            fit: BoxFit.fill,
            width: 200,
            height: 190,
            image: CachedNetworkImageProvider(
              produk.imgProduk,
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5,right: 5,top: 5),
                    child: Text(
                      produk.nama,
                      style: nameHorizontalCardTextStyle,
                    ),
                  ),
                  Text(
                    produk.deskripsi,
                    style: bioHorizontalCardTextStyle,
                      textAlign: TextAlign.center
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children : [
                      Container(
                        child: Text(
                          'Rp '+ produk.harga,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
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
    );
  }
}
