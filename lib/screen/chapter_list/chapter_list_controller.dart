import 'package:flutter/material.dart';
import 'package:init_app/base/base_controller.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/data/network/NovalChapterModel.dart';
import 'package:init_app/data/repository.dart';
import 'package:init_app/utils/call_native_utils.dart';
import 'package:init_app/utils/crypt_utils.dart';
import 'package:init_app/widgets/dialog_loading.dart';

class ChapterListController extends BaseController {
  List<NovalChapterModel> list;
  var page = 1;

  var context;

  void getChapterList(id, {page = 1}) {
    this.page = page;
    RepositoryImpl.getInstance()
        .chapByNoval(id: id, limit: 20, page: page)
        .then((value) {
      List<NovalChapterModel> list =
          (value as List).map((e) => NovalChapterModel.fromJson(e)).toList();
      this.list.addAll(list);
      print(this.list);
      update();
    }).catchError((err) {
      print(err);
    });
  }

  ChapterListController(context) {
    this.context = context;
    list = new List();
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
