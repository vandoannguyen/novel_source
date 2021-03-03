import 'package:get/get.dart';
import 'package:init_app/base/base_controller.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/data/repository.dart';
import 'package:init_app/screen/tutorial_buy_coin/tutorial_buy_coin_screen.dart';

class TaskHistoryController extends BaseController {
  List coinHis;
  // List loadedcoin = [];

  TaskHistoryController(){
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
          value = (value as List)
              .where((element) {
            return
              list
                  .where((e) => element["subscription_id"] == e["id"])
                  .toList().length >0;
          })
              .toList();

          value = value.map((element) {
            dynamic  a = list.firstWhere((e) => e["id"] == element["subscription_id"]);
            return {"date":element["createdAt"],...a};
          }).toList();
          // print("${{...value[0], ...list[0]}}");
          return value;
        }
        else return [];
      } catch (err) {
        throw(err);
      }
    }).then((value) {
      coinHis = value;
      if(coinHis == null) coinHis = [];
      print
        ("value$value");
      update();
    }).catchError((err) {
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
