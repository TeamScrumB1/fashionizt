import 'package:flutter/material.dart';
import 'package:cari/theme.dart';

class horizontalCard extends StatelessWidget{
  final String imageUrl;
  final String name;
  final String bio;
  final String rating;
  final String project;

  horizontalCard({required this.imageUrl,required this.name,required this.bio,required this.rating,required this.project});

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
                        imageUrl),
                    radius: 40,
                  ),
                  SizedBox(width: 43,),
                  Container(
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: titleHorizontalCardTextStyle,
                            ),
                            SizedBox(height: 2,),
                            Text(
                                bio,
                                style: subtitleHorizontalCardTextStyle
                            ),
                          ],
                        ),
                        SizedBox(height: 25,),
                        Column(
                          children: [
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      rating + '/5',
                                      style:subtitleHorizontalCardTextStyle.copyWith(
                                        fontSize: 10,
                                      ),
                                    ),
                                    Icon(Icons.star_border, color: Colors.black),
                                  ],
                                ),
                                SizedBox(width: 10,),
                                Row(
                                  children: [
                                    Text(
                                      project,
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