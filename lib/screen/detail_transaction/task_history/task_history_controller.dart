import 'package:get/get.dart';
import 'package:init_app/base/base_controller.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/screen/tutorial_buy_coin/tutorial_buy_coin_screen.dart';

class TaskHistoryController extends BaseController {
  List<Map<String, dynamic>> questions = [
    {
      "question": "Tôi không biết cách nạp xu phải làm sao?",
      "answer": ["", ""]
    },
    {
      "question": "Tôi không biết cách nạp xu phải làm sao?",
      "answer": ["", ""]
    },
  ];

  onInit() {}

  void goTutorial() {
    Get.to(TutorialBuyCoinScreen());
  }
}
