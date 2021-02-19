import 'package:get/get.dart';
import 'package:init_app/base/base_controller.dart';
import 'package:init_app/screen/feedback/feedback_screen.dart';
import 'package:init_app/screen/frequently_question/frequently_question_screen.dart';
import 'package:init_app/screen/setting/setting_screen.dart';

class PersonalController extends BaseController {
  void napXu() {}

  void click(key) {
    switch (key) {
      case "DETAIL_TRANSACTION":
        break;
      case "SUPPORT":
        break;
      case "COME_AUTHOR":
        break;
      case "QUESTION":
        Get.to(FrequentlyQuestionScreen());
        break;
      case "FEEDBACK":
        Get.to(FeedbackScreen());
        break;
      case "SETTING":
        Get.to(SettingScreen());
        break;
      default:
    }
  }
}
