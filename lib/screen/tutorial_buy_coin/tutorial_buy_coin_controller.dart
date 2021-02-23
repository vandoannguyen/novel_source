import 'package:get/get.dart';
import 'package:init_app/base/base_controller.dart';
import 'package:init_app/screen/tutorial_buy_coin/buy_coin_chplay/buy_coin_chplay_screen.dart';
import 'package:init_app/screen/tutorial_buy_coin/buy_coin_momo/buy_coin_momo_screen.dart';
import 'package:init_app/screen/tutorial_buy_coin/buy_coin_viettel/buy_coin_viettel_screen.dart';

class TutorialBuyCoinController extends BaseController {
  List<String> tutorials = [
    "Deposit coins by Viettel",
    "Deposit coins by CH Play",
    "Instructions for paying with Momo"
  ];
  void back() {
    Get.back();
  }

  void clickItem(key) {
    switch (key) {
      case 0:
        Get.to(BuyCoinViettelScreen());
        break;
        case 1:
        Get.to(BuyCoinChplayScreen());
        break;
        case 2:
        Get.to(BuyCoinMonoScreen());
        break;
      default:
    }
  }
}
