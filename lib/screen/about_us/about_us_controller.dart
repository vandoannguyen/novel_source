import 'package:get/get.dart';
import 'package:init_app/base/base_controller.dart';
import 'package:init_app/screen/privacy_policy/privacy_policy_screen.dart';

class AboutUsController extends BaseController {
  String version = "123";
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("1");
    version = "v1.0.0";
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    print("2");
  }

  void clickItem(key) {
    switch (key) {
      case "POLICY":
        Get.to(PrivacyPolicyScreen());
        break;
      default:
    }
  }
}
