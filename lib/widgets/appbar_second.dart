import 'package:flutter/material.dart';

Widget appbarSecond(name, context, {isChangedLanguage}) {
  return Container(
    color: Colors.white,
    child: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Text(
            name,
            style: TextStyle(fontSize: 18.0),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            padding: EdgeInsets.all(10.0),
            onPressed: () {
              if (isChangedLanguage != null)
                Navigator.pop(context, isChangedLanguage);
              else
                Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_rounded),
          ),
        ),
      ],
    ),
  );
}
