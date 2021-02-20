import 'package:get/get.dart';
import 'package:init_app/base/base_controller.dart';
import 'package:init_app/screen/buy_coin/buy_coin_screen.dart';
import 'package:init_app/screen/detail_transaction/detail_transaction_screen.dart';
import 'package:init_app/screen/feedback/feedback_screen.dart';
import 'package:init_app/screen/frequently_question/frequently_question_screen.dart';
import 'package:init_app/screen/setting/setting_screen.dart';

class PersonalController extends BaseController {
  void click(key) {
    switch (key) {
      case "BUY_COIN":
        Get.to(BuyCoinScreen());
        break;
      case "DETAIL_TRANSACTION":
        Get.to(DetailTransactionScreen());
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
