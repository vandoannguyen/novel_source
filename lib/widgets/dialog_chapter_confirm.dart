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
          child: Text("Which one "),
        )
      ],
    )),
  );
}
