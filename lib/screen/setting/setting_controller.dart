import 'package:get/get.dart';
import 'package:init_app/base/base_controller.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/data/repository.dart';
import 'package:init_app/screen/about_us/about_us_screen.dart';
import 'package:init_app/screen/load/load_controller.dart';
import 'package:init_app/screen/ownership/ownership_screen.dart';
import 'package:init_app/widgets/dialog_language.dart';

class SettingController extends BaseController {
  LoadController ctl = Get.put(LoadController());
  bool autoLock = false;
  String language = "";
  bool isChangedLanguage = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    selectedLanguage();
  }

  void changeLanguage(context) {
    showDialogLanguage(context, (value) {
      RepositoryImpl.getInstance()
          .setLanguage(value)
          .then((value) {})
          .catchError((err) {});
      RepositoryImpl.getInstance().createMyBooks(
          timestamp:
              (DateTime.now().microsecondsSinceEpoch / 1000).round().toString(),
          data: Common.language);
      Common.language = value;
      selectedLanguage();
      isChangedLanguage = true;
      update();
    });
  }

  void selectedLanguage() {
    switch (Common.language) {
      case "vi":
        language = "Vietnamese";
        update();
        break;
      case "id":
        language = "Bahasa Indonesia";
        update();
        break;
      case "th":
        language = "Thailand";
        update();
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
