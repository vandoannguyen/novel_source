import 'package:flutter/material.dart';
import 'package:init_app/app_localizations.dart';

void showDialogLanguage(context, callback) {
  showDialog(
      context: context, builder: (_) => dialogLanguage(context, callback));
}

Widget dialogLanguage(context, callback) {
  return Dialog(
    child: Container(
      padding:EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Text(AppLocalizations.of(context).translate("choose language"),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w800))),
          GestureDetector(
            onTap: () {
              callback("vi");
              Navigator.pop(context);
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
              child: Text("Vietnamese", style: textStyle()),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              callback("th");
              Navigator.pop(context);
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Text("Thailand", style: textStyle()),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              callback("id");
              Navigator.pop(context);
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Text("Bahasa Indonesia", style: textStyle()),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    ),
  );
}

textStyle() {
  return TextStyle(fontSize: 15, color: Colors.black);
}
