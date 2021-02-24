import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/base/base_controller.dart';
import 'package:init_app/data/repository.dart';

class DetailTransactionController extends BaseController
    with SingleGetTickerProviderMixin {
  TabController controllerTab;

  DetailTransactionController();
dynamic history;
  @override
  void onInit() {
    super.onInit();
    controllerTab = TabController(vsync: this, length: 3);
   
  }

  @override
  void onClose() {
    controllerTab.dispose();
    super.onClose();
  }
  
  void getHistory() {
    RepositoryImpl.getInstance().historyBuy(page: 1, limit: 10).then((value) {
      // history = value;
      print("history ${value}");
      // update();
    }).catchError((err) {
      // history = null;
      // update();
    });
  }
}
