import 'package:get/get.dart';
import 'package:init_app/base/base_controller.dart';

class CommentAllController extends BaseController {
  CommentAllController();

  // ignore: must_call_super
  onInit() {
    print(" object CommentAllController");
  }

  void callBack(key, value) {
    switch (key) {
      case "BACK":
        Get.back();
        break;
      case "SHARE":
        break;
      default:
    }
  }
}
