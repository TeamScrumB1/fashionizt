import 'package:fashionizt/Widget/bottom_navbar.dart';
import 'package:fashionizt/constants.dart';
import 'package:fashionizt/pages/my_profile.dart';
import 'package:fashionizt/pages/pre_order.dart';
import 'package:fashionizt/theme.dart';
import 'package:flutter/material.dart';
import 'package:fashionizt/pages/home_pages.dart';
import 'package:flutter/cupertino.dart';
import '../constants.dart';

class EditMyProfile extends StatelessWidget {
  const EditMyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBody: true,
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
          'Edit My Profile',
          style: titleApps,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: size.height*0.35,
              width: size.width*0.5,
              child: Stack(
              clipBehavior: Clip.none,
              fit: StackFit.expand,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('lib/Assets/images/fashionizt.png'),
                  // backgroundImage: CachedNetworkImageProvider(
                  //     konveksi.imgProfil),
                  radius: 90,
                ),
                Positioned(
                    bottom: MediaQuery.of(context).size.height * 0.05,
                    left: MediaQuery.of(context).size.width * 0.30,
                    // bottom: 0,
                    // right: -25,
                    child: RawMaterialButton(
                      onPressed: () {},
                      elevation: 1.0,
                      fillColor: blacksand,
                      child: Icon(Icons.camera_alt_outlined, color: Colors.white),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    )),
              ],
            ),
          ),
            Container(
              height: size.height * 0.001,
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    // height: size.height * 0.1,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          TextField(
                            // readOnly: true, // * Just for Debug
                              cursorColor: blacksand,
                              style: TextStyle(color: blacksand),
                              showCursor: true,
                              //cursorColor: mainColor,
                              decoration:
                              TextFiledInputDecorationProfile.copyWith(
                                  labelText: "Full Name :")
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                          ),
                          TextField(
                            // readOnly: true, // * Just for Debug
                              cursorColor: blacksand,
                              style: TextStyle(color: blacksand),
                              showCursor: true,
                              //cursorColor: mainColor,
                              decoration:
                              TextFiledInputDecorationProfile.copyWith(
                                  labelText: " Phone :")
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                          ),
                          TextField(
                            // readOnly: true, // * Just for Debug
                              cursorColor: blacksand,
                              style: TextStyle(color: blacksand),
                              showCursor: true,
                              //cursorColor: mainColor,
                              decoration:
                              TextFiledInputDecorationProfile.copyWith(
                                  labelText: " Email :")
                          ),
                        ]
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: size.height * 0.08,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 1),
              width: width / 1.2,
              height: 37,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  padding: const EdgeInsets.all(5.0),
                  primary: blacksand,
                  backgroundColor: blush,
                  shadowColor: Colors.black,
                  textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight:
                      FontWeight.w700,
                      fontFamily: 'Poppins'),
                ),
                onPressed: () {Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                       return MyProfile();
                    }));},
                child:
                Text('Save'),
              ),
            ),
            // Container(
            //   child: Column(
            //     children: <Widget>[
            //       Container(
            //         // height: size.height * 0.1,
            //         // child: Text(
            //         //   konveksi.nama,
            //         //   textAlign: TextAlign.center,
            //         //   style: const TextStyle(
            //         //     fontSize: 20.0,
            //         //     fontWeight: FontWeight.w500,
            //         //     fontFamily: 'Poppins',
            //         //   ),
            //         // ),
            //       ),
            //       Container(
            //         // height: size.height * 0.1,
            //         // child: Text(
            //         //   konveksi.bio,
            //         //   textAlign: TextAlign.center,
            //         //   style: const TextStyle(
            //         //     fontSize: 14.0,
            //         //     fontWeight: FontWeight.w300,
            //         //     fontFamily: 'Poppins',
            //         //   ),
            //         // ),
            //       ),
            //     ],
            //   ),
            // ),
            // Container(
            //   // height: size.height*0.1,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: <Widget>[
            //       Row(
            //         children: <Widget> [
            //           // const Icon(Icons.star_border, color: Colors.black),
            //           // Text(
            //           //     konveksi.rating + '/5 ',
            //           //     style: const TextStyle(
            //           //       fontSize: 14.0,
            //           //       fontWeight: FontWeight.w300,
            //           //       fontFamily: 'Poppins',
            //           //     )
            //           // ),
            //           Container(
            //             width: size.width*0.08,
            //           ),
            //           Row(
            //             children: <Widget> [
            //               // const Icon(Icons.task_outlined, color: Colors.black),
            //               // Text(
            //               //   konveksi.jmlhProject + ' ',
            //               //   style: const TextStyle(
            //               //     fontSize: 14.0,
            //               //     fontWeight: FontWeight.w300,
            //               //     fontFamily: 'Poppins',
            //               //   ),
            //               // ),
            //             ], // <Widget>[]
            //           ),
            //           Container(
            //             width: size.width*0.08,
            //           ),
            //           Row(
            //             children: <Widget> [
            //               // ElevatedButton(
            //               //   child: Row(
            //               //     mainAxisAlignment: MainAxisAlignment.center,
            //               //     children: const <Widget>[
            //               //       Icon(
            //               //           Icons.chat_outlined,
            //               //           size: 20.0), // <-- Icon
            //               //       Text(' Chat ',
            //               //         style: TextStyle(
            //               //           fontSize: 14.0,
            //               //           fontWeight: FontWeight.w300,
            //               //           fontFamily: 'Poppins',
            //               //         ),
            //               //       ),
            //               //     ],
            //               //   ),
            //               //   style: ButtonStyle(
            //               //     backgroundColor: MaterialStateProperty.all<Color>(blacksand),
            //               //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            //               //       RoundedRectangleBorder(
            //               //           borderRadius: BorderRadius.circular(10),
            //               //           side: BorderSide(color: blacksand)
            //               //       ),
            //               //     ),
            //               //   ),
            //               //   onPressed: () => _launchURL(konveksi.linkWa),
            //               // ),
            //             ], // <Widget>[]
            //           ),
            //         ], // <Widget>[]
            //       ),
            //       Container(
            //         height: size.height * 0.10,
            //       ),
            //     ],
            //   ),
            // ),
          ],
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
