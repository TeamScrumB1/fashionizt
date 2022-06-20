import 'package:fashionizt/Data/db_helper_user.dart';
import 'package:fashionizt/Models/User.dart';
import 'package:fashionizt/constants.dart';
import 'package:fashionizt/pages/edit_myprofile.dart';
import 'package:fashionizt/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fashionizt/Widget/alert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';
import '../shared_preferences.dart';
import 'package:http/http.dart' as http;

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile>{
  final PrefService _prefService = PrefService();
  late String username = '';
  String title = 'AlertDialog';
  bool tappedYes = false;
  List<UserList> listUser = [];
  int i = 0;
  DbHelperUser db = DbHelperUser();

  @override
  void initState() {
    _getUser();
    super.initState();
    initial();
    // _user = ApiServiceUs().topHeadlines();
  }

  void initial() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    setState(() {
      username = _preferences.getString("username")!;
    });
  }

  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
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
                setState(() {
                  // _deleteUser(listUser.length-1);
                  tappedYes = true;
                });
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
                    backgroundImage: AssetImage('lib/Assets/images/profil.jpg'),
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
                      listUser.length == 1 ?  listUser[i].Username +listUser.length.toString() : 'Customer'+listUser.length.toString(),
                      // "admin",
                      // listUser[0].Nama,
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
                      listUser.length == 1 ? listUser[i].Email : 'customer@fashionizt.com',
                      // user.email,
                      // listUser[0].Email,
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
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return EditMyProfile();
                    }));},
                child: Text('Edit Profile'),
              ),
            ),
          ],
        ),
      ),
    );
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