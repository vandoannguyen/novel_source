import 'package:flutter/material.dart';
import 'package:init_app/app_localizations.dart';

void showDialogNotEnough(context, callback) {
  showDialog(
      context: context, builder: (_) => dialogNotEnoughCoin(context, callback));
}

Widget dialogNotEnoughCoin(context, callback) {
  return Dialog(
    child: Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              padding: EdgeInsets.all(10),
              child: Text("${AppLocalizations.of(context).translate("Not enough coin")}!",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w800))),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
            child: Text("${AppLocalizations.of(context).translate("Do you want to get more")}?", style: textStyle()),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    callback(false);
                  },
                  child: Container(
                    height: 40,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                    child: Text(AppLocalizations.of(context).translate("No"), style: textStyle()),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    callback(true);
                  },
                  child: Container(
                    height: 40,
                    alignment: Alignment.center,
                    color: Colors.transparent,
                    padding: EdgeInsets.all(10),
                    child: Text(AppLocalizations.of(context).translate("Yes"),
                        style: TextStyle(fontSize: 15, color: Colors.red)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

textStyle() {
  return TextStyle(fontSize: 15, color: Colors.black);
}
