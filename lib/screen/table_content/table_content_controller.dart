import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/base/base_controller.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/data/network/NovalChapterModel.dart';
import 'package:init_app/data/repository.dart';
import 'package:init_app/utils/call_native_utils.dart';
import 'package:init_app/utils/crypt_utils.dart';
import 'package:init_app/widgets/dialog_loading.dart';

class TableContentController extends BaseController {
  List<NovalChapterModel> listChaps;
  int page = 1;
  final int limit = 10;
  var isLoadMore = false;

  bool isLoadAll = false;

  onInit() {
    print(" object TableContentController");
  }

  void back() {
    Get.back();
  }

  void clickItem() {
    Get.back();
  }

  void getChapter(String id) {
    RepositoryImpl.getInstance()
        .chapByNoval(id: id, page: page, limit: limit)
        .then((value) {
      if (page == 1) listChaps = value;
      if (page != 1) {
        listChaps.addAll(value);
        if (value.length < limit) {
          isLoadAll = true;
        }
      }
      update();
    }).catchError((err) {
      listChaps = null;
    });
  }

  void loadMore(String id) {
    // neeus chua loa het
    if (!isLoadAll) {
      print(loadMore);
      isLoadMore = true;
      update();
      page++;
      getChapter(id);
    }
  }

  void read(NovalChapterModel chapter) {
    showDialogLoading(context);
    RepositoryImpl.getInstance().readNoval(id: chapter.id).then((value) {
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
