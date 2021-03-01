import 'package:flutter/material.dart';

void showDialogNotEnough(context, callback) {
  showDialog(
      context: context, builder: (_) => dialogNotEnoughCoin(context, callback));
}

Widget dialogNotEnoughCoin(context, callback) {
  return Dialog(
    child: Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Text("Not enough coin!",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w800))),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
            child: Text("Do you want to get more?", style: textStyle()),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    callback(false);
                  },
                  child: Container(
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                    child: Text("No", style: textStyle()),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    callback(true);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.transparent,
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    child: Text("Yes",
                        style: TextStyle(fontSize: 15, color: Colors.red)),
                  ),
                ),
              ],
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
