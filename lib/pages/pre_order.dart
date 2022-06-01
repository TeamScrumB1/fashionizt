import 'package:fashionizt/constants.dart';
import 'package:fashionizt/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:io';
import 'package:fashionizt/Widget/gridview_produk.dart';
import 'package:flutter/painting.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:iconsax/iconsax.dart';

class PreOrder extends StatefulWidget {
  const PreOrder({Key? key}) : super(key: key);

  @override
  _PreOrderState createState() => _PreOrderState();
}

class _PreOrderState extends State<PreOrder> with SingleTickerProviderStateMixin{
  late AnimationController loadingController;

  File? _file;
  PlatformFile? _platformFile;

  selectFile() async {
    final file = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['png', 'jpg', 'jpeg', 'pdf']
    );

    if (file != null) {
      setState(() {
        _file = File(file.files.single.path!);
        _platformFile = file.files.first;
      });
    }
    loadingController.forward();
  }

  @override
  void initState() {
    loadingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..addListener(() { setState(() {}); });

    super.initState();
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: 2,
    child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: blacksand,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          color: blush,
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Pre Order',
          style: titleApps,
        ),
        bottom: TabBar(
          indicatorColor: blush,
          labelColor: blush,
          tabs:<Widget>[
          Tab(
            child: Text('Form', style: TextStyle(
              fontSize: 16,
              ),
            ),
          ),
          Tab(
            child: Text('Riwayat', style: TextStyle(
              fontSize: 16,
              ),
            ),
          ),
        ],
        ),
      ),
      body: TabBarView(
        children: <Widget>[
         SingleChildScrollView(
              padding: EdgeInsets.all(22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Judul :', style: TextStyle(fontSize: 16 ,fontWeight: FontWeight.w600)),
                  const SizedBox(height: 5),
                  TextField(
                    maxLines: 1,
                    decoration: InputDecoration(
                       border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text('Kebutuhan Spesifikasi :', style: TextStyle(fontSize: 16 ,fontWeight: FontWeight.w600)),
                  const SizedBox(height: 5),
                  TextField(
                    maxLines: 1,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text('Biaya :', style: TextStyle(fontSize: 16 ,fontWeight: FontWeight.w600)),
                  const SizedBox(height: 5),
                  TextField(
                    maxLines: 1,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text('Lampiran :', style: TextStyle(fontSize: 16 ,fontWeight: FontWeight.w600)),
                  GestureDetector(
                    onTap: selectFile,
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: Radius.circular(6),
                          dashPattern: [10, 4],
                          strokeCap: StrokeCap.round,
                          color: Colors.blue.shade400,
                          child: Container(
                            width: double.infinity,
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.blue.shade50.withOpacity(.3),
                                borderRadius: BorderRadius.circular(6)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Iconsax.folder_open, color: Colors.blue, size: 40,),
                                SizedBox(height: 15,),
                                Text('Tambahkan File Desain Anda', style: TextStyle(fontSize: 15, color: Colors.grey.shade400),),
                              ],
                            ),
                          ),
                        )
                    ),
                  ),
                  _platformFile != null
                      ? Container(
                    padding: EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Desain Anda',
                              style: TextStyle(color: Colors.grey.shade600, fontSize: 15, ),),
                            SizedBox(height: 10,),
                            Container(
                              padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade200,
                                        offset: Offset(0, 1),
                                        blurRadius: 3,
                                        spreadRadius: 2,
                                      )
                                    ]
                                ),
                                child: Row(
                                    children: [
                                      ClipRRect(
                                          borderRadius: BorderRadius.circular(6),
                                          child: Image.file(_file!, width: 70,)
                                      ),
                                      SizedBox(width: 10,),
                                      Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(_platformFile!.name,
                                                  style: TextStyle(fontSize: 13, color: Colors.black),),
                                                SizedBox(height: 5,),
                                                Text('${(_platformFile!.size / 1024).ceil()} KB',
                                                  style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
                                                ),
                                                SizedBox(height: 5,),
                                                Container(
                                                  height: 5,
                                                  clipBehavior: Clip.hardEdge,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(6),
                                                    color: Colors.blue.shade50,
                                                  ),
                                                    child: LinearProgressIndicator(
                                                      value: loadingController.value,
                                                    ),
                                                ),
                                              ]
                                          )
                                      )
                                    ]
                                )
                            )
                          ]
                      )
                  ):
                  SizedBox(height: 20),
                  Card(
                    color: blacksand,
                    elevation: 5,
                    child: Container(
                      height: 40,
                      child: InkWell(
                        splashColor: blush,
                        onTap: (){},
                        child: Center(
                          child: Text("Submit", style: TextStyle(fontSize: 16, color: blush, fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ),
                  )
             ])
          ),
          Scaffold(
            body: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) => Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 15, right: 15),
                margin: EdgeInsets.only(top: 10),
                  child: Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Judul Project", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
                                  Text("Spesifikasi"),
                                  Text("Biaya :", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: blacksand))
                                ],
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                              children: [
                                Text("24-10-2022", style: TextStyle(fontSize: 12, color: Colors.grey)),
                                TextButton(
                                  onPressed: (){},
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    backgroundColor: blacksand,
                                  ),
                                  child: Text("Detail", style: TextStyle(color: blush)),
                                ),
                              ],
                          ),
                        ],
                      ),
                    ),
                  ),
              ),
            )
          )
          ])
        ),
      );
}