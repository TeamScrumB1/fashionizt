import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fashionizt/Pages/detail_desainer.dart';
import 'package:flutter/material.dart';
import 'package:fashionizt/theme.dart';
import '../api/api_konveksi.dart';
import '../Models/konveksi_model.dart';
import '../Widget/vertical_listview.dart';
import 'detail_mitra.dart';

class PilihKonveksi extends StatefulWidget {
  Pilih createState() => Pilih();
}

class Pilih extends State<PilihKonveksi> {
  late Future<Konveksi> _konveksi;

  String? selectedValue;
  List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];

  @override
  void initState() {
    super.initState();
    _konveksi = ApiServiceMit().topHeadlines();
  }

  @override
  Widget  _buildList(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Filter berdasarkan',
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
                            child: Text('Hapus Filter',
                                style: TextStyle(
                                  color: blackColor,
                                  fontWeight: FontWeight.w200,
                                  fontSize: 13,
                                )),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            hint: Text('Kategori', style: menuFilterTextStyle),
                            items: items
                                .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ))
                                .toList(),
                            value: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value as String;
                              });
                            },
                            buttonHeight: 40,
                            buttonWidth: 75,
                            itemHeight: 40,
                          ),
                        ),
                        DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            hint: Text('Rating', style: menuFilterTextStyle),
                            items: items
                                .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ))
                                .toList(),
                            value: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value as String;
                              });
                            },
                            buttonHeight: 40,
                            buttonWidth: 75,
                            itemHeight: 40,
                          ),
                        ),
                        DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            hint: Text('Tarif', style: menuFilterTextStyle),
                            items: items
                                .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                                .toList(),
                            value: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value as String;
                              });
                            },
                            buttonHeight: 40,
                            buttonWidth: 75,
                            itemHeight: 40,
                          ),
                        ),
                      ],
                    ),
                    Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
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
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: snapshot.data?.konveksi.length,
                                    itemBuilder: (context, index) {
                                      var konveksi = snapshot.data?.konveksi[index];
                                      return InkWell(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(builder: (context) {
                                                  return DetailKonveksi(konveksi: konveksi!);
                                                }));
                                          },
                                          child: VerListMit(konveksi: konveksi!)
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
                  ],
                ),
              )
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
        ),
        title: Text('Pilih Konveksi',
            style: TextStyle(
              color: blackColor,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            )),
        backgroundColor: whiteColor,
      ),
      body: _buildList(context),
    );
  }
}