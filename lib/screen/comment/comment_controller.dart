import 'package:get/get.dart';
import 'package:init_app/base/base_controller.dart';
import 'package:init_app/data/repository.dart';

class CommentController extends BaseController {
  // ignore: must_call_super
  int maxCount = 1000;
  int count = 0;

  CommentController();

  onInit() {
    print(" object CommentController");
  }



  void back() {
    Get.back();
  }

  void sendCmt(value, {idBook}) {
    RepositoryImpl.getInstance()
        .postComment(idBook: idBook, contentComment: value)
        .then((value) {
      print("valuecomment$value");
    });
  }
}
