import 'package:fashionizt/Data/db_helper_user.dart';
import 'package:fashionizt/Models/User.dart';
import 'package:fashionizt/Widget/gridview_feeds.dart';
import 'package:fashionizt/constants.dart';
import 'package:fashionizt/pages/edit_myprofile_deskonv.dart';
import 'package:fashionizt/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fashionizt/Widget/alert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';
import '../shared_preferences.dart';

class MyProfileDesKonv extends StatefulWidget {
  @override
  _MyProfileDesKonvState createState() => _MyProfileDesKonvState();
}

class _MyProfileDesKonvState extends State<MyProfileDesKonv>{
  final PrefService _prefService = PrefService();
  late String username = '';
  String title = 'AlertDialog';
  bool tappedYes = false;
  DbHelperUser db = DbHelperUser();
  List<UserList> listUser = [];
  int i = 0;

  @override
  void initState() {
    _getUser();
    super.initState();
    initial();
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
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  height: size.height * 0.20,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image:
                        AssetImage('lib/Assets/images/cover.jpg'),
                        // data image dari konveksi
                        // CachedNetworkImageProvider(
                        //     konveksi.imgProfil),
                        fit: BoxFit.fill,
                      ),
                      // boxShadow: [new BoxShadow(color: Colors.black, blurRadius: 8.0)],
                      color: Colors.white),
                ),
                Positioned(
                    top: MediaQuery.of(context).size.height * 0.09,
                    left: MediaQuery.of(context).size.width * 0.25,
                    right: MediaQuery.of(context).size.width * 0.25,
                    child: CircleAvatar(
                      radius: 88,
                      backgroundColor: Color(0xFFFFFFFF),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('lib/Assets/images/profil.jpg'),
                        // backgroundImage: CachedNetworkImageProvider(
                        //     konveksi.imgProfil),
                        radius: 80,
                      ),
                    )
                ),
              ],
            ),
            Container(
              height: size.height * 0.14,
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    // height: size.height * 0.1,
                    child: Text(
                    listUser.length == 1 ?  listUser[i].Username : 'Customer'+listUser.length.toString(),
                      // "admin",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 1, bottom: 1, right: 7, left: 7),
                    margin: EdgeInsets.only(bottom: 5, top: 5),
                    decoration: BoxDecoration(
                      //color: blush,
                      border: Border.all(color: blacksand),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    // height: size.height * 0.1,
                    child: Text(
                      listUser.length == 1 ? listUser[i].Level : '',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: blacksand,
                        fontSize: 12.0,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  Container(
                    // height: size.height * 0.1,
                    child: Text(
                      listUser.length == 1 ? listUser[i].Email : 'customer@fashionizt.com',
                      // user.email,
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
              margin: EdgeInsets.only(bottom: 15),
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
                      return EditMyProfileDesKonv();
                    }));},
                child: Text('Edit Profile'),
              ),
            ),
            Container(
              child: GridViewFeeds(),
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