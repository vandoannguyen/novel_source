import 'package:get/get.dart';
import 'package:init_app/base/base_controller.dart';
import 'package:init_app/screen/setting/setting_screen.dart';

class SettingController extends BaseController {
  List<String> tutorials = [
    "Nạp xu bằng Viettel",
    "Nạp xu bằng CH Play",
    "Hướng dẫn thanh toáng bằng Momo"
  ];
  onInit() {
    print(" object SettingController");
  }

  void back() {
    Get.back();
  }

  void clickItem(key) {
    switch (key) {
      case "DELETE_MEMORY":
        break;
      case "DELETE_MEMORY":
        break;
      case "DELETE_MEMORY":
        break;
      case "ABOUT_US":
        break;
      default:
    }
  }
}
