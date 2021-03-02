import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/app_localizations.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/screen/survey_question/survey_question_screen.dart';
import 'package:init_app/screen/task/task_controller.dart';
import 'package:init_app/widgets/button_main.dart';

import '../../common/common.dart';
import '../../common/constant.dart';

class TaskScreen extends BaseWidget<TaskController> {
  TaskScreen({this.callBack});

  final Function callBack;
  static const String routeName = '/tasks';
  static const String name = 'tasks';
  TextStyle styleTitle = TextStyle(fontSize: 18.0, color: Color(Constant.colorTxtPrimary));

  void _incrementDate() {
    controller.incrementDate();
  }

  @override
  void funcTask(String key, BuildContext context) {
    switch (key) {
      case "ANSWER":
        onClickIntent(context, "ANSWER");
        break;
      case "INVITE":
        onClickIntent(context, "INVITE");
        break;
      case "COIN_FOR_FRIEND":
        onClickIntent(context, "COIN_FOR_FRIEND");
        break;
      case "WATCH_ADS":
        break;
      case "READ_BOOK":
        callBack("GOTO_BOOKCASE", "");
        break;
      default:
    }
  }

  void onClickIntent(BuildContext context, String name) {
    switch (name) {
      case "ANSWER":
        Navigator.push(context, MaterialPageRoute(builder: (context) => SurveyQuestionScreen()));
        break;
      case "INVITE":
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => InviteFriend()));
        controller.inviteNext("invite");
        break;
      case "COIN_FOR_FRIEND":
        controller.inviteNext("loadedcoin");
        break;
    }
  }

  @override
  Widget build(BuildContext context, {controllerSuper}) {
    super.build(context, controllerSuper: TaskController());
    _incrementDate();
    var size = MediaQuery.of(context).size;
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
                      // _incrementDate();
                    },
                    child: GetBuilder<TaskController>(
                      // init: TaskController(), // INIT IT ONLY THE FIRST TIME
                      builder: (_) => _.isCheckdInScreen
                          ? Container(
                              height: 90.0,
                              width: 90.0,
                              margin: EdgeInsets.only(top: 60.0, bottom: 20.0),
                              padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 10.0),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(Common.pathImg + "bg_btn_checkined.png"),
                                  fit: BoxFit.fill,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    AppLocalizations.of(context).translate("checkin"),
                                    style: TextStyle(
                                      color: Color(Constant.colorTxtPrimary),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Icon(
                                    Icons.check_rounded,
                                    color: Color(Constant.colorTxtPrimary),
                                    size: 26.0,
                                  ),
                                ],
                              ))
                          : Container(
                              height: 90.0,
                              width: 90.0,
                              margin: EdgeInsets.only(top: 60.0, bottom: 20.0),
                                 padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(Common.pathImg + "bg_btn_checkin.png"),
                                  fit: BoxFit.fill,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                AppLocalizations.of(context).translate("checkin"),
                                style: TextStyle(
                                  color: Colors.white,
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
                      GetBuilder<TaskController>(
                        id: "check",
                        builder: (_) {
                          print(_.coinDaily);
                          return Container(
                            padding: EdgeInsets.symmetric(vertical: 0.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: _.coinDaily
                                  .map(
                                    (item) => new Container(
                                      width: 35.0,
                                      height: 35.0,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: item["status"] ? Color(Constant.colorTxtSecond) : Colors.white,
                                        borderRadius: BorderRadius.circular(50.0),
                                        border: Border.all(
                                          width: item["status"] ? 0 : 1,
                                          color: Color(Constant.colorTxtDefault).withOpacity(0.5),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            item["status"] ? Common.pathImg + "ic_coin.png" : Common.pathImg + "ic_coin_grey.png",
                                            width: 12.0,
                                            fit: BoxFit.contain,
                                          ),
                                          Text(
                                            item["name"],
                                            style: TextStyle(
                                              fontSize: 10.0,
                                              color: item["status"] ? Colors.white : Color(Constant.colorTxtDefault).withOpacity(0.6),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  GetBuilder<TaskController>(
                    builder: (_) => Container(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: _.coinDaily
                            .map((item) => new Text(
                                  "${_.coinDaily.indexOf(item) + 1} ${AppLocalizations.of(context).translate("day")}",
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    color: Color(Constant.colorTxtDefault).withOpacity(0.6),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 10.0, bottom: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context).translate("7 consecutive days attendance will be rewarded twice as much"),
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
                      ),),
                ],
              ),
            ),

            Container(
              color: Colors.white,
              width: size.width,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
              child: Text(
                AppLocalizations.of(context).translate("tasks for new user"),
                style: styleTitle,
              ),
            ),
            itemTask(
                icon: "conversation.png",
                name: AppLocalizations.of(context).translate("survey question"),
                des: "${AppLocalizations.of(context).translate("reward")} 50",
                btnName: AppLocalizations.of(context).translate("answer"),
                func: () {
                  funcTask("ANSWER", context);
                }),
            // Daily Task
            SizedBox(height: 5.0),
            Container(
              color: Colors.white,
              width: size.width,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
              child: Text(
                AppLocalizations.of(context).translate("daily tasks"),
                style: styleTitle,
              ),
            ),
            itemTask(
                icon: "adduser.png",
                name: AppLocalizations.of(context).translate("Invite friends"),
                des: "${AppLocalizations.of(context).translate("Invite each friend to reward")} 500",
                btnName: AppLocalizations.of(context).translate("invite"),
                func: () {
                  funcTask("INVITE", context);
                }),
            itemTask(
                icon: "income.png",
                name: AppLocalizations.of(context).translate("Replace your friends to deposit coins"),
                des: "${AppLocalizations.of(context).translate("Receive")} 20%",
                btnName: AppLocalizations.of(context).translate("deposit coin"),
                func: () {
                  funcTask("COIN_FOR_FRIEND", context);
                }),
            itemTask(
                icon: "onlinevideo.png",
                name: AppLocalizations.of(context).translate("Watch ads to receive coins"),
                des: "${AppLocalizations.of(context).translate("Each view rewards")} 200",
                btnName: AppLocalizations.of(context).translate("watch"),
                func: () {
                  funcTask("WATCH_ADS", context);
                }),
            itemTask(
                icon: "bookday.png",
                name: AppLocalizations.of(context).translate("Read every day"),
                des: AppLocalizations.of(context).translate("Read 20 minutes, reward 200"),
                btnName: AppLocalizations.of(context).translate("read now"),
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
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
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
            Common.pathImg + icon,
            width: 20.0,
            height: 20.0,
            color: Colors.pink,
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
                        style: TextStyle(fontSize: 13.0, color: Color(Constant.colorTxtPrimary)),
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
            height: 30.0,
            child: ButtonMain(
              name: btnName,
              func: func,
              color: Color(Constant.colorTxtPrimary),
            ),
          ),
        ],
      ),
    );
  }
}
