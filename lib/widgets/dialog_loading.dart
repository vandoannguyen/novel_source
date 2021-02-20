import 'package:flutter/material.dart';

void showDialogLoading(context) {
  showDialog(context: context, builder: (_) => dialogLanguage(context));
}

Widget dialogLanguage(context) {
  return Dialog(
    child: Container(
      color: Colors.white,
      height: 80,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 30,
          ),
          CircularProgressIndicator(),
          SizedBox(
            width: 30,
          ),
          Text(
            'Loading ...',
            style: TextStyle(fontSize: 18, color: Colors.black),
          )
        ],
      ),
    ),
  );
}

textStyle() {
  return TextStyle(fontSize: 15, color: Colors.black);
}
