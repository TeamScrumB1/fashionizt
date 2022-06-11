import 'package:fashionizt/constants.dart';
import 'package:fashionizt/theme.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class ProjectList extends StatefulWidget {
  @override
  _ProjectListState createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList>{
  @override

  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;

    // Size size = MediaQuery.of(context).size;
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
          'My List Project',
          style: titleApps,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () async {

            },
            icon: const Icon(Icons.logout_rounded, size: 25,),
            color: blush,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
            ),
          ],
        ),
      ),
    );
  }
}