import 'package:fashionizt/Data/db_helper_user.dart';
import 'package:fashionizt/Models/User.dart';
import 'package:fashionizt/Widget/bottom_navbar.dart';
import 'package:fashionizt/Widget/bottom_navbar_deskonv.dart';
import 'package:fashionizt/constants.dart';
import 'package:fashionizt/pages/my_profile.dart';
// import 'package:fashionizt/pages/pre_order.dart';
import 'package:fashionizt/theme.dart';
import 'package:flutter/material.dart';
// import 'package:fashionizt/pages/home_pages.dart';
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
    final username = new TextEditingController();
    final email = new TextEditingController();
    GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
    DbHelperUser db = DbHelperUser();
    List<UserList> listUser = [];

    @override
    void initState(){
      _getUser();
      super.initState();
    }

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
          'Edit Profile',
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
                  backgroundImage: AssetImage('lib/Assets/images/profil.jpg'),
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
                      onPressed: () {
                        pickImage();
                      },
                      elevation: 1.0,
                      fillColor: blacksand,
                      child: Icon(Icons.camera_alt_outlined, color: Colors.white),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    )
                ),
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
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        key: globalFormKey,
                        children: [
                          TextFormField(
                            // readOnly: true, // * Just for Debug
                              controller: username,
                              cursorColor: blacksand,
                              style: TextStyle(color: blacksand),
                              showCursor: true,
                              //cursorColor: mainColor,
                              keyboardType: TextInputType.text,
                              decoration:
                              TextFiledInputDecorationProfile.copyWith(
                                  labelText: "Username :")
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
                                  labelText: "Password :")
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                          ),
                          TextFormField(
                            // readOnly: true, // * Just for Debug
                              controller: email,
                              cursorColor: blacksand,
                              style: TextStyle(color: blacksand),
                              showCursor: true,
                              //cursorColor: mainColor,
                              keyboardType: TextInputType.text,
                              decoration:
                              TextFiledInputDecorationProfile.copyWith(
                                  labelText: "Email :")
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
                  setState(() {
                    updateUser();
                  });
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      if(listUser[0].Level == "customer")
                        return MyBottomNavBar(currentTab: 1,currentScreen: MyProfile());
                      else
                        return MyBottomNavBarPro(currentTab: 1,currentScreen: MyProfile());
                    })
                  );
                  },
                child:
                Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> updateUser() async{
      print('Update User');
      await db.updateUser(UserList.fromMap({
        'Id' : listUser[0].id,
        'IDUser' : listUser[0].IDUser,
        'Username' : username.text,
        'Email' : email.text,
        'Level' : listUser[0].Level,
      }));
  }
  Future<void> _getUser() async{
      var list = await db.getUser();
      listUser.clear();
      setState(() {
        list!.forEach((user) {
          listUser.add(UserList.fromMap(user));
        });
      });
  }
}
