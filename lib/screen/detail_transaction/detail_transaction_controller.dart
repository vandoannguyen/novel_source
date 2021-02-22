import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/base/base_controller.dart';

class DetailTransactionController extends BaseController
    with SingleGetTickerProviderMixin {
  TabController controllerTab;

  DetailTransactionController();

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
}
