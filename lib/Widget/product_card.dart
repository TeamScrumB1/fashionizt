import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashionizt/Models/produk_model.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({required this.produk});
  final ProdukElement produk;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        margin: EdgeInsets.all(5),
        child: Column(
          children: [
            Text(
              produk.nama,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
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
            Container(
              margin: EdgeInsets.symmetric(vertical: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.star,
                    size: 30.0,
                    color: Colors.grey,
                  ),
                  Text(produk.rating,style: TextStyle(fontSize: 18),),
                ],
              ),
            ),
            Text(
              produk.deskripsi,
              style: TextStyle(
                  fontSize: 15
              ),
              textAlign : TextAlign.center,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 3),
              child: Text(
                'Rp.'+ produk.harga,
                style: TextStyle(
                  fontSize: 20,
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
