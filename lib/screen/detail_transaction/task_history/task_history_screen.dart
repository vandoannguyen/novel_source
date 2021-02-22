import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/common/constant.dart';
import 'package:init_app/screen/detail_transaction/task_history/task_history_controller.dart';

// ignore: must_be_immutable
class TaskHistoryScreen extends BaseWidget<TaskHistoryController> {
  static const String routeName = '/task-history';
  static const String name = 'Nhiệm Vụ';

  @override
  void dispose() {}

  @override
  Widget build(BuildContext context, {controllerSuper}) {
    super.build(context, controllerSuper: TaskHistoryController());
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView.builder(
          physics: AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.questions.length,
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
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                  child: Row(
                    children: [
                      // ExpandableIcon(
                      //   theme: ExpandableThemeData(
                      //     tapBodyToExpand: true,
                      //     tapBodyToCollapse: true,
                      //     expandIcon: Icons.chevron_right_rounded,
                      //     collapseIcon:
                      //         Icons.keyboard_arrow_down_rounded,
                      //     iconColor: Color(Constant.colorTxtDefault),
                      //     iconSize: 28.0,
                      //     iconRotationAngle: pi / 2,
                      //     iconPadding: EdgeInsets.only(right: 0),
                      //     hasIcon: false,
                      //   ),
                      // ),
                      Expanded(
                        child: Text(
                            "${index + 1}. ${controller.questions[index]["question"]}",
                            style: TextStyle(
                                fontSize: 17.0, fontWeight: FontWeight.w500)),
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
                    children: controller.questions
                        .map((item) => Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("data"),
                                  Expanded(
                                    child: Text(
                                      "+ 20",
                                      style: TextStyle(
                                          color:
                                              Color(Constant.colorTxtSecond)),
                                    ),
                                  ),
                                  Image.asset(
                                    Common.pathImg + "ic_coin.png",
                                    width: 18.0,
                                    fit: BoxFit.contain,
                                  )
                                ],
                              ),
                            ))
                        .toList(),
                  )),
            );
          }),
    );
  }
}
