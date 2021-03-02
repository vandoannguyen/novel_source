import 'package:get/get.dart';
import 'package:init_app/base/base_controller.dart';
import 'package:init_app/screen/tutorial_buy_coin/tutorial_buy_coin_screen.dart';

class TaskHistoryController extends BaseController {
  List<Map<String, dynamic>> loadedcoin = [
    {
      "datetime": "12-02-2020",
      "answer": [
        {
          "napxu" : "Nap bang tai khoan google",
          "coin": "30",
        },
        {
          "napxu" : "Nap bang the cao viettel",
          "coin": "50",
        }
      ],
    },
    {
      "datetime": "13-02-2020",
      "answer": [
        {
          "napxu" : "Nap bang the cao viettel",
          "coin": "30",
        },
        {
          "napxu" : "Nap bang tai khoan google ",
          "coin": "50",
        }
      ],
    },
    {
      "datetime": "14-02-2020",
      "answer": [
        {
          "napxu" : "Nap bang the cao viettel",
          "coin": "30",
        },
        {
          "napxu" : "Nap bang tai khoan google  ",
          "coin": "50",
        }
      ],
    },
    {
      "datetime": "15-02-2020",
      "answer": [
        {
          "napxu" : "Nap bang the cao viettel ",
          "coin": "30",
        },
        {
          "napxu" : "Nap bang the cao viettel ",
          "coin": "50",
        }
      ],
    }
  ];

  TaskHistoryController();

  onInit() {}

  void goTutorial() {
    Get.to(TutorialBuyCoinScreen());
  }
}
