import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:init_app/base/base_controller.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/data/repository.dart';
import 'package:init_app/main.dart';
import 'package:init_app/screen/about_us/about_us_screen.dart';
import 'package:init_app/screen/load/load_controller.dart';
import 'package:init_app/screen/ownership/ownership_screen.dart';
import 'package:init_app/screen/setting/setting_screen.dart';
import 'package:init_app/widgets/dialog_language.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class SettingController extends BaseController {
  LoadController ctl = Get.put(LoadController());
  bool autoLock = false;
  String language = "";
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    selectedLanguage();
  }

  void changeLanguage(context) {
    showDialogLanguage(context, (value) {
      RepositoryImpl.getInstance().setLanguage(value);
      Common.language = value;
      selectedLanguage();
      update();
    });
    print("object ${Common.language}");
  }

  void selectedLanguage() {
    switch (Common.language) {
      case "vi":
        language = "Vietnamese";
        break;
      case "id":
        language = "Bahasa Indonesia";
        break;
      case "th":
        language = "Thailand";
        break;
      default:
    }
  }

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
      default:
    }
  }

 
}
