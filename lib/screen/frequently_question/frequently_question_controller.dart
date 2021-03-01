import 'package:get/get.dart';
import 'package:init_app/base/base_controller.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/main.dart';
import 'package:init_app/screen/home/home_screen.dart';
import 'package:init_app/screen/tutorial_buy_coin/tutorial_buy_coin_screen.dart';

class FrequentlyQuestionController extends BaseController {
    // {
    //   "question": "Tôi không biết cách nạp xu phải làm sao?",
    //   "answer": [
    //     "a, Phương thước thanh toán trên Google play( google pay có thể sử dụng thẻ tín dụng, thẻ ghi nợ) \nBấm vào lik này sẽ hướng dẫn bạn",
    //     "b, Phương thức thanh toán trên goole play bằng vettel  \nBấm vào link này sẽ hướng dẫn dạn}"
    //   ]
    // },
    // {
    //   "question": "Làm sao để nhận được nhiều xu hơn?",
    //   "answer":
    //       "a, Qua các phương thức thanh toán nạp xu để có thêm xu. \nb, Bấm vào đây làm nhiệm vụ nhận thêm xu."
    // },
  List<Map<String, dynamic>> questions = [
  
    {
      "question":
          "My friend logged in successfully, why can't I even add coins?",
      "answer":
          "Invite a friend to login successfully but the account still does not receive the coin"
    },
    {
      "question": "I paid why the coin has not been added yet?",
      "answer":
          "Due to network error"
    },
    {
      "question": "When will a novel/manga release a new chapter?",
      "answer": "Every Monday to Friday, every day comes a new chapter"
    },
  ];


  onInit() {}

  void goTutorial() {
    Get.to(TutorialBuyCoinScreen());
  }
  void goHome() {
    Get.back(result: 1);
  }
}
