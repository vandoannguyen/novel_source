import 'package:get/get.dart';
import 'package:init_app/base/base_controller.dart';

class TutorialBuyCoinController extends BaseController {
  List<String> tutorials = [
    "Nạp xu bằng Viettel",
    "Nạp xu bằng CH Play",
    "Hướng dẫn thanh toáng bằng Momo"
  ];
  onInit() {
    print(" object TutorialBuyCoinController");
  }

  void back() {
    Get.back();
  }

  void clickItem() {
    Get.back();
  }
}
