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

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile>{
  @override
  String title = 'AlertDialog';
  bool tappedYes = false;

  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: blacksand,
        automaticallyImplyLeading: false,
       // leading: IconButton(
       //   icon: const Icon(Icons.arrow_back_ios_rounded),
       //   color: blush,
       //   onPressed: (){
       //     Navigator.pop(context);
       //   },
       // ),
        title: Text(
          'My Profile',
          style: titleApps,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              final action = await AlertDialogs.yesCancelDialog(context,'Logout','are you sure ?');
              if(action == DialogsAction.yes) {
                setState(() => tappedYes = true);
              } else {
                setState(() => tappedYes = false);
              }
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
              height: size.height*0.35,
              width: size.width*0.5,
              child: CircleAvatar(
                    backgroundImage: AssetImage('lib/Assets/images/fashionizt.png'),
                    // backgroundImage: CachedNetworkImageProvider(
                    //     konveksi.imgProfil),
                    radius: 90,
                  )
            ),
            Container(
              height: size.height * 0.001,
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    // height: size.height * 0.1,
                    child: Text(
                      "admin",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  Container(
                    // height: size.height * 0.1,
                    child: Text(
                      "082237808710",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  Container(
                    // height: size.height * 0.1,
                    child: Text(
                      "admin@gmail.com",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: size.height * 0.02,
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
                  primary: blush,
                  backgroundColor: blacksand,
                  shadowColor: Colors.black,
                  textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight:
                      FontWeight.w700,
                      fontFamily: 'Poppins'),
                ),
                onPressed: () {Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return EditMyProfile();
                    }));},
                child: Text('Edit Profile'),
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
    );
  }
}