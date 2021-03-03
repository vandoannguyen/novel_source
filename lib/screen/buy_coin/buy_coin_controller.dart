import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/app_localizations.dart';
import 'package:init_app/base/base_controller.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/data/repository.dart';
import 'package:init_app/screen/tutorial_buy_coin/tutorial_buy_coin_screen.dart';

class BuyCoinController extends BaseController {
  List<Map<String, String>> paymentMethods = [
    {"icon": "ic_edit.png", "name": "Google Pay", "value": "google-pay"}
  ];
  List<Map<String, dynamic>> coinPackage = [
    {
      "id": "",
      "coin": 550,
      "x_percent": 20,
      "title": "\$0.99",
      "bestChoice": false,
    },
    {
      "id": "",
      "coin": 1200,
      "x_percent": 30,
      "title": "\$2.2",
      "bestChoice": false,
    },
    {
      "id": "",
      "coin": 2400,
      "x_percent": 40,
      "title": "\$4.4",
      "bestChoice": true,
    },
    {
      "id": "",
      "coin": 4800,
      "x_percent": 50,
      "title": "\$8.81",
      "bestChoice": false,
    },
    {
      "id": "",
      "coin": 12000,
      "x_percent": 50,
      "title": "\$22.01",
      "bestChoice": false,
    },
    {
      "id": "",
      "coin": 24000,
      "x_percent": 50,
      "title": "\$44.03",
      "bestChoice": false,
    },
  ];
  Map<String, String> value;

  BuyCoinController() {}

  onInit() {
    value = paymentMethods[0];
    if (Common.listInapp == null || Common.listInapp.length == 0)
      getSubscription();
  }

  void selectMethod(item) {
    value = item;
    update();
  }

  void buyCoin(value) {
    Get.back();
    RepositoryImpl.getInstance()
        .buySubscription(idSub: value["id"])
        .then((value) {
      Get.snackbar('',
          '${AppLocalizations.of(context).translate("Deposit coins success! You have")} ${Common.coin}!',
          titleText: Text(
            "SUCCESS",
            style: TextStyle(color: Colors.green, fontSize: 18.0),
          ),
          snackPosition: SnackPosition.BOTTOM);
    }).catchError((err) {
      print(err);
      Get.snackbar('', err,
          titleText: Text(
            "ERROR",
            style: TextStyle(color: Colors.red, fontSize: 18.0),
          ),
          snackPosition: SnackPosition.BOTTOM);
    });
    // Common.coin += value["coin"] + value["x_percent"];
    // coinDemo =Common.coin.obs;
    // setCoin(Common.coin);
  }

  void goTutorialBuyCoin() {
    Get.to(TutorialBuyCoinScreen());
  }

  void getSubscription() {
Common.listInapp = coinPackage;
return;
    if (Common.listInapp == null || Common.listInapp.length == 0)
      RepositoryImpl.getInstance()
          .getSubscription(lang: Common.language)
          .then((value) {
        print("======== $value");
        Common.listInapp = value;
      }).catchError((err) {
        print(err);
      });
  }
}
