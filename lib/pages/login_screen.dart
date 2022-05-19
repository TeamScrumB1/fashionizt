import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashionizt/Models/desainer_model.dart';
import 'package:fashionizt/Models/konveksi_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:fashionizt/animation/animations.dart';
import 'package:fashionizt/pages/signup_screen.dart';
import '../constants.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final feature = ["Login", "Sign Up"];

  int i = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
            backgroundColor: blacksand,
            body: i == 0
                ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(25),
                        child: Column(
                          children: [

                            SizedBox(
                              height: 130,
                            ),

                            // Top Text
                            Container(
                              padding: EdgeInsets.only(left: 15),
                              width: width,
                              child: TopAnime(
                                1,
                                20,
                                curve: Curves.fastOutSlowIn,
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Login",
                                      style: TextStyle(
                                        color: blush,
                                        fontSize: 48,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(
                              height: height / 25,
                            ),

                            // TextFiled
                            Column(
                              children: [
                                Container(
                                  width: width / 1.2,
                                  height: height / 3.10,
                                  //  color: Colors.red,
                                  child: TopAnime(
                                    1,
                                    15,
                                    curve: Curves.easeInExpo,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        TextField(
                                          // readOnly: true, // * Just for Debug
                                          cursorColor: blush,
                                          style:
                                          TextStyle(color: blush),
                                          showCursor: true,
                                          //cursorColor: mainColor,
                                          decoration:
                                          kTextFiledInputDecoration, //ada di constant.dart
                                        ),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        TextField(
                                          // readOnly: true, // * Just for Debug
                                            cursorColor: blush,
                                            style: TextStyle(
                                                color: blush),
                                            showCursor: true,
                                            //cursorColor: mainColor,
                                            decoration:
                                            kTextFiledInputDecoration
                                                .copyWith(
                                                labelText:
                                                "Password")),

                                        SizedBox(
                                          height: 40,
                                        ),

                                        Row(
                                          children: <Widget> [
                                            Container(
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
                                                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, fontFamily: 'Poppins'),
                                                ),
                                                onPressed: () {},
                                                child: Text('Login'),
                                              ),
                                            )
                                          ], // <Widget>[]
                                        ),

                                        // SizedBox(
                                        //   height: 40,
                                        // ),
                                        //
                                        // Row(
                                        //   children: <Widget> [
                                        //     Container(
                                        //       width: width / 1.2,
                                        //       height: 37,
                                        //       child: TextButton(
                                        //         style: TextButton.styleFrom(
                                        //           shape: RoundedRectangleBorder(
                                        //             borderRadius: BorderRadius.circular(5.0),
                                        //           ),
                                        //           padding: const EdgeInsets.all(5.0),
                                        //           primary: blacksand,
                                        //           backgroundColor: blush,
                                        //           shadowColor: Colors.black,
                                        //           textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, fontFamily: 'Poppins'),
                                        //         ),
                                        //         onPressed: () {},
                                        //         child: Text('Login with Apple ID'),
                                        //       ),
                                        //     )
                                        //   ], // <Widget>[]
                                        // ),

                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
            )
                : LoginScreen()), //ntar sign up
      ),
    );
  }
}
