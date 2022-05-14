import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fashionizt/Pages/detail_desainer.dart';
import 'package:flutter/material.dart';
import 'package:fashionizt/theme.dart';
import '../api/api_desainer.dart';
import '../Models/desainer_model.dart';
import '../Widget/vertical_listview.dart';

class PilihDesainer extends StatefulWidget {
  Pilih createState() => Pilih();
}

class Pilih extends State<PilihDesainer> {
  late Future<Desainer> _desainer;

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
    _desainer = ApiServiceDes().topHeadlines();
  }

  @override
  Widget  _buildList(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 5.0, left: 31),
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
                            future: _desainer,
                            builder: (context, AsyncSnapshot<Desainer> snapshot) {
                              var state = snapshot.connectionState;
                              if (state != ConnectionState.done) {
                                return Center(child: CircularProgressIndicator());
                              } else {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: snapshot.data?.desainer.length,
                                    itemBuilder: (context, index) {
                                      var desainer = snapshot.data?.desainer[index];
                                      return InkWell(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(builder: (context) {
                                                  return DetailDesainer(desainer: desainer!);
                                                }));
                                          },
                                          child: VerListDes(desainer: desainer!)
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
        title: Text('Pilih Desainer',
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