import 'package:flutter/material.dart';

showDialogConfirmChapter(context, chapterNum, callBack) {
  showDialog(
      context: context,
      builder: (_) => dialogChapterConfirm(chapterNum, callBack));
}

dialogChapterConfirm(chapterNum, callBack) {
  return Dialog(
    child: Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          child: Text("Which one do you want to chose?",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black)),
        ),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            callBack("chap");
          },
          child: Container(
            padding: EdgeInsets.all(10),
            color: Colors.red,
            child: Text("Continue chapter $chapterNum", style: getTextStyle()),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            callBack("menu");
          },
          child: Container(
            padding: EdgeInsets.all(10),
            color: Colors.red,
            child: Text("Open Table of Content", style: getTextStyle()),
          ),
        ),
      ],
    )),
  );
}

getTextStyle() {
  return TextStyle();
}
