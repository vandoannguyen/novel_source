import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/base/base_controller.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/data/network/NovalChapterModel.dart';
import 'package:init_app/data/repository.dart';
import 'package:init_app/screen/buy_coin/buy_coin_screen.dart';
import 'package:init_app/utils/call_native_utils.dart';
import 'package:init_app/utils/crypt_utils.dart';
import 'package:init_app/utils/intent_animation.dart';
import 'package:init_app/widgets/dialog_confirm_buy_chapter.dart';
import 'package:init_app/widgets/dialog_loading.dart';
import 'package:init_app/widgets/dialog_not_enough_coin.dart';

class TableContentController extends BaseController {
  List<NovalChapterModel> listChaps;
  dynamic listChapterBought;

  TableContentController() {
    listChapterBought = new List();
  }

  int page = 1;
  final int limit = 20;
  var isLoadMore = false;
  var isLoadig = false;
  bool isLoadAll = false;

  bool isLoadChapterSuccess = false;

  bool isLoadChapterBoughtSuccess = false;

  onInit() {
    print(" object TableContentController");
  }

  void back() {
    Get.back();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    listChaps = null;
    isLoadMore = false;
    isLoadAll = false;
    super.onClose();
  }

  void clickItem() {
    Get.back();
  }

  void getChapter(String id) {
    setIsLoading();
    isLoadChapterSuccess = false;
    if (!isLoadMore) update();
    RepositoryImpl.getInstance().chapByNoval(id: id, page: page, limit: limit).then((value) {
      if (isLoadMore) {
        isLoadMore = false;
        update();
      }
      isLoadChapterSuccess = true;
      setIsLoading();
      update();
      if (page == 1) listChaps = value;
      if (page != 1) {
        listChaps.addAll(value);
        if (value.length < limit) {
          isLoadAll = true;
        }
      }
      update();
    }).catchError((err) {
      print(err);
      listChaps = null;
    });
  }

  void loadMore(String id) {
    // neeus chua loa het
    if (!isLoadAll) {
      print("loadMore");
      isLoadMore = true;
      update();
      page++;
      getChapter(id);
    }
  }

  void read(NovalChapterModel chapter) {
    print("chapter.id${chapter.id}");
    print("listChapterBought.contains(chapter.id)${listChapterBought}");
    if (chapter.coin > 0 && !listChapterBought.contains(chapter.id)) {
      if (Common.coin > chapter.coin) {
        showDialogConfirmBuyChapter(context, chapter.coin, callback: (isAccept) {
          if (isAccept) {
            Common.coin -= chapter.coin;
            listChapterBought.add(chapter.id);
            update();
            readNovel(chapter);
          }
        });
        return;
      } else {
        showDialogNotEnough(context, (isAccept) {
          if (isAccept) {
            IntentAnimation.intentNomal(context: (context), screen: BuyCoinScreen(), option: IntentAnimationOption.RIGHT_TO_LEFT);
          }
        });
        return;
      }
    }
    readNovel(chapter);
  }

  void readNovel(NovalChapterModel chapter) {
    showDialogLoading(context);
    RepositoryImpl.getInstance().readNoval(id: chapter.id).then((value) {
      print(value);
      String data = CryptUtils.decryptAESCryptoJS(value["result"]["content_text"], Common.ONEADX_KEY);
      var chap = value["result"]["title"];
      var read = CryptUtils.decodeBase4(data);
      _insertChapterRead(chapter, value["result"]);
      Navigator.of(context).pop();
      CallNativeUtils.invokeMethod(method: "read", aguments: {"title": chap, "content": read});
    }).catchError((err) {
      print(err);
    });
  }

  void getChapterBought(String id) {
    RepositoryImpl.getInstance().getChapterBought(bookId: id).then((value) {
      print("getChapterBought$value");
      listChapterBought.addAll(value);
      print("getChapterBought$listChapterBought");
      update();
    }).catchError((err) {
      print(err);
    });
  }

  void setIsLoading() {
    isLoadig = !isLoadChapterSuccess && !isLoadChapterBoughtSuccess;
  }

  void _insertChapterRead(NovalChapterModel chapter, read) {
    List datas = Common.listReadChapter.where((element) => element["idBook"] == chapter.bookId).toList();
    // kiểm tra xem sách đã có trong list đã đọc hay chưa
    if (datas.length > 0) {
      if (datas[0]["chapterNum"] != chapter.num) {
        Common.listReadChapter = Common.listReadChapter.where((e) => e["idBook"] != chapter.bookId).toList();
        Common.listReadChapter.add({"idBook": chapter.bookId, "chapterNum": chapter.num, "read": read});
      }
    } else {
      Common.listReadChapter.add({"idBook": chapter.bookId, "chapterNum": chapter.num, "read": read});
    }
    RepositoryImpl.getInstance().setReadNovel(jsonEncode(Common.listReadChapter));
  }
}
