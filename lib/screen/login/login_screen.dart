import 'dart:async';

import 'package:flutter/material.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/common/common.dart';

import 'login_controller.dart';

class LoginScreen extends BaseWidget<LoginController> {
  Future<void> loginFaebook() async {
    controller.loginFaceook();
  }

  void logiGoogle() {
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
                loginFaebook();
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
                        child: Text("Sign in with Facebook"))
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
                logiGoogle();
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
                        child: Text("Sign in with Google"))
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
