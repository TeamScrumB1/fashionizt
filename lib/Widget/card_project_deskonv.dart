import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Models/project_model.dart';
import '../constants.dart';
import '../pages/detail_project_deskonv.dart';
import '../theme.dart';

class CardProjectDeskonv extends StatelessWidget {
  final ProjectElement project;
  const CardProjectDeskonv({required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 1,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 15, right: 15),
        margin: EdgeInsets.only(top: 10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(right: 5, left: 5),
                margin: EdgeInsets.only(bottom: 8, top: 8),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 18,
                            backgroundImage: AssetImage('lib/Assets/images/profil.jpg'),
                          ),
                          SizedBox(width: 10),
                          Text("Anonymous", style: TextStyle(fontSize: 17,color: Colors.black, fontWeight: FontWeight.w500)),
                          Spacer(),
                          Text(project.createdAt,  style: TextStyle(fontSize: 12, color: Colors.grey)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(project.judul, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                              // Text("Spesifikasi"),
                              Text("Biaya : " +project.biaya, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: blacksand))
                            ],
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    TextButton(
                                      onPressed: (){
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) {
                                              return DetailProjectDesKonv();
                                            }));
                                      },
                                      style: TextButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        backgroundColor: blacksand,
                                      ),
                                      child: Text("Detail", style: TextStyle(color: blush)),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
      );
  }
}

