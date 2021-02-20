import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/base/base_controller.dart';

class SurveyQuestionController extends BaseController {
  // ignore: must_call_super

  List<Map<String, dynamic>> questions = [];
  List<dynamic> answers = [1, "", 1, "", "", ""];
  onInit() {
    print(" object CommentController");
    Get.snackbar('Hi', 'i am a modern snackbar');
  }

  void changeAnswers(index, value) {
    answers[index] = value;
    print("$index $value");
    update();
  }
}
