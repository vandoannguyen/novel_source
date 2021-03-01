import 'package:flutter/material.dart';

void showDialogConfirmBuyChapter(context, coin, {callback}) {
  showDialog(
      context: context,
      builder: (_) => dialogConfirmBuyChap(_, coin, callback: callback));
}

dialogConfirmBuyChap(context, coin, {callback}) {
  return Dialog(
    child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.centerLeft,
            child: Text("Read this chapter with $coin coins?",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w500)),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    callback(false);
                  },
                  child: Container(
                    width: 100,
                    color: Colors.transparent,
                    height: 40,
                    alignment: Alignment.center,
                    child: Text("No"),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    callback(true);
                  },
                  child: Container(
                    width: 100,
                    color: Colors.transparent,
                    height: 40,
                    alignment: Alignment.center,
                    child: Text(
                      "Yes",
                      style: TextStyle(color: Colors.red),
                    ),
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
