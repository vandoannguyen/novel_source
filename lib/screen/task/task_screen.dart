import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/screen/bookstore/detail/loaded_coin.dart';
import 'package:init_app/screen/task/task_controller.dart';
import 'package:init_app/widgets/button_main.dart';

import '../../common/constant.dart';

class TaskScreen extends BaseWidget<TaskController> {
  TaskScreen({this.callBack});
  final Function callBack;
  static const String routeName = '/tasks';
  static const String name = 'NHIỆM VỤ';

  TextStyle styleTitle =
      TextStyle(fontSize: 18.0, color: Color(Constant.colorTxtPrimary));

  List<Map<String, dynamic>> coinDaily = [
    {"title": "1 Ngày", "name": "20", "value": 20, "status": true},
    {"title": "2 Ngày", "name": "20", "value": 20, "status": false},
    {"title": "3 Ngày", "name": "30", "value": 30, "status": false},
    {"title": "4 Ngày", "name": "30", "value": 30, "status": false},
    {"title": "5 Ngày", "name": "40", "value": 40, "status": false},
    {"title": "6 Ngày", "name": "40", "value": 40, "status": false},
    {"title": "7 Ngày", "name": "60x2", "value": 120, "status": false},
  ];
  TaskController controller = Get.put(TaskController());
  // TaskController _controller = Get.find();
  @override
  initState({TaskController controller}) {
    print("initState");
    return super.initState(controller: controller);
  }

  @override
  void funcTask(String key) {
    switch (key) {
      case "ANSWER":
        break;
      case "INVITE":
        break;
      case "COIN_FOR_FRIEND":
        onClickCoinFriend(context);
        break;
      case "WATCH_ADS":
        break;
      case "READ_BOOK":
        callBack("GOTO_BOOKCASE", "");
        break;
      default:
    }
  }

  void onClickCoinFriend(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoadedCoin()));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print("object111");
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Common.pathImg + "bg_checkin.jpg"),
                  fit: BoxFit.fill,
                ),
                shape: BoxShape.rectangle,
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.checkInToday();
                    },
                    child: GetBuilder<TaskController>(
                      init: TaskController(), // INIT IT ONLY THE FIRST TIME
                      builder: (controller) => controller.checkToday
                          ? Container(
                              height: 80.0,
                              width: 80.0,
                              margin: EdgeInsets.only(top: 60.0, bottom: 20.0),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      Common.pathImg + "bg_btn_checkined.jpg"),
                                  fit: BoxFit.fill,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "Điểm danh",
                                    style: TextStyle(
                                      color: Color(Constant.colorTxtPrimary),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Icon(
                                    Icons.check_rounded,
                                    color: Color(Constant.colorTxtPrimary),
                                    size: 30.0,
                                  )
                                ],
                              ))
                          : Container(
                              height: 80.0,
                              width: 80.0,
                              margin: EdgeInsets.only(top: 60.0, bottom: 20.0),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      Common.pathImg + "bg_btn_checkin.jpg"),
                                  fit: BoxFit.fill,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                "Điểm danh",
                                style: TextStyle(
                                  color: Color(Constant.colorTxtPrimary),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                    ),
                  ),
                  // list days
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: size.width - 50.0,
                        height: 5.0,
                        color: Color(Constant.colorTxtDefault).withOpacity(0.5),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: coinDaily
                              .map(
                                (item) => new Container(
                                  width: 35.0,
                                  height: 35.0,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: item["status"]
                                        ? Color(Constant.colorTxtSecond)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(50.0),
                                    border: Border.all(
                                      width: item["status"] ? 0 : 1,
                                      color: Color(Constant.colorTxtDefault)
                                          .withOpacity(0.5),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        item["status"]
                                            ? Common.pathImg + "ic_coin.png"
                                            : Common.pathImg +
                                                "ic_coin_grey.png",
                                        width: 12.0,
                                        fit: BoxFit.contain,
                                      ),
                                      Text(
                                        item["name"],
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          color: item["status"]
                                              ? Colors.white
                                              : Color(Constant.colorTxtDefault)
                                                  .withOpacity(0.6),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: coinDaily
                          .map((item) => new Text(
                                item["title"],
                                style: TextStyle(
                                  fontSize: 10.0,
                                  color: Color(Constant.colorTxtDefault)
                                      .withOpacity(0.6),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                  //
                  Container(
                      margin: EdgeInsets.only(top: 10.0, bottom: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Điểm danh liên tục 7 ngày được thưởng gấp đôi",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Color(Constant.colorTxtDefault),
                            ),
                          ),
                          Image.asset(
                            Common.pathImg + "ic_coin.png",
                            width: 18.0,
                            height: 18.0,
                          ),
                        ],
                      ))
                ],
              ),
            ),

            Container(
              color: Colors.white,
              width: size.width,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Text(
                "NHIỆM VỤ NGƯỜI MỚI",
                style: styleTitle,
              ),
            ),
            itemTask(
                icon: "ic_edit.png",
                name: "Câu hỏi khảo sát",
                des: "Thưởng 50",
                btnName: "Trả lời",
                func: () {
                  funcTask("ANSWER", context);
                }),
            // Daily Task
            Container(
              color: Colors.white,
              width: size.width,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Text(
                "NHIỆM VỤ HẰNG NGÀY",
                style: styleTitle,
              ),
            ),
            itemTask(
                icon: "ic_edit.png",
                name: "Mời bạn bè",
                des: "Mời mỗi bạn thưởng 500",
                btnName: "Mời",
                func: () {
                  funcTask("INVITE", context);
                }),
            itemTask(
                icon: "ic_edit.png",
                name: "Thay bạn bè nạp xu",
                des: "Trả lại 20%",
                btnName: "Load cents",
                func: () {
                  funcTask("COIN_FOR_FRIEND", context);
                }),
            itemTask(
                icon: "ic_edit.png",
                name: "Xem quảng cáo nhận xu",
                des: "Mỗi lần xem thưởng 200",
                btnName: "Xem",
                func: () {
                  funcTask("WATCH_ADS", context);
                }),
            itemTask(
                icon: "ic_edit.png",
                name: "Đọc hằng ngày",
                des: "Đọc 20 phút, thưởng 200",
                btnName: "Đọc Ngay",
                func: () {
                  funcTask("READ_BOOK", context);
                }),
          ],
        ),
      ),
    );
  }

  Widget itemTask({icon, name, des, btnName, func}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Color(Constant.colorTxtDefault).withOpacity(0.5),
            width: 0.3,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/" + icon,
            width: 30.0,
            height: 30.0,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      name,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        des,
                        style: TextStyle(
                            fontSize: 13.0,
                            color: Color(Constant.colorTxtPrimary)),
                      ),
                      Image.asset(
                        Common.pathImg + "ic_coin.png",
                        width: 18.0,
                        height: 18.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 100.0,
            child: ButtonMain(
              name: btnName,
              func: func,
              color: Color(Constant.colorTxtPrimary),
            ),
          )
        ],
      ),
    );
  }
}
