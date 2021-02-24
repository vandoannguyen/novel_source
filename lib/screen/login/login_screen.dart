import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:init_app/common/common.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_line_login/flutter_line_login.dart';
class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _flutterLineLogin = new FlutterLineLogin();
  @override
  void initState() {
    super.initState();
  }

  String _message = '';

  set message(String value) {
    setState(() {
      _message = value;
    });
  }

  void _onLoginSuccess(Object data) {
    message = 'LoginSuccess: ${data}.';
  }

  void _onLoginError(Object error) {
    message = 'LoginError: ${error}.';
  }

  Future<Null> _startLogin() async {
    await _flutterLineLogin.startLogin(_onLoginSuccess, _onLoginError);
  }

  Future<Null> _startWebLogin() async {
    await _flutterLineLogin.startWebLogin(_onLoginSuccess, _onLoginError);
  }

  Future<Null> _logout() async {
    try {
      await _flutterLineLogin.logout();
      message = 'Logout:';
    } on PlatformException catch (e) {
      message = 'Logout: ${e}.';
    }
  }

  Future<Null> _getProfile() async {
    try {
      var profile = await _flutterLineLogin.getProfile();
      message = 'Profile: ${profile}.';
    } on PlatformException catch (e) {
      message = 'Profile: ${e}.';
    }
  }

  Future<Null> _currentAccessToken() async {
    var accessToken = await _flutterLineLogin.currentAccessToken();
    message = 'CurrentAccessToken: ${accessToken}.';
  }

  Future<Null> _verifyToken() async {
    try {
      var result = await _flutterLineLogin.verifyToken();
      message = 'VerifyToken: ${result}.';
    } on PlatformException catch (e) {
      message = 'VerifyToken: ${e}.';
    }
  }

  Future<Null> _refreshToken() async {
    try {
      var result = await _flutterLineLogin.refreshToken();
      message = 'RefreshToken: ${result}.';
    } on PlatformException catch (e) {
      message = 'RefreshToken: ${e}.';
    }
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: height * 0.5,
              child: Image.asset(
                Common.pathImg + "ic_user.png",
                height: 100,
                width: 100,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 10),
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [BoxShadow(color: Colors.grey, spreadRadius: 1)]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin:
                        EdgeInsets.only(left: 20, top: 5, right: 5, bottom: 5),
                    child: Image.asset(
                      Common.pathImg + "facebook.png",
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 30),
                      child: Text("Sign in with Facebook"))
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                _startLogin();
              },
              child: Container(
                margin: EdgeInsets.only(left: 30, right: 30, bottom: 10),
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: [BoxShadow(color: Colors.grey, spreadRadius: 1)]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin:
                          EdgeInsets.only(left: 20, top: 5, right: 5, bottom: 5),
                      child: Image.asset(
                        Common.pathImg + "line.png",
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 30),
                        child: Text("Sign in with Line"))
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 10),
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [BoxShadow(color: Colors.grey, spreadRadius: 1)]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin:
                        EdgeInsets.only(left: 20, top: 5, right: 5, bottom: 5),
                    child: Image.asset(
                      Common.pathImg + "google_plus.png",
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 30),
                      child: Text("Sign in with Google"))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 80),
              child: Text("Copyright @2021 HiRead",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[400])),
            ),
          ],
        ),
      ),
    );
  }
}
