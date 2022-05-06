import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashionizt/Models/konveksi_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardMitProfile extends StatelessWidget {
  final KonveksiElement konveksi;
  const CardMitProfile({required this.konveksi});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        margin: EdgeInsets.all(5),
        width: 150,
        child: Column(
          children: [
            Text(
              konveksi.nama,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.star,
                    size: 20.0,
                    color: Colors.grey,
                  ),
                  Text(konveksi.rating,style: TextStyle(fontSize: 15),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image(
                  image: CachedNetworkImageProvider(
                      konveksi.imgProfil
                  ),
                  width: 150,
                  height: 150,
                ),
              ),
            ),
            Text(
              konveksi.bio,
              style: TextStyle(
                fontSize: 12,
              ),
              textAlign : TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}

