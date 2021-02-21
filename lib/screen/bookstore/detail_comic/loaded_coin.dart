import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:init_app/common/common.dart';

class LoadedCoin extends StatefulWidget {
  LoadedCoin({Key key}) : super(key: key);

  @override
  _LoadedCoinState createState() => _LoadedCoinState();
}

class _LoadedCoinState extends State<LoadedCoin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 120,
                child: Image.asset(
                  Common.pathImg + "ic_user.png",
                  height: 100,
                  width: 100,
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter your number",
                    hintStyle: TextStyle(color: Colors.pink[200]),
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(32.0),
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ], // Only numbers can be entered
                ),
              ),
              // ),
              Container(
                height: 40,
                width: 100,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Center(
                  child: Text(
                    "Nap Xu",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "Thuong moi lan thay ban be nap xu thanh cong, ban duoc thuong 20% so xu nap",
                  style: TextStyle(color: Colors.pink),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Huong dan thay ban nap xu:",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      "1. Xin ban nhap vao ID cua ban be",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      "2. Xin ban xac nhan ID va Ten cua ban be",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      "3. Xac nhan xong xin ban bam nut nap xu giup ban be hoan thanh nap xu",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
