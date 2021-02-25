import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/base/base_controller.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/screen/tutorial_buy_coin/tutorial_buy_coin_screen.dart';

class BuyCoinController extends BaseController {
  List<Map<String, String>> paymentMethods = [
    {"icon": "ic_edit.png", "name": "Google Pay", "value": "google-pay"}
  ];
  List<Map<String, dynamic>> coinPackage = [
    {
      "id": "",
      "coin": 550,
      "coinExtra": 825,
      "moneyVN": "đ23.000",
      "moneyForeign": "\$0.99",
      "sale": false,
    },
    {
      "id": "",
      "coin": 1200,
      "coinExtra": 720,
      "moneyVN": "đ50.000",
      "moneyForeign": "\$2.2",
      "sale": false,
    },
    {
      "id": "",
      "coin": 2400,
      "coinExtra": 960,
      "moneyVN": "đ100.000",
      "moneyForeign": "\$4.4",
      "sale": true,
    },
    {
      "id": "",
      "coin": 4800,
      "coinExtra": 3840,
      "moneyVN": "đ200.000",
      "moneyForeign": "\$8.81",
      "sale": false,
    },
    {
      "id": "",
      "coin": 12000,
      "coinExtra": 3600,
      "moneyVN": "đ500.000",
      "moneyForeign": "\$22.01",
      "sale": false,
    },
    {
      "id": "",
      "coin": 24000,
      "coinExtra": 12000,
      "moneyVN": "đ1.000.000",
      "moneyForeign": "\$44.03",
      "sale": false,
    },
  ];
  Map<String, String> value;

  BuyCoinController();
  onInit() {
    value = paymentMethods[0];
  }

  void selectMethod(item) {
    value = item;
    update();
  }

  void buyCoin(value) {
    print(value);
    Common.coin += value["coin"] + value["coinExtra"];
    // coinDemo  += value["coin"] + value["coinExtra"];
    setCoin(Common.coin);
    print("coinDemo ${coinDemo}");
    Get.back();
      Get.snackbar(
        '',
        'Deposit coins success! You have ${Common.coin}!',
        titleText: Text(
          "SUCCESS",
          style: TextStyle(color: Colors.green, fontSize: 18.0),
        ),
      );
  }

  void goTutorialBuyCoin() {
    Get.to(TutorialBuyCoinScreen());
  }
}
