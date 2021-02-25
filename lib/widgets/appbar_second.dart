import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/app_localizations.dart';

Widget appbarSecond(name) {
  return Container(
    color: Colors.white,
    child: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Text(
            name,
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            padding: EdgeInsets.all(10.0),
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios_rounded),
          ),
        ),
      ],
    ),
  );
}
