import 'package:get/get.dart';
import 'package:init_app/base/base_controller.dart';

class FeedbackController extends BaseController {
  // ignore: must_call_super
  int maxCount = 1000;
  int count = 0;
  onInit() {
    print(" object CommentController");
  }

  void countWord(word) {
    count = word;
    update();
  }

  void back() {
    Get.back();
  }

  void sendCmt(value) {
    print(value);
    Get.back();
  }
}
