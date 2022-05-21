import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashionizt/Models/produk_model.dart';
import 'package:fashionizt/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../theme.dart';

class FeedsCard extends StatelessWidget {
  const FeedsCard({required this.produk});
  final ProdukElement produk;

  @override
  Widget build(BuildContext context) {
    return Card(
      // margin:EdgeInsets.symmetric(horizontal: 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(1.0),
      ),
      elevation: 1,
      child: Column(
        children: [
          // Padding(padding: EdgeInsets.symmetric(horizontal: 1),),
          Image(
            fit: BoxFit.fill,
            width: 200,
            height: 128,
            image: CachedNetworkImageProvider(
              produk.imgProduk,
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                ],
              ),
          )
        ],
      ),
    );
  }
}
