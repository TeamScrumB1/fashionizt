import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashionizt/Models/desainer_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class CardDesProfile extends StatelessWidget {
  final DesainerElement desainer;
  const CardDesProfile({required this.desainer});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: Container(
        margin: EdgeInsets.all(5),
        width: 150,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: CircleAvatar(
                  backgroundImage:  CachedNetworkImageProvider(
                      desainer.imgProfil),
                  radius: 65,
                ),
              ),
            ),
            Text(
              desainer.nama,
              style: nameHorizontalCardTextStyle,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.star,
                    size: 20.0,
                    color: Colors.yellow,
                  ),
                  Text(desainer.rating,style: ratingHorizontalCardTextStyle,),
                ],
              ),
            ),
            Text(
              desainer.bio,
              style: bioHorizontalCardTextStyle,
              textAlign : TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}

