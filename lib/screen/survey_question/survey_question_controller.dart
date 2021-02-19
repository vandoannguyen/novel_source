import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/base/base_controller.dart';

class SurveyQuestionController extends BaseController {
  // ignore: must_call_super
  int maxCount = 1000;
  int count = 0;
  List<Map<String, dynamic>> questions = [];

  onInit() {
    print(" object CommentController");
    Get.snackbar('Hi', 'i am a modern snackbar');
  }

  void countWord(word) {
    count = word;
    update();
  }

  void back() {
    Get.back();
  }

  void send(String email, String content) {
    // Get.snackbar('Hi', 'i am a modern snackbar');
    if (email.isEmpty || content.isEmpty) {
      print(email + "dsda");
    }
    back();
  }

  void contactsFB() {
    // Get.snackbar('Hi', 'i am a modern snackbar');
    back();
  }
}
