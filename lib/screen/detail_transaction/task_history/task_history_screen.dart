import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/common/constant.dart';
import 'package:init_app/common/images.dart';
import 'package:init_app/screen/detail_transaction/task_history/task_history_controller.dart';

import '../../../app_localizations.dart';

// ignore: must_be_immutable
class TaskHistoryScreen extends BaseWidget<TaskHistoryController> {
  static const String routeName = '/task-history';
  static const String name = 'tasks';

  @override
  void dispose() {}

  @override
  Widget build(BuildContext context, {controllerSuper}) {
    super.build(context, controllerSuper: TaskHistoryController());
    controller.getTaskHistory();
    //controller.getDetailHistory();
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: GetBuilder<TaskHistoryController>(
          // global: false,
          builder: (__) {
        return __.coinHis != null
            ? Container(
                child: __.coinHis.length > 0
                    ? ListView.builder(
                        physics: AlwaysScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: __.coinHis.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ExpandablePanel(
                            theme: ExpandableThemeData(
                              headerAlignment:
                                  ExpandablePanelHeaderAlignment.center,
                              tapBodyToExpand: true,
                              tapBodyToCollapse: true,
                              hasIcon: true,
                              tapHeaderToExpand: true,
                            ),
                            header: Column(
                              children: [
                                Container(
                                  height: 60.0,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("${__.coinHis[index]["date"]}",
                                            style: TextStyle(fontSize: 16.0)),
                                        Row(
                                          children: [
                                            Text(
                                                "${AppLocalizations.of(context).translate('TOTAL_COIN_BOUGHT')}: +${__.coinHis[index]["sum"]}",
                                                style: TextStyle(
                                                    fontSize: 15.0,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            Image.asset(
                                              Common.pathImg + "ic_coin.png",
                                              height: 16.0,
                                              width: 16.0,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(
                                  height: 1,
                                  color: Colors.grey[400],
                                ),
                              ],
                            ),
                            expanded: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 15.0),
                                color: Colors.white,
                                child: Column(
                                  children: __.coinHis[index]["list"]
                                      .map<Widget>((coinHis) => Container(
                                            margin: EdgeInsets.only(top: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    "${coinHis["name"]} : ${coinHis["title"]} ",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16.0)),
                                                Row(
                                                  children: [
                                                    Container(
                                                      margin:
                                                          EdgeInsets.all(5.0),
                                                      child: Text(
                                                        "+${coinHis["coin"]}",
                                                        style: TextStyle(
                                                            color: Color(Constant
                                                                .colorTxtSecond),
                                                            fontSize: 16.0),
                                                      ),
                                                    ),
                                                    Image.asset(
                                                      Common.pathImg +
                                                          "ic_coin.png",
                                                      width: 16.0,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ))
                                      .toList(),
                                )),
                          );
                        })
                    : Container(
                        child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              child: Image.asset(
                                ic_empty,
                                width: 80,
                                height: 80,
                              ),
                            ),
                            Container(
                                child: Text(
                              "${AppLocalizations.of(context).translate('DATA_IS_NULL')}",
                              style: TextStyle(
                                  color: Color(0xFFFF9B93),
                                  fontWeight: FontWeight.w800),
                            ))
                          ],
                        ),
                      )),
              )
            : Container(
                alignment: Alignment.center,
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              );
      }),
    );
  }
}
