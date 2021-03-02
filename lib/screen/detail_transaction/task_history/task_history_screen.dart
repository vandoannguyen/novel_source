import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/common/constant.dart';
import 'package:init_app/screen/detail_transaction/task_history/task_history_controller.dart';

// ignore: must_be_immutable
class TaskHistoryScreen extends BaseWidget<TaskHistoryController> {
  static const String routeName = '/task-history';
  static const String name = 'tasks';

  @override
  void dispose() {}
  @override
  Widget build(BuildContext context, {controllerSuper}) {
    super.build(context, controllerSuper: TaskHistoryController());
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: controller.loadedcoin.isNotEmpty ? ListView.builder(
          physics: AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.loadedcoin.length,
          itemBuilder: (BuildContext context, int index) {
            return ExpandablePanel(
              theme: ExpandableThemeData(
                headerAlignment: ExpandablePanelHeaderAlignment.center,
                tapBodyToExpand: true,
                tapBodyToCollapse: true,
                hasIcon: true,
                tapHeaderToExpand: true,
              ),
              header: Container(
                child: Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Text(
                          "${controller.loadedcoin[index]["datetime"]}",
                          style: TextStyle(
                              fontSize: 13.0, fontWeight: FontWeight.w500)),


                      Row(
                        children: [
                          Text(
                              "Tong xu thu vao: +${controller.loadedcoin[index]["coin"]}",
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.w500)),
                          Image.asset(Common.pathImg + "ic_coin.png", height: 13.0, width: 13.0,)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              expanded: Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                  color: Colors.white,
                  child: Column(
                    children: (controller.loadedcoin[index]["answer"] as List)
                        .map((item) => Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${item["napxu"]}", style: TextStyle(color: Colors.black)),
                          Row(
                            children: [
                              Text(
                                "+${item["coin"]}",
                                style: TextStyle(
                                    color:
                                    Color(Constant.colorTxtSecond)),
                              ),
                              Image.asset(
                                Common.pathImg + "ic_coin.png",
                                width: 13.0,
                                fit: BoxFit.contain,
                              ),
                            ],
                          )
                        ],
                      ),
                    )).toList(),
                  )),
            );
          }) : Container(
          child: Center(
            child: Text("Data null"),
          )
      ),
    );
  }
}
