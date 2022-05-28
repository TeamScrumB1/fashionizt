import 'package:fashionizt/constants.dart';
import 'package:fashionizt/pages/home_pages.dart';
import 'package:fashionizt/pages/my_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Api/api_short_desainer.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 10,
      shape: CircularNotchedRectangle(),
      notchMargin: 4,
      child: Container(
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MaterialButton(
                  minWidth: 40,
                  onPressed: (){},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.home_filled,
                        color: blacksand,
                      ),
                      Text(
                        'Beranda',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: blacksand,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 25,right: 25),
              child: Text(
                'Pre Order',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: blacksand,
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MaterialButton(
                  minWidth: 40,
                  onPressed: (){
                    Navigator.push((context),
                        MaterialPageRoute(builder: (context){
                          return MyProfile();
                        })
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.account_circle,
                        color: Colors.grey,
                      ),
                      Text(
                        'Profil',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavBar2 extends StatelessWidget {
  const BottomNavBar2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 10,
      shape: CircularNotchedRectangle(),
      notchMargin: 4,
      child: Container(
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MaterialButton(
                  minWidth: 40,
                  onPressed: (){
                    Navigator.pop((context),
                        MaterialPageRoute(builder: (context){
                          return HomePages();
                        })
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.home_filled,
                        color: Colors.grey,
                      ),
                      Text(
                        'Beranda',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 25,right: 25),
              child: Text(
                'Pre Order',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: blacksand,
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MaterialButton(
                  minWidth: 40,
                  onPressed: (){},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.account_circle,
                        color: blacksand,
                      ),
                      Text(
                        'Profil',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: blacksand,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
