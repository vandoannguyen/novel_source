import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
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
    controller.getTaskHistory();
    //controller.getDetailHistory();
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: GetBuilder<TaskHistoryController>(
        // global: false,
        builder: (__)
    {
      return __.coinHis != null ? Container(
        child: __.coinHis.length > 0 ?
        ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: __.coinHis.length,
            itemBuilder: (BuildContext context, int index) {
              print(__.coinHis);
              double total = 0.0;
              // looping over data array
              __.coinHis.forEach((item){
                //getting the key direectly from the name of the key
                total += item["coin"];
              });
              var datetime = __.coinHis[index]["date"].substring(0,10);
              return ExpandablePanel(
                theme: ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
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
                        padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                "$datetime",
                                style: TextStyle(
                                    fontSize: 16.0)),
                            Row(
                              children: [
                                Text(
                                    "Tong xu thu vao: +$total",
                                    style: TextStyle(
                                        fontSize: 15.0, fontWeight: FontWeight.w500)),
                                Image.asset(
                                  Common.pathImg + "ic_coin.png", height: 16.0,
                                  width: 16.0,)
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
                    padding:
                    EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                    color: Colors.white,
                    child: Column(
                      children: __.coinHis.map<Widget>((coinHis) =>
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${coinHis["name"]} : ${coinHis["title"]} ",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16.0)),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(5.0),
                                      child: Text(
                                        "+${coinHis["coin"]}",
                                        style: TextStyle(
                                            color:
                                            Color(Constant.colorTxtSecond),
                                            fontSize: 16.0),
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
            }):Container(
            child: Center(
              child: Text("Data null"),
            )
        ),

      ) : Container(
          alignment: Alignment.center,
          child: Container(
          child: CircularProgressIndicator(),
      ),
      );
    }
      ),
    );
  }
}
