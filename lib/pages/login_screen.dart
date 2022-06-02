import 'dart:convert';
import 'package:fashionizt/Widget/bottom_navbar.dart';
import 'package:fashionizt/pages/home_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fashionizt/animation/animations.dart';
import 'package:fashionizt/pages/signup_screen.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String username = '';

  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  //api login
  Future login() async {
    final response = await http.post(Uri.parse("https://fashionizt.yufagency.com/login.php"), body: {
      "username": user.text,
      "password": pass.text,
    });

    var datauser = json.decode(response.body);

    if (datauser == "Success") {
      Fluttertoast.showToast(
        msg: "Login Successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black.withOpacity(0.2),
        fontSize: 15,
        textColor: blush,
      );
      Navigator.push(context, MaterialPageRoute(builder: (context)=> MyBottomNavBar(currentTab: 0,currentScreen: HomePages()),),);
    } else {
      Fluttertoast.showToast(
        msg: "Username or Password Incorrect",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black.withOpacity(0.2),
        fontSize: 15,
        textColor: blush,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
              backgroundColor: blacksand,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      // height: size.height * 0.1,
                      child: Column(
                        children: [
                          Container(
                            // height: size.height*0.08,
                            height: size.height * 0.1,
                          ), // Top Text
                          Container(
                            height: size.height * 0.12,
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
                          Container(
                            height: size.height * 0.03,
                          ),
                          //TextFiled
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  key: globalFormKey,
                                  children: [
                                    TextFormField(
                                      controller: user,
                                      cursorColor: blush,
                                      style: TextStyle(color: blush),
                                      showCursor: true,
                                      keyboardType: TextInputType.text,
                                      decoration:
                                      kTextFiledInputDecoration, //ada di constant.dart
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                    ),
                                    TextFormField(
                                      controller: pass,
                                      cursorColor: blush,
                                      style: TextStyle(color: blush),
                                      showCursor: true,
                                      //cursorColor: mainColor,
                                      keyboardType: TextInputType.text,
                                      onSaved: (input) => pass = input! as TextEditingController,
                                      validator: (input) => (input?.length ?? 0) < 3
                                          ? "Password should be more than 3 characters"
                                          : null,
                                      obscureText: hidePassword,
                                      decoration: InputDecoration(
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: blush),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: blush, width: 2),
                                        ),
                                        labelText: "Password",
                                        labelStyle:
                                        TextStyle(color: blush, fontSize: 18, fontWeight: FontWeight.w700),
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              hidePassword = !hidePassword;
                                            });
                                            },
                                            color: blush.withOpacity(0.4),
                                          icon: Icon(hidePassword
                                              ? Icons.visibility_off
                                              : Icons.visibility),
                                        ),
                                      ),
                                    ),

                                    Container(
                                      height: size.height * 0.05,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
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
                                            onPressed: () {
                                              login();
                                            },
                                            child: Text('Login'),
                                          ),
                                        )
                                      ], // <Widget>[]
                                    ),
                                    Container(
                                      height: size.height * 0.02,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Expanded(
                                          child: Divider(
                                            color: blush,
                                            height: 1.5,
                                          ),
                                        ),
                                        Text(
                                          "OR  ",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: blush,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Expanded(
                                          child: Divider(
                                            color: blush,
                                            height: 1.5,
                                          ),
                                        ),
                                      ], // <Widget>[]
                                    ),
                                    Container(
                                      height: size.height * 0.02,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 1,),
                                          width: width / 1.2,
                                          height: 37,
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                              side: (
                                                  BorderSide(
                                                      width: 1, color: blush)),
                                              padding: const EdgeInsets.all(5.0),
                                              primary: blush,
                                              // backgroundColor: blush,
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
                                                    return LoginScreen();
                                                  }));
                                            },
                                            child:
                                            Text('Login as Designer'),
                                          ),
                                        )
                                      ], // <Widget>[]
                                    ),
                                    Container(
                                      height: size.height * 0.03,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 1,),
                                          width: width / 1.2,
                                          height: 37,
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                              side: (
                                                  BorderSide(
                                                      width: 1, color: blush)),
                                              padding: const EdgeInsets.all(5.0),
                                              primary: blush,
                                              // backgroundColor: blush,
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
                                                    return LoginScreen();
                                                  }));
                                            },
                                            child: Text(
                                                'Login as Mitra Produksi'),
                                          ),
                                        )
                                      ], // <Widget>[]
                                    ),
                                    Container(
                                      height: size.height*0.12,
                                      // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text("Don't have an Account ?",
                                          style: TextStyle(color: blush),
                                        ),
                                        GestureDetector(
                                          onTap: (){
                                            Navigator.push(context,
                                                MaterialPageRoute(builder: (context) {
                                                  return SignUpScreen();
                                                }));
                                          },
                                          child: Text(
                                            " Sign Up",
                                            style: TextStyle(
                                                color: blush,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        )
                                      ], // <Widget>[]
                                    ),
                                  ],
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
          )
      ),
    );
  }

  // bool validateAndSave() {
  //   final form = globalFormKey.currentState;
  //   if (form.validate()) {
  //     form.save();
  //     return true;
  //   }
  //   return false;
  // }
}
