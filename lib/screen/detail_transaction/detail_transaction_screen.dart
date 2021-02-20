import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/common/constant.dart';
import 'package:init_app/screen/detail_transaction/detail_transaction_controller.dart';
import 'package:init_app/screen/detail_transaction/task_history/task_history_screen.dart';
import 'package:init_app/widgets/appbar_second.dart';

class DetailTransactionScreen extends BaseWidget<DetailTransactionController> {
  static const String routeName = '/detail-transaction';
  static const String name = 'Chi tiết giao dịch';
  DetailTransactionController controller =
      Get.put(DetailTransactionController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            appbarSecond(DetailTransactionScreen.name),
            new TabBar(
              controller: controller.controllerTab,
              indicatorColor: Color(Constant.colorTxtPrimary),
              indicatorSize: TabBarIndicatorSize.label,
              unselectedLabelColor: Color(Constant.colorTxtDefault),
              labelColor: Color(Constant.colorTxtPrimary),
              tabs: [
                new Tab(
                  text: 'Nạp Xu',
                ),
                new Tab(
                  text: 'Nhiệm Vụ',
                ),
                new Tab(
                  text: 'Tiêu Phí',
                ),
              ],
            ),
            Expanded(
              child: new TabBarView(
                controller: controller.controllerTab,
                children: <Widget>[
                  TaskHistoryScreen(),
                  TaskHistoryScreen(),
                  TaskHistoryScreen(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
