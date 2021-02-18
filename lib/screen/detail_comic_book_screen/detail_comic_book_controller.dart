import 'package:get/get.dart';
import 'package:init_app/base/base_controller.dart';
import 'package:init_app/screen/comment/comment_screen.dart';
import 'package:init_app/screen/comment_all/comment_all_screen.dart';
import 'package:init_app/screen/table_content/table_content_screen.dart';

class DetailComicBookController extends BaseController {
  bool textShowFlag = false;

  // ignore: must_call_super
  onInit() {
    print(" object DetailComicBookController");
  }

  void callBack(key, value) {
    switch (key) {
      case "BACK":
        Get.back();
        break;
      case "SHARE":
        break;
      case "READ_MORE":
        textShowFlag = !textShowFlag;
        update();
        print("reda mdoe");
        break;
      case "TABLE_CONTENT":
        Get.to(TableContentScreen());
        break;
      case "INVITE":
        break;
      case "HOW_ADD_COIN":
        print("reda mdoe");
        break;
      case "COMMENT":
        Get.to(CommentScreen());
        break;
      case "ALL_COMMENT":
        Get.to(CommentAllScreen());
        break;
      default:
    }
  }
}
