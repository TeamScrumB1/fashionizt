import 'package:cari/pages/categories.dart';
import 'package:flutter/material.dart';
import 'package:cari/theme.dart';
import 'package:flutter/widgets.dart';
import '../widget/horizontal_card.dart';

class MainPage extends StatefulWidget {
  Cari createState() => Cari();
}

class Cari extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconTheme(
          data: new IconThemeData(color: blackColor),
          child: new Icon(Icons.arrow_back_ios_rounded),
        ),
        backgroundColor: whiteColor,
      ),
     body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.asset(
                "lib/assets/images/cover.jpg",
                width: 600.0,
                height: 180,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, left: 31),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Explore Garment",
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(fontWeight: FontWeight.w800, color: Colors.black,
                          fontSize: 25,),
                    ),
                    Row(
                      children: [
                        Text('Recommended',
                            style: TextStyle(
                              color: blackColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                            )),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 24),
                          child: TextButton(
                            style: TextButton.styleFrom(),
                            onPressed: () {},
                            child: Text('View All',
                                style: TextStyle(
                                  color: blackColor,
                                  fontWeight: FontWeight.w200,
                                  fontSize: 13,
                                )),
                          ),
                        ),
                      ],
                    ),
                    Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          for (int i = 0; i < 2; i++)
                            (horizontalCard(
                              imageUrl: 'https://i.imgur.com/fcrb4wv.jpeg',
                              name: 'Konveksi Sejahtera',
                              bio: 'Spesialis Gaun, Kemeja',
                              rating: '4.9',
                              project: '100',
                            ))
                        ]),
                    Row(
                      children: [
                        Text('Category',
                            style: TextStyle(
                              color: blackColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                            )),
                        Padding(
                          padding: EdgeInsets.only(top: 70),
                          ),
                      ],
                    ),
                    Categories(),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}