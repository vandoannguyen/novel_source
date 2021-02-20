import 'package:get/get.dart';
import 'package:init_app/base/base_controller.dart';
import 'package:init_app/screen/about_us/about_us_screen.dart';
import 'package:init_app/screen/ownership/ownership_screen.dart';
import 'package:init_app/screen/setting/setting_screen.dart';

class SettingController extends BaseController {
  bool autoLock = false;
  onInit() {
    print(" object SettingController");
  }

  void changeLanguage(value) {}
  void clickItem(key) {
    switch (key) {
      case "AUTO_LOCK":
        autoLock = !autoLock;
        update();
        break;
      case "DELETE_MEMORY":
        break;
      case "OWNERSHIP":
        Get.to(OwnershipScreen());
        break;
      case "ABOUT_US":
        Get.to(AboutUsScreen());
        break;
      case "LANGUAGE":
        break;
      default:
    }
  }
}
