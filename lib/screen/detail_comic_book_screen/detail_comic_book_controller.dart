import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:init_app/base/base_controller.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/data/network/CommentModle.dart';
import 'package:init_app/data/network/NovalModel.dart';
import 'package:init_app/data/network/NovelModelHotest.dart';
import 'package:init_app/data/repository.dart';
import 'package:init_app/screen/comment/comment_screen.dart';
import 'package:init_app/screen/comment_all/comment_all_screen.dart';
import 'package:init_app/screen/table_content/table_content_screen.dart';
import 'package:init_app/utils/intent_animation.dart';
import 'package:init_app/widgets/dialog_loading.dart';

class DetailComicBookController extends BaseController {
  bool textShowFlag = true;
  var isLoading = false;
  
  DetailComicBookController();

  NovelModelHotest detail;

  List<CommentModle>
      // ignore: must_call_super
      onInit() {
  
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
        // Get.to(TableContentScreen());
        IntentAnimation.intentNomal(
            context: context, screen: TableContentScreen(value));
        break;
      case "INVITE":
        break;
      case "HOW_ADD_COIN":
        print("reda mdoe");
        break;
      case "COMMENT":
        Get.to(CommentScreen(value));
        break;
      case "ALL_COMMENT":
        Get.to(CommentAllScreen());
        break;
      default:
    }
  }

  void getBookDetail(String idBook) {
    isLoading = true;
    update();
    RepositoryImpl.getInstance().getNovelDetail(idBook: idBook).then((value) {
      print(value.toJson());
      isLoading = false;
      this.detail = value;
      update();
    }).catchError((err) {
      detail = null;
    });
  }

  void getComments(String idBook) {
    RepositoryImpl.getInstance()
        .getComments(idBook: idBook, page: 1, limit: 10, increase: true)
        .then((value) {})
        .catchError((err) {});
  }

  void clickShowMore(bool textShowFlag) {
    print("clickShowMore");
    this.textShowFlag = !textShowFlag;
    update();
  }

  void postFollow(String idBook) {
    showDialogLoading(context);
    RepositoryImpl.getInstance()
        .addBookIntoMyBooks(idBook: idBook)
        .then((value) {
      if (value != null) {
        print(value);
        Navigator.of(context).pop();
        Common.myBooks.add(NovalModel.fromJson(detail.toJson()));
        update();
      }
    }).catchError((err) {
      print(err);
    });
  }
}
