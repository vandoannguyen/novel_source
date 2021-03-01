import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';
import 'package:init_app/app_localizations.dart';
import 'package:init_app/base/base_controller.dart';
import 'package:init_app/common/common.dart';

import 'survey_question_screen.dart';

class SurveyQuestionController extends BaseController {
  // ignore: must_call_super

  List<Map<String, dynamic>> questions = [];
  List<dynamic> answers = ["2 hours", "", "Modern love language", "", "", ""];
  onInit() {}

  void changeAnswers(index, value) {
    answers[index] = value;
    update();
  }

  void done() async {
    if (answers[1].isEmpty || answers[2] == "Other" || answers[5].isEmpty) {
      Get.snackbar(
        '',
        'You must fill out all information!',
        titleText: Text(
          "ERROR",
          style: TextStyle(color: Colors.redAccent, fontSize: 18.0),
        ),
          snackPosition: SnackPosition.BOTTOM
      );
    } else {
      String body = "";
      print(answers);
      List<dynamic> mid = new List<dynamic>();
      mid.addAll(answers);
      mid[0] = mid[0] + " per day";
      mid[1] = "Like most: " + mid[1];
      mid[2] = "Hope to have: " + mid[2];
      mid[3] = "Payment 1: " + mid[3];
      mid[4] = "Payment 2: " + mid[4];
      mid[5] = "Comments: " + mid[5];
      for (var item in mid) {
        body += item + "<br/>";
      }

      final Email email = Email(
        body: body,
        subject: SurveyQuestionScreen.name,
        recipients: [Common.email],
        // cc: ['cc@example.com'],
        // bcc: ['bcc@example.com'],
        // attachmentPaths: ['/path/to/attachment.zip'],
        isHTML: true,
      );

      await FlutterEmailSender.send(email);
    }
  }
}
