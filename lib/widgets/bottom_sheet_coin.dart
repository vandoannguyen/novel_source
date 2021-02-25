import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:init_app/common/common.dart';

void onDialogBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (_) => dialogReward(context)
  );
}
Widget dialogReward(BuildContext context){
  return Container(
    height: 200,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: (){
            Fluttertoast.showToast(msg: "-15 coin", toastLength: Toast.LENGTH_SHORT, textColor: Colors.white, backgroundColor: Colors.grey, gravity: ToastGravity.CENTER);
            Navigator.pop(context);
          },
          child: Container(
            height: 49,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Common.pathImg + "ic_coin.png",
                  width: 18.0,
                  height: 18.0,
                ),
                Text(
                  "15",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        Divider(
          height: 1,
          color: Colors.grey[400],
        ),
        GestureDetector(
          onTap: (){
            Fluttertoast.showToast(msg: "-50 coin", toastLength: Toast.LENGTH_SHORT, textColor: Colors.white, backgroundColor: Colors.grey, gravity: ToastGravity.CENTER);
            Navigator.pop(context);
          },
          child: Container(
            height: 49,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Common.pathImg + "ic_coin.png",
                  width: 18.0,
                  height: 18.0,
                ),
                Text(
                  "50",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        Divider(
          height: 1,
          color: Colors.grey[400],
        ),
        GestureDetector(
          onTap: (){
            Fluttertoast.showToast(msg: "-150 coin", toastLength: Toast.LENGTH_SHORT, textColor: Colors.white, backgroundColor: Colors.grey, gravity: ToastGravity.CENTER);
            Navigator.pop(context);
          },
          child: Container(
            height: 49,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Common.pathImg + "ic_coin.png",
                  width: 18.0,
                  height: 18.0,
                ),
                Text(
                  "150",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        Divider(
          height: 1,
          color: Colors.grey[400],
        ),
        Container(
          color: Colors.grey[200],
          height: 50,
          child: ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            selectedTileColor: Colors.grey[200],
            title: Text(
              "No",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[800]),
            ),
          ),
        ),
      ],
    ),
  );
}