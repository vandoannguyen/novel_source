import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';
import 'package:init_app/app_localizations.dart';
import 'package:init_app/base/base_controller.dart';
import 'package:init_app/common/common.dart';

class FeedbackController extends BaseController {
  // ignore: must_call_super
  int maxCount = 1000;
  int count = 0;

  FeedbackController();
  onInit() {}

  void countWord(word) {
    count = word;
    update();
  }

  void back() {
    Get.back();
  }

  void send(String email, String content) async {
    Pattern pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(email) || email == null) {
      Get.snackbar('', 'Enter a valid email address',
          titleText: Text(
            "ERROR",
            style: TextStyle(color: Colors.red, fontSize: 18.0),
          ),
          snackPosition: SnackPosition.BOTTOM);
    }
    else if (content.isEmpty) {
      Get.snackbar('', 'You must fill out all information!',
          titleText: Text(
            "ERROR",
            style: TextStyle(color: Colors.red, fontSize: 18.0),
          ),
          snackPosition: SnackPosition.BOTTOM);
    } else {
      final Email mail = Email(
        body: content,
        subject: "Feedback ${Common.appName}",
        recipients: [Common.email],
        isHTML: true,
      );

      await FlutterEmailSender.send(mail);
    }
  }

  void contactsFB() {
    back();
  }
}
