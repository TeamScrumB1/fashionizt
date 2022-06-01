// import 'package:fashionizt/constants.dart';
// import 'package:fashionizt/pages/home_pages.dart';
// import 'package:fashionizt/pages/my_profile.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../Api/api_short_desainer.dart';
//
// class BottomNavBar extends StatelessWidget {
//   const BottomNavBar({Key? key}) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       elevation: 10,
//       shape: CircularNotchedRectangle(),
//       notchMargin: 4,
//       child: Container(
//         height: 60,
//         margin: EdgeInsets.symmetric(horizontal: 20),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 MaterialButton(
//                   minWidth: 40,
//                   onPressed: (){},
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Icon(
//                         Icons.home_filled,
//                         color: blacksand,
//                       ),
//                       Text(
//                         'Beranda',
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           color: blacksand,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Container(
//               margin: EdgeInsets.only(top: 25,right: 25),
//               child: Text(
//                 'Pre Order',
//                 style: TextStyle(
//                   fontFamily: 'Poppins',
//                   color: blacksand,
//                 ),
//               ),
//             ),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 MaterialButton(
//                   minWidth: 40,
//                   onPressed: (){
//                     Navigator.push((context),
//                         MaterialPageRoute(builder: (context){
//                           return MyProfile();
//                         })
//                     );
//                   },
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Icon(
//                         Icons.account_circle,
//                         color: Colors.grey,
//                       ),
//                       Text(
//                         'Profil',
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           color: Colors.grey,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class BottomNavBar2 extends StatelessWidget {
//   const BottomNavBar2({Key? key}) : super(key: key);
//
//   get username => null;
//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       elevation: 10,
//       shape: CircularNotchedRectangle(),
//       notchMargin: 4,
//       child: Container(
//         height: 60,
//         margin: EdgeInsets.symmetric(horizontal: 20),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 MaterialButton(
//                   minWidth: 40,
//                   onPressed: (){
//                     Navigator.pop((context),
//                         MaterialPageRoute(builder: (context){
//                           return HomePages(username: username);
//                         })
//                     );
//                   },
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Icon(
//                         Icons.home_filled,
//                         color: Colors.grey,
//                       ),
//                       Text(
//                         'Beranda',
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           color: Colors.grey,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Container(
//               margin: EdgeInsets.only(top: 25,right: 25),
//               child: Text(
//                 'Pre Order',
//                 style: TextStyle(
//                   fontFamily: 'Poppins',
//                   color: blacksand,
//                 ),
//               ),
//             ),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 MaterialButton(
//                   minWidth: 40,
//                   onPressed: (){},
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Icon(
//                         Icons.account_circle,
//                         color: blacksand,
//                       ),
//                       Text(
//                         'Profil',
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           color: blacksand,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:fashionizt/constants.dart';
import 'package:fashionizt/pages/home_pages.dart';
import 'package:fashionizt/pages/my_profile.dart';
import 'package:fashionizt/pages/pre_order.dart';
import 'package:flutter/material.dart';

class MyBottomNavBar extends StatefulWidget {
  MyBottomNavBar({Key? key,required this.currentTab,required this.currentScreen}) : super(key: key);
  int currentTab;
  Widget currentScreen;
  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState(currentTab: currentTab,currentScreen: currentScreen);
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  _MyBottomNavBarState({required this.currentTab,required this.currentScreen});
  int currentTab;
  Widget currentScreen;
  final List<Widget> screens = [
    HomePages(),
    MyProfile(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: blacksand,
        child: Icon(Icons.assignment,color: blush),
        onPressed: (){
          Navigator.push((context),
              MaterialPageRoute(builder: (context){
                return PreOrder();
              })
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: (){
                      setState(() {
                        currentScreen = HomePages();
                        currentTab = 0;
                      });
                    },
                    minWidth: 40,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          color: currentTab == 0 ? blacksand : Colors.grey,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            color: currentTab == 0? blacksand : Colors.grey,
                            fontFamily: 'Poppins',
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 25),
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
                children: [
                  MaterialButton(
                    onPressed: (){
                      setState(() {
                        currentScreen = MyProfile();
                        currentTab = 1;
                      });
                    },
                    minWidth: 40,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.account_circle,
                          color: currentTab == 1 ? blacksand : Colors.grey,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: currentTab == 1? blacksand : Colors.grey,
                            fontFamily: 'Poppins',
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
      ),
    );
  }
}