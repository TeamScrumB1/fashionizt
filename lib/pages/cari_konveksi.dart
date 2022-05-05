import 'package:fashionizt/pages/categories.dart';
import 'package:fashionizt/pages/pilih_konveksi.dart';
import 'package:fashionizt/pages/profil_konveksi.dart';
import 'package:flutter/material.dart';
import 'package:fashionizt/theme.dart';
import '../api/api_short_konveksi.dart';
import '../model/konveksi_model.dart';
import '../widget/horizontal_card_konveksi.dart';
import 'categories.dart';

class MainPageKonveksi extends StatefulWidget {
  Cari createState() => Cari();
}

class Cari extends State<MainPageKonveksi> {
  late Future<Konveksi> _konveksi;

  @override
  void initState() {
    super.initState();
    _konveksi = ApiService().topHeadlines();
  }

  @override
  Widget _buildList(BuildContext context) {
    return Scaffold(
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
                  "Explore Konveksi",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                        fontSize: 25,
                      ),
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
                        onPressed: () {
                          Navigator.push(
                           context,
                            MaterialPageRoute(
                                builder: (context) => MainPage2())
                          );
                        },
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
                      FutureBuilder(
                        future: _konveksi,
                        builder: (context, AsyncSnapshot<Konveksi> snapshot) {
                          var state = snapshot.connectionState;
                          if (state != ConnectionState.done) {
                            return Center(child: CircularProgressIndicator());
                          } else {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data?.konveksi.length,
                                itemBuilder: (context, index) {
                                  var konveksi = snapshot.data?.konveksi[index];
                                  return InkWell(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) {
                                              return ProfilPageKonveksi(konveksi: konveksi!);
                                            }));
                                      },
                                      child: horizontalCardKonveksi(konveksi: konveksi!)
                                  );
                                },
                              );
                            } else if (snapshot.hasError) {
                              return Center(child: Text(snapshot.error.toString()));
                            } else {
                              return Text('');
                            }
                          }
                        },
                      )
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

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconTheme(
          data: new IconThemeData(color: blackColor),
          child: new Icon(Icons.arrow_back_ios_rounded),
        ),
        backgroundColor: whiteColor,
      ),
      body: _buildList(context),
    );
  }

}
