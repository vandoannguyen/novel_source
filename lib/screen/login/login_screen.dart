import 'package:flutter/material.dart';
import 'package:init_app/common/common.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                      Common.pathImg + "line.png",
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 30),
                      child: Text("Sign in with Line"))
                ],
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
