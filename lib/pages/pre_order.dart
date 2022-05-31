import 'package:fashionizt/constants.dart';
import 'package:fashionizt/pages/detail_project_user.dart';
import 'package:fashionizt/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fashionizt/Widget/gridview_produk.dart';
import 'package:flutter/painting.dart';

class PreOrder extends StatelessWidget {
  const PreOrder({Key? key}) : super(key: key);

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
                    obscureText: true,
                    decoration: InputDecoration(
                       border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text('Kebutuhan Spesifikasi :', style: TextStyle(fontSize: 16 ,fontWeight: FontWeight.w600)),
                  const SizedBox(height: 5),
                  TextField(
                    maxLines: 1,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text('Biaya :', style: TextStyle(fontSize: 16 ,fontWeight: FontWeight.w600)),
                  const SizedBox(height: 5),
                  TextField(
                    maxLines: 1,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text('Lampiran :', style: TextStyle(fontSize: 16 ,fontWeight: FontWeight.w600)),
                  const SizedBox(height: 5),
                  TextField(
                    maxLines: 1,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Card(
                    color: blacksand,
                    elevation: 5,
                    child: Container(
                      height: 40,
                      child: InkWell(
                        splashColor: blush,
                        onTap: (){},
                        child: Center(
                          child: Text("Submit", style: TextStyle(fontSize: 15, color: blush),),
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
                                  Text("Budget :", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: blacksand))
                                ],
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                              children: [
                                Text("24-10-2022", style: TextStyle(fontSize: 12, color: Colors.grey)),
                                TextButton(
                                  onPressed: (){
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                          return DetailProjectUser();
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