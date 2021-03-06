import 'dart:async';

import 'package:flutter/material.dart';
import 'package:init_app/app_localizations.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/common/common.dart';

import 'login_controller.dart';

// ignore: must_be_immutable
class LoginScreen extends BaseWidget<LoginController> {
  static const String routeName = "/login";
  Future<void> loginFacebook() async {
    controller.loginFacebook();
  }

  void loginGoogle() {
    controller.loginGoogle();
  }

  @override
  Widget build(BuildContext context, {controllerSuper}) {
    super.build(context, controllerSuper: LoginController());
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
            GestureDetector(
              onTap: () {
                loginFacebook();
              },
              child: Container(
                margin: EdgeInsets.only(left: 30, right: 30, bottom: 10),
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: [
                      BoxShadow(color: Colors.grey, spreadRadius: 1)
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          left: 20, top: 5, right: 5, bottom: 5),
                      child: Image.asset(
                        Common.pathImg + "facebook.png",
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 30),
                        child: Text("${AppLocalizations.of(context).translate("Sign in with")} Facebook"))
                  ],
                ),
              ),
            ),
            // Container(
            //   margin: EdgeInsets.only(left: 30, right: 30, bottom: 10),
            //   height: 50,
            //   decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(32),
            //       boxShadow: [BoxShadow(color: Colors.grey, spreadRadius: 1)]),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: <Widget>[
            //       Container(
            //         margin:
            //             EdgeInsets.only(left: 20, top: 5, right: 5, bottom: 5),
            //         child: Image.asset(
            //           Common.pathImg + "line.png",
            //         ),
            //       ),
            //       Container(
            //           margin: EdgeInsets.only(left: 30),
            //           child: Text("Sign in with Line"))
            //     ],
            //   ),
            // ),
            GestureDetector(
              onTap: () {
                loginGoogle();
              },
              child: Container(
                margin: EdgeInsets.only(left: 30, right: 30, bottom: 10),
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: [
                      BoxShadow(color: Colors.grey, spreadRadius: 1)
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          left: 20, top: 5, right: 5, bottom: 5),
                      child: Image.asset(
                        Common.pathImg + "google_plus.png",
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 30),
                        child: Text("${AppLocalizations.of(context).translate("Sign in with")} Google"))
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 80),
              child: Text("Copyright @2021",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[400])),
            ),
          ],
        ),
      ),
    );
  }
}
