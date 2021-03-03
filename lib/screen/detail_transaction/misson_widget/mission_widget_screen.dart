import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/common/constant.dart';
import 'package:init_app/screen/detail_transaction/misson_widget/mission_widget_controller.dart';

import '../../../common/common.dart';

// ignore: must_be_immutable
class MissionWidgetScreen extends BaseWidget<MissionWidgetController> {
  static const String routeName = '/mission-widget';
  static const String name = 'missions';

  @override
  void dispose() {}
  @override
  Widget build(BuildContext context, {controllerSuper}) {
    super.build(context, controllerSuper: MissionWidgetController());
    controller.getMissionHistory();
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: controller.missions.isNotEmpty ? ListView.builder(
          physics: AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.missions.length,
          itemBuilder: (BuildContext context, int index) {
            Map<String, dynamic> sum = controller.missions[index]["answer"].reduce((value, element){
              return {
                "coin" : value["coin"] + element["coin"],
              };
            });
            return ExpandablePanel(
              theme: ExpandableThemeData(
                headerAlignment: ExpandablePanelHeaderAlignment.center,
                tapBodyToExpand: true,
                tapBodyToCollapse: true,
                hasIcon: true,
                tapHeaderToExpand: true,
              ),
              header: Container(
                height: 50.0,
                child: Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                       Text(
                            "${controller.missions[index]["datetime"]}",
                            style: TextStyle(
                                fontSize: 13.0, fontWeight: FontWeight.w500)),
                         Row(
                          children: [
                            Text(
                                "Tong xu thu vao: +${sum["coin"]}",
                                style: TextStyle(
                                    fontSize: 15.0, fontWeight: FontWeight.w500)),
                            Image.asset(Common.pathImg + "ic_coin.png", height: 15.0, width: 15.0,)
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
                    children: (controller.missions[index]["answer"] as List)
                        .map((item) => Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${item["mission"]}", style: TextStyle(color: Colors.black, fontSize: 16.0)),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.all(5.0),
                                child: Text(
                                  "+${item["coin"]}",
                                  style: TextStyle(
                                      color:
                                      Color(Constant.colorTxtSecond), fontSize: 16.0),
                                ),
                              ),
                              Image.asset(
                                Common.pathImg + "ic_coin.png",
                                width: 16.0,
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
