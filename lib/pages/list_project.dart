import 'package:fashionizt/Widget/bottom_navbar.dart';
import 'package:fashionizt/constants.dart';
import 'package:fashionizt/pages/detail_project_desainer_mitra.dart';
//import 'package:fashionizt/pages/detail_project_desainer_mitra.dart';
import 'package:fashionizt/pages/edit_myprofile.dart';
import 'package:fashionizt/pages/login_screen.dart';
import 'package:fashionizt/pages/pre_order.dart';
import 'package:fashionizt/theme.dart';
import 'package:flutter/material.dart';
import 'package:fashionizt/pages/home_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:fashionizt/Widget/alert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';
import '../shared_preferences.dart';

class ProjectList extends StatefulWidget {
  @override
  _ProjectListState createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList>{
  @override

  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: blacksand,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          color: blush,
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text(
          'List Project',
          style: titleApps,
        ),
        // actions: <Widget>[
        //   IconButton(
        //     onPressed: () async {
        //
        //     },
        //     icon: const Icon(Icons.logout_rounded, size: 25,),
        //     color: blush,
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
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
                                Text("24-06-2022", style: TextStyle(fontSize: 12, color: Colors.grey)),
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
                                    Text("Custom Kaos", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                                    Text("Spesifikasi"),
                                    Text("Biaya :", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: blacksand))
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
                                                     return DetailProjectDesainer();
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}