import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashionizt/Models/produk_model.dart';
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
      child: Container(
        margin: EdgeInsets.all(5),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image(
                  // 'assets/images/Kemeja.jpg',
                  image: CachedNetworkImageProvider(
                      produk.imgProduk
                  ),
                  width: 150,
                  height: 150,
                ),
              ),
            ),
            Text(
              produk.nama,
              style: nameHorizontalCardTextStyle,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(produk.rating,style: ratingHorizontalCardTextStyle),
                  Icon(
                    Icons.star,
                    color: Colors.grey,
                    size: 20.0,
                  ),
                ],
              ),
            ),
            Text(
              produk.deskripsi,
              style: bioHorizontalCardTextStyle,
              textAlign: TextAlign.center,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 3),
              child: Text(
                'Rp '+ produk.harga,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
