import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/base/base_controller.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/data/network/CommentModle.dart';
import 'package:init_app/data/network/NovalModel.dart';
import 'package:init_app/data/repository.dart';
import 'package:init_app/screen/bookstore/detail_comic/invite_friend.dart';
import 'package:init_app/screen/comment/comment_screen.dart';
import 'package:init_app/screen/comment_all/comment_all_screen.dart';
import 'package:init_app/screen/login/login_screen.dart';
import 'package:init_app/screen/table_content/table_content_screen.dart';
import 'package:init_app/screen/tutorial_buy_coin/tutorial_buy_coin_screen.dart';
import 'package:init_app/utils/call_native_utils.dart';
import 'package:init_app/utils/crypt_utils.dart';
import 'package:init_app/utils/intent_animation.dart';
import 'package:init_app/widgets/bottom_sheet_coin.dart';
import 'package:init_app/widgets/dialog_loading.dart';
import 'package:init_app/widgets/dialog_not_enough_coin.dart';

class DetailComicBookController extends BaseController {
  bool textShowFlag = true;
  var isLoading = false;
  List<NovelModel> hotest;

  DetailComicBookController();

  NovelModel detail;

  List<CommentModle>
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
        // Get.to(TableContentScreen());
        IntentAnimation.intentNomal(
            context: context, screen: TableContentScreen(value));
        break;
      case "INVITE":
        inviteFriend();
        break;
      case "HOW_ADD_COIN":
        {
          IntentAnimation.intentNomal(
              context: context, screen: TutorialBuyCoinScreen());
        }
        break;
      case "COMMENT":
        Get.to(CommentScreen(value));
        break;
      case "ALL_COMMENT":
        Get.to(CommentAllScreen());
        break;
      case "READ_NOW":
        {
          getChapter(value);
          break;
        }
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
        .getComments(idBook: idBook, page: 1, limit: 20, increase: true)
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
    if (Common.myBooks
            .where((element) => element.id == idBook)
            .toList()
            .length ==
        0) {
      RepositoryImpl.getInstance()
          .addBookIntoMyBooks(idBook: idBook)
          .then((value) {
        if (value != null) {
          print(value);
          Navigator.of(context).pop();
          Common.myBooks.add(NovelModel.fromJson(detail.toJson()));
          update();
        }
      }).catchError((err) {
        Navigator.of(context).pop();
      });
    } else {
      RepositoryImpl.getInstance()
          .removeBookFromMyBook(idBook: idBook)
          .then((value) {
        print(value);
        Navigator.of(context).pop();
        Common.myBooks =
            Common.myBooks.where((e) => e.id != detail.id).toList();
        update();
      }).catchError((err) {
        Navigator.of(context).pop();
      });
    }
  }

  void getHotest() {
    RepositoryImpl.getInstance()
        .getNovelHotest(language: Common.language, page: 1, limitPerPage: 4)
        .then((value) {
      hotest = value;
      update();
    }).catchError((err) {});
  }

  void inviteFriend() {
    if (Common.isLogedIn) {
      IntentAnimation.intentNomal(context: context, screen: InviteFriend());
    } else {
      IntentAnimation.intentNomal(context: context, screen: LoginScreen());
    }
  }

  void showDialogReward() {
    showModalBottomSheet(
        context: context,
        builder: (_) => dialogReward(context, callback: (value) {
              if (Common.coin > value) {
                showDialogLoading(context);
                RepositoryImpl.getInstance()
                    .donateForWrite(idBook: detail.id, coin: value)
                    .then((data) {
                  showMess("+$value coin", TypeMess.INFORMATION);
                  Navigator.pop(context);
                  Common.coin -= value;
                }).catchError((err) {
                  showMess("Donate error", TypeMess.WARNING);
                });
              } else {
                showDialogNotEnough(context, (value) {});
              }
            }));
  }

  void getChapter(id) {
    print("chapterrrrr$id");
    var chapter = Common.listReadChapter
        .firstWhere((element) => element["idBook"] == id, orElse: () => null);
    if (chapter == null)
      RepositoryImpl.getInstance()
          .chapByNoval(id: id, page: 1, limit: 1)
          .then((value) {
        if (value.length > 0) {
          readChapter(id: value[0].id);
        } else
          showMess("Can not get chapter", TypeMess.WARNING);
      });
    else {
      print(chapter);
      var chap = chapter["read"]["title"];
      print(chap);
      String data = CryptUtils.decryptAESCryptoJS(
          chapter["read"]["content_text"], Common.ONEADX_KEY);
      print("data$data");
      var read = CryptUtils.decodeBase4(data);
      print(read);
      Navigator.of(context).pop();
      CallNativeUtils.invokeMethod(
          method: "read", aguments: {"title": chap, "content": read});
    }
  }

  void readChapter({String id}) {
    showDialogLoading(context);
    RepositoryImpl.getInstance().readNoval(id: id).then((value) {
      print(value);
      String data = CryptUtils.decryptAESCryptoJS(
          value["result"]["content_text"], Common.ONEADX_KEY);
      var chap = value["result"]["title"];
      var read = CryptUtils.decodeBase4(data);
      print(read);
      Navigator.of(context).pop();
      CallNativeUtils.invokeMethod(
          method: "read", aguments: {"title": chap, "content": read});
    }).catchError((err) {
      print(err);
    });
  }
}
