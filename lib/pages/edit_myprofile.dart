import 'package:fashionizt/Widget/bottom_navbar.dart';
import 'package:fashionizt/constants.dart';
import 'package:fashionizt/pages/my_profile.dart';
import 'package:fashionizt/pages/pre_order.dart';
import 'package:fashionizt/theme.dart';
import 'package:flutter/material.dart';
import 'package:fashionizt/pages/home_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'dart:async';
import '../constants.dart';
import 'package:image_picker/image_picker.dart';

class EditMyProfile extends StatefulWidget {
  const EditMyProfile({Key? key}) : super(key: key);

  @override
  State<EditMyProfile> createState() => _EditMyProfileState();
}

class _EditMyProfileState extends State<EditMyProfile> {

    File? image;

    Future pickImage() async {
      try {
        final image = await ImagePicker().pickImage(source: ImageSource.gallery);

        if(image == null) return;

        final imageTemp = File(image.path);

        setState(() => this.image = imageTemp);
      } on PlatformException catch(e) {
        print('Failed to pick image: $e');
      }
    }

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
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Edit Profile',
            style: titleApps,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: size.height * 0.35,
                width: size.width * 0.5,
                child: Stack(
                  clipBehavior: Clip.none,
                  fit: StackFit.expand,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                          'lib/Assets/images/profil.jpg'),
                      // backgroundImage: CachedNetworkImageProvider(
                      //     konveksi.imgProfil),
                      radius: 90,
                    ),
                    Positioned(
                        bottom: MediaQuery
                            .of(context)
                            .size
                            .height * 0.05,
                        left: MediaQuery
                            .of(context)
                            .size
                            .width * 0.30,
                        // bottom: 0,
                        // right: -25,
                        child: RawMaterialButton(
                          onPressed: () {
                            pickImage();
                          },
                          elevation: 1.0,
                          fillColor: blacksand,
                          child: Icon(
                              Icons.camera_alt_outlined, color: Colors.white),
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
                      padding: EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15),
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15),
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
                height: size.height * 0.03,
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
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return MyBottomNavBar(
                              currentTab: 1, currentScreen: MyProfile());
                        }));
                  },
                  child:
                  Text('Save'),
                ),
              ),
            ],
          ),
        ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: blacksand,
//         child: Icon(Icons.assignment,color: blush,),
//         onPressed: (){
//           Navigator.push((context),
//               MaterialPageRoute(builder: (context){
//                 return PreOrder();
//               })
//           );
//         },
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: BottomNavBar2(),
      );
  }
}
