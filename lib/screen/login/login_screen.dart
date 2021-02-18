import 'package:flutter/material.dart';

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
              child: Center(
                  child: Container(
                height: 100,
                width: 100,
                color: Colors.black,
              )),
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
                      margin: EdgeInsets.only(left: 20),
                      child: Icon(Icons.ac_unit)),
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
                      margin: EdgeInsets.only(left: 20),
                      child: Icon(Icons.ac_unit)),
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
                      margin: EdgeInsets.only(left: 20),
                      child: Icon(Icons.ac_unit)),
                  Container(
                      margin: EdgeInsets.only(left: 30),
                      child: Text("Sign in with Google"))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
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
