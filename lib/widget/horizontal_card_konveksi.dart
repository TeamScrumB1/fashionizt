import 'package:flutter/material.dart';
import 'package:fashionizt/theme.dart';
import 'package:from_css_color/from_css_color.dart';
import '../model/konveksi_model.dart';

class horizontalCardKonveksi extends StatelessWidget{
  final KonveksiElement konveksi;

  const horizontalCardKonveksi({required this. konveksi});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 16),
        child:Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          margin: EdgeInsets.only(right: 24),
          color: fromCssColor('#FAF3E0'),
          elevation: 5,
          shadowColor: Colors.black,
          child: Padding(
              padding: EdgeInsets.only(top: 13, left: 30, bottom: 13),
              child:Row(
                children:[
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        konveksi.imgProfil),
                    radius: 40,
                  ),
                  SizedBox(width: 43,),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              konveksi.nama,
                              style: titleHorizontalCardTextStyle,
                            ),
                            SizedBox(height: 2,),
                            Text(
                                'Konveksi ' + konveksi.kategori,
                                style: subtitleHorizontalCardTextStyle,
                            ),
                          ],
                        ),
                        SizedBox(height: 25,),
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
                                      style:subtitleHorizontalCardTextStyle.copyWith(
                                        fontSize: 10,
                                      ),
                                    ),
                                    Icon(Icons.star_border, color: Colors.black),
                                  ],
                                ),
                                SizedBox(width: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      konveksi.jmlhProject,
                                      style:subtitleHorizontalCardTextStyle.copyWith(
                                        fontSize: 10,
                                      ),
                                    ),
                                    Icon(Icons.task_outlined, color: Colors.black),
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