import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashionizt/Models/desainer_model.dart';
import 'package:fashionizt/Models/konveksi_model.dart';
import 'package:fashionizt/constants.dart';
import 'package:flutter/material.dart';
import '../theme.dart';

class VerListDes extends StatelessWidget {
  const VerListDes({Key? key,required this.desainer}) : super(key: key);
  final DesainerElement desainer;


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 5),
        child:Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: blush,
          elevation: 3,
          shadowColor: Colors.black,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child:Row(
                children:[
                  CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                        desainer.imgProfil),
                    radius: 40,
                  ),
                  SizedBox(width: 40,),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              desainer.nama,
                              style: titleVerticalCardTextStyle,
                            ),
                            SizedBox(height: 2,),
                            Text(
                              'Desainer ' + desainer.kategori,
                              style: subtitleVerticalCardTextStyle,
                            ),
                          ],
                        ),
                        SizedBox(height: 15,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.star_border, color: blacksand),
                                    Text(
                                      desainer.rating + '/5',
                                    ),
                                  ],
                                ),
                                SizedBox(width: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.task_outlined, color: blacksand),
                                    Text(
                                      desainer.jmlhProject,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
          ),
        )
    );
  }
}

class VerListMit extends StatelessWidget {
  const VerListMit({Key? key,required this.konveksi}) : super(key: key);
  final KonveksiElement konveksi;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 5),
        child:Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: blush,
          elevation: 3,
          shadowColor: Colors.black,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child:Row(
                children:[
                  CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                        konveksi.imgProfil),
                    radius: 40,
                  ),
                  SizedBox(width: 40,),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              konveksi.nama,
                              style: titleVerticalCardTextStyle,
                            ),
                            SizedBox(height: 2,),
                            Text(
                              'Mitra Produksi ' + konveksi.kategori,
                              style: subtitleVerticalCardTextStyle,
                            ),
                          ],
                        ),
                        SizedBox(height: 15,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      konveksi.rating + '/5',
                                      style: TextStyle(
                                        color: blacksand
                                      ),
                                    ),
                                    Icon(Icons.star_border, color: blacksand),
                                  ],
                                ),
                                SizedBox(width: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      konveksi.jmlhProject,
                                      style: TextStyle(
                                          color: blacksand
                                      ),
                                    ),
                                    Icon(Icons.task_outlined, color: blacksand),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
          ),
        )
    );
  }
}

