import 'package:fashionizt/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fashionizt/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import '../Models/project_list_all_model.dart';
import '../constants.dart';

class DetailProjectDesKonv extends StatelessWidget {
  const DetailProjectDesKonv({Key? key,required this.project}) : super(key: key);
  final ProjectElement project;

  //File? _file;
  //PlatformFile? _platformFile;

  //selectFile() async {
  //  final file = await FilePicker.platform.pickFiles(
  //      type: FileType.custom,
  //      allowedExtensions: ['png', 'jpg', 'jpeg', 'pdf']
  //  );

  //  if (file != null) {
  //    setState(() {
  //      _file = File(file.files.single.path!);
  //      _platformFile = file.files.first;
  //    });
  //  }
  //}

  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blacksand,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          color: blush,
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        title: Text(
          'Detail Project',
          style: titleApps,
        ),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          // IconButton(
          //   onPressed: () {
          //     _launchURL('https://api.whatsapp.com/send?phone=6285808322783&text=Transaksi%20akan%20dialihkan%20ke%20admin%20Fashionizt');
          //   },
          //   icon: const Icon(Icons.shopping_cart, size: 25,),
          //   color: blush,
          // ),
        ],
      ),
      body: Container(
        height: size.height*1,
        width: size.width*1,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: size.width*0.05, vertical:size.height*0.01,),
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    //child: SubTittle(sub: "Kategori")
                  ),
                  Text(
                    'Judul :',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      //color: blacksand,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    //child: SubTittle(sub: "Kategori")
                  ),
                  Text(
                    project.judul,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      //color: blacksand,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    //child: SubTittle(sub: "Kategori")
                  ),
                  Text(
                    'Kebutuhan Spesifik : ',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      //color: blacksand,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    //child: SubTittle(sub: "Kategori")
                  ),
                  Text(
                    project.kebutuhan,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      //color: blacksand,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    //child: SubTittle(sub: "Kategori")
                  ),
                  Text(
                    'Biaya : ',
                    //konveksi.nama,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      //color: blacksand,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    //child: SubTittle(sub: "Kategori")
                  ),
                  Text(
                    project.biaya,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      //color: blacksand,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    //child: SubTittle(sub: "Kategori")
                  ),
                  Text(
                    'Lampiran : ',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      //color: blacksand,
                    ),
                  ),
                  //_platformFile != null
                  //?
                  Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade200,
                                        offset: Offset(0, 1),
                                        blurRadius: 2,
                                      )
                                    ]
                                ),
                                child: Row(
                                    children: [
                                      // ClipRRect(
                                      //     borderRadius: BorderRadius.circular(6),
                                      //     child: Image.file(_file!, width: 70,)
                                      // ),
                                      ClipRRect(
                                          borderRadius: BorderRadius.circular(6),
                                          child: Image.asset('lib/Assets/images/Gaun.jpg', width: 70,)
                                      ),
                                      SizedBox(width: 10,),
                                      Expanded(
                                          child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                // Text(_platformFile!.name,
                                                //   style: TextStyle(fontSize: 13, color: Colors.black),),
                                                // SizedBox(height: 5,),
                                                // Text('${(_platformFile!.size / 1024).ceil()} KB',
                                                //   style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
                                                // ),
                                                Text('Gaun Cantik',
                                                  style: TextStyle(fontSize: 13, color: Colors.black),),
                                                SizedBox(height: 5,),
                                                Text('100 KB',
                                                  style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
                                                ),
                                              ]
                                          )
                                      )
                                    ]
                                )
                            )
                          ]
                      )
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    //child: SubTittle(sub: "Kategori")
                  ),
                  Text(
                    'Diajukan oleh : ',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      //color: blacksand,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              //child: SubTittle(sub: "Kategori")
            ),
            SingleChildScrollView(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('lib/Assets/images/profil.jpg',
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(project.username,
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              height: size.height * 0.20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  width: 300,
                  height: 37,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      padding: const EdgeInsets.all(5.0),
                      primary: blush,
                      backgroundColor: blacksand,
                      shadowColor: Colors.black,
                      textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, fontFamily: 'Poppins'),
                    ),
                    onPressed: () {
                      // register();
                    },
                    child: Text('Accept'),
                  ),
                )
              ], // <Widget>[]
            ),
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Container(
            //     margin: const EdgeInsets.all(5),
            //     width: double.infinity,
            //     child: ElevatedButton(
            //         onPressed: (){},
            //         child: const Text('Accept', style: TextStyle(fontSize: 20, color: blacksand, textColor: blush,)),
            //     )
            //   ),
            // ),
          ],
        )
      ),
    );
  }
}