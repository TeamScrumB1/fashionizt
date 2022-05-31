import 'package:fashionizt/Widget/bottom_navbar.dart';
import 'package:fashionizt/constants.dart';
import 'package:fashionizt/pages/edit_myprofile.dart';
import 'package:fashionizt/pages/login_screen.dart';
import 'package:fashionizt/pages/pre_order.dart';
import 'package:fashionizt/theme.dart';
import 'package:flutter/material.dart';
import 'package:fashionizt/pages/home_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:fashionizt/Widget/alert_dialog.dart';
import '../constants.dart';

class DetailProjectUser extends StatelessWidget {
  const DetailProjectUser({Key? key}) : super(key: key);

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
          'My Profile',
          style: titleApps,
        ),
        actions: <Widget>[
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Container(
              //     height: size.height*0.35,
              //     width: size.width*0.5,
              //     child: CircleAvatar(
              //       backgroundImage: AssetImage('lib/Assets/images/fashionizt.png'),
              //       // backgroundImage: CachedNetworkImageProvider(
              //       //     konveksi.imgProfil),
              //       radius: 90,
              //     )
              // ),
              Container(
                height: size.height * 0.02,
              ),
              Container(
                child: Text(
                  'Judul :',
                  //konveksi.nama,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              Container(
                height: size.height * 0.04,
                child: Text(
                  'Kaos Event',
                  //konveksi.nama,
                  style: const TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              Container(
                child: Text(
                  'Kebutuhan Spesifik : ',
                  //konveksi.nama,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              Container(
                height: size.height * 0.08,
                child: Text(
                  'Saya ingin kaos saya bisa dibuat acara formal dan juga informal',
                  //konveksi.nama,
                  style: const TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Desainer :",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600)
                      ),
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: AssetImage('lib/Assets/images/fashionizt.png'),
                            // backgroundImage: CachedNetworkImageProvider(
                            //     konveksi.imgProfil),
                            radius: 30,
                          ),
                          Column(
                            children: <Widget>[
                              Text(" Ivan Gunawan ",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600)
                              ),
                              FlatButton(
                                onPressed: (){},
                                child: Text('Accepted',
                                    style: TextStyle(
                                        color: Colors.green
                                    )
                                ),
                                textColor: blacksand,
                                shape: RoundedRectangleBorder(side: BorderSide(
                                    color: Colors.green,
                                    width: 1,
                                    style: BorderStyle.solid
                                ), borderRadius: BorderRadius.circular(50)),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Mitra Produksi :",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600)
                      ),
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: AssetImage('lib/Assets/images/fashionizt.png'),
                            // backgroundImage: CachedNetworkImageProvider(
                            //     konveksi.imgProfil),
                            radius: 30,
                          ),
                          Column(
                            children: <Widget>[
                              Text(" Ivan Gunawan ",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600)
                              ),
                              FlatButton(
                                onPressed: (){},
                                child: Text('Accepted',
                                    style: TextStyle(
                                        color: Colors.green
                                    )
                                ),
                                textColor: blacksand,
                                shape: RoundedRectangleBorder(side: BorderSide(
                                    color: Colors.green,
                                    width: 1,
                                    style: BorderStyle.solid
                                ), borderRadius: BorderRadius.circular(50)),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),

            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: blacksand,
        child: Icon(Icons.assignment,color: blush,),
        onPressed: (){
          Navigator.push((context),
              MaterialPageRoute(builder: (context){
                return PreOrder();
              })
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar2(),
    );
  }
}