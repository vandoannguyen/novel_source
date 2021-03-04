import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/base/base_controller.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/data/repository.dart';
import 'package:init_app/screen/tutorial_buy_coin/tutorial_buy_coin_screen.dart';
class TaskHistoryController extends BaseController {
  List coinHis;
  // List loadedcoin = [];
  TaskHistoryController() {
    coinHis = new List();
  }
  onInit() {}
  void getTaskHistory() {
    coinHis = null;
    update();
    RepositoryImpl.getInstance()
        .historyBuy(page: 1, limit: 10)
        .then((value) async {
      print("getTaskHistory1 $value");
      // var listSub = [];
      try {
        var list = await RepositoryImpl.getInstance()
            .getSubscription(lang: Common.language);
        if (list != null) {
          value = (value as List).where((element) {
            return list
                .where((e) => element["subscription_id"] == e["id"])
                .toList()
                .length >
                0;
          }).toList();
          value = value.map((element) {
            dynamic a =
            list.firstWhere((e) => e["id"] == element["subscription_id"]);
            return {"date": element["createdAt"], ...a};
          }).toList();
          return value;
        } else
          return [];
      } catch (err) {
        throw (err);
      }
    }).then((value) {
      var list = [];
      for (int i = 0; i < value.length; i++) {
        // kiem tra xem ngay co trong list hay chua
        if (list
            .where((element) =>
        element["date"] == value[i]["date"].substring(0, 10))
            .length ==
            0) {
          // lay tat ca item co ngay giong
          var l = (value as List).where((e)=>e["date"].substring(0, 10) == value[i]["date"].substring(0, 10)).toList();
          double sum  = 0;
          print(l.length);
          l.forEach((el) {
            print("0000000000000000$el");
            sum+= el["coin"];
          });
          list.add({
            "date":value[i]["date"].substring(0, 10),
            "sum":sum,
            "list":l
          });
        }
      }
      return list;
    }).then((value) {
      print("000000000$value");
      coinHis = value;
      if (coinHis == null) coinHis = [];
      print("value$value");
      update();
    }).catchError((err) {
      print(err);
      coinHis = null;
      update();
    });
  }
  void getDetailHistory() {
    // RepositoryImpl.getInstance()
    //     .getSubscription(lang: Common.language)
    //     .then((value) {
    //   print("detail_history ${value}");
    //   loadedcoin = value as List;
    //   update();
    // }).catchError((err) {
    //   print(err);
    //   update();
    // });
  }
  void goTutorial() {
    Get.to(TutorialBuyCoinScreen());
  }
}