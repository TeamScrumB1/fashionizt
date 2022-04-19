import 'package:fashionizt/model/desainer_model.dart';
import 'package:flutter/material.dart';
import 'package:fashionizt/theme.dart';

class horizontalCard extends StatelessWidget{
  final DesainerElement desainer;

  const horizontalCard({required this. desainer});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 16),
        child:Card(
          margin: EdgeInsets.only(right: 24),
          color: lightYellowColor,
          elevation: 5,
          shadowColor: Colors.black,
          child: Padding(
              padding: EdgeInsets.only(top: 13, left: 30, bottom: 13),
              child:Row(
                children:[
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        desainer.imgProfil),
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
                              desainer.nama,
                              style: titleHorizontalCardTextStyle,
                            ),
                            SizedBox(height: 2,),
                            Text(
                                desainer.bio,
                                style: subtitleHorizontalCardTextStyle
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
                                      desainer.rating + '/5',
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
                                      desainer.jmlhProject,
                                      style:subtitleHorizontalCardTextStyle.copyWith(
                                        fontSize: 10,
                                      ),
                                    ),
                                    Icon(Icons.mode_comment_outlined, color: Colors.black),
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