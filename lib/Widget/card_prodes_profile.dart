import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashionizt/Models/desainer_model.dart';
import 'package:fashionizt/Widget/horizontal_prodes_listview.dart';
// import 'package:fashionizt/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme.dart';
class CardProDesProfile extends StatefulWidget {
  const CardProDesProfile({Key? key,required this.desainer}) : super(key: key);
  final DesainerElement desainer;

  @override
  State<CardProDesProfile> createState() => _CardProDesProfileState(desainer: desainer);
}

class _CardProDesProfileState extends State<CardProDesProfile> {
  final DesainerElement desainer;
  _CardProDesProfileState({required this.desainer});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String status = "false";
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 1,
      child: Container(
        margin: EdgeInsets.all(5),
        height: size.height*1,
        width: size.width*0.4,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
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
            SizedBox(height: 5),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.star,
                    size: 20.0,
                    color: Colors.amber,
                  ),
                  Text(desainer.rating,style: ratingHorizontalCardTextStyle,),
                ],
              ),
            ),
            SizedBox(height: 5),
            status == "false" || status == desainer.id ?
            ElevatedButton(
              onPressed: (){},
              child: Text(
                'Accepted',
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.green),
                  ),
                )
              ),
            ) : Container(
              width: size.width*0.3,
              height: size.height*0.04,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.red,
              ),
              child: Center(
                child: Text(
                  'Rejected',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

