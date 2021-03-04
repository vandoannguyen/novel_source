import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:init_app/app_localizations.dart';
import 'package:init_app/base/base_controller.dart';
import 'package:init_app/screen/bookstore/detail_comic/invite_friend.dart';
import 'package:init_app/screen/bookstore/detail_comic/loaded_coin.dart';
import 'package:init_app/screen/login/login_screen.dart';
import 'package:init_app/screen/task/dialog_checkin.dart';

import '../../common/common.dart';
import '../../data/repository.dart';

class TaskController extends BaseController {
  // String checkValue = "";
  String date = "";
  bool isCheckdInScreen = false;
  bool isLogin = false;
  List coinDaily;
  dynamic profile;
  TaskController() {
    coinDaily = new List();
    coinDaily += [
      {"name": "20", "value": 20, "status": false},
      {"name": "20", "value": 20, "status": false},
      {"name": "30", "value": 30, "status": false},
      {"name": "30", "value": 30, "status": false},
      {"name": "40", "value": 40, "status": false},
      {"name": "40", "value": 40, "status": false},
      {"name": "60x2", "value": 120, "status": false},
    ];
  }

  // ignore: must_call_super
  onInit() {
    print(" object TaskController");

    DateTime today = DateTime.now();
    date = today.day.toString();
    print(today.day);
    RepositoryImpl.getInstance().getDatetime().then((value) {
      if (value != null) {
        if (today.day.toString() == value) {
          isCheckdInScreen = true;
          print("1");
          update();
        } else {
          isCheckdInScreen = false;
          update();
          print("2");
        }
      }
    });
  }

  void checkInToday() async {
    isCheckdInScreen = true;
    update();
    DateTime today = DateTime.now();
    date = today.day.toString();

    RepositoryImpl.getInstance().getCheckin().then((value) {
      print(value);
      // nếu value== null thì set checkin
      if (value != null) {
        print("valuelanguage$value");
        Common.days = int.parse(value);

        RepositoryImpl.getInstance().getDatetime().then((value) async {
          if (value != null && today.day.toString() == value) {
            // checkValue = value;
            _dialog(
                context,
                "",
                AppLocalizations.of(context).translate(
                    "You have logged in today. Come back tomorrow!"), "img_coin_checked.png");
            // switch (Common.days) {
            //   case 0:
            //     RepositoryImpl.getInstance().setCheckin("1");
            //     Common.coin_checkin += 20;
            //     RepositoryImpl.getInstance().setDatetime(date);
            //     Fluttertoast.showToast(
            //         msg: "You have +20 coin",
            //         toastLength: Toast.LENGTH_SHORT,
            //         textColor: Colors.white,
            //         backgroundColor: Colors.grey,
            //         gravity: ToastGravity.CENTER);
            //     break;
            //   case 1:
            //     RepositoryImpl.getInstance().setCheckin("2");
            //     Common.coin_checkin += 20;
            //     RepositoryImpl.getInstance().setDatetime(date);
            //     Fluttertoast.showToast(
            //         msg: "You have +20 coin",
            //         toastLength: Toast.LENGTH_SHORT,
            //         textColor: Colors.white,
            //         backgroundColor: Colors.grey,
            //         gravity: ToastGravity.CENTER);
            //     break;
            //   case 2:
            //     RepositoryImpl.getInstance().setCheckin("3");
            //     Common.coin_checkin += 20;
            //     RepositoryImpl.getInstance().setDatetime(date);
            //     Fluttertoast.showToast(
            //         msg: "You have +20 coin",
            //         toastLength: Toast.LENGTH_SHORT,
            //         textColor: Colors.white,
            //         backgroundColor: Colors.grey,
            //         gravity: ToastGravity.CENTER);
            //     break;
            //   case 3:
            //     RepositoryImpl.getInstance().setCheckin("4");
            //     Common.coin_checkin += 30;
            //     RepositoryImpl.getInstance().setDatetime(date);
            //     Fluttertoast.showToast(
            //         msg: "You have +30 coin",
            //         toastLength: Toast.LENGTH_SHORT,
            //         textColor: Colors.white,
            //         backgroundColor: Colors.grey,
            //         gravity: ToastGravity.CENTER);
            //     break;
            //   case 4:
            //     RepositoryImpl.getInstance().setCheckin("5");
            //     Common.coin_checkin += 30;
            //     RepositoryImpl.getInstance().setDatetime(date);
            //     Fluttertoast.showToast(
            //         msg: "You have +30 coin",
            //         toastLength: Toast.LENGTH_SHORT,
            //         textColor: Colors.white,
            //         backgroundColor: Colors.grey,
            //         gravity: ToastGravity.CENTER);
            //     break;
            //   case 5:
            //     RepositoryImpl.getInstance().setCheckin("6");
            //     Common.coin_checkin += 40;
            //     RepositoryImpl.getInstance().setDatetime(date);
            //     Fluttertoast.showToast(
            //         msg: "You have +40 coin",
            //         toastLength: Toast.LENGTH_SHORT,
            //         textColor: Colors.white,
            //         backgroundColor: Colors.grey,
            //         gravity: ToastGravity.CENTER);
            //     break;
            //   case 6:
            //     RepositoryImpl.getInstance().setCheckin("7");
            //     Common.coin_checkin += 40;
            //     RepositoryImpl.getInstance().setDatetime(date);
            //     Fluttertoast.showToast(
            //         msg: "You have +40 coin",
            //         toastLength: Toast.LENGTH_SHORT,
            //         textColor: Colors.white,
            //         backgroundColor: Colors.grey,
            //         gravity: ToastGravity.CENTER);
            //     break;
            //   case 7:
            //     RepositoryImpl.getInstance().setCheckin("0");
            //     Common.coin_checkin += 120;
            //     RepositoryImpl.getInstance().setDatetime(date);
            //     Fluttertoast.showToast(
            //         msg: "You have +120 coin",
            //         toastLength: Toast.LENGTH_SHORT,
            //         textColor: Colors.white,
            //         backgroundColor: Colors.grey,
            //         gravity: ToastGravity.CENTER);
            //     break;
            // }
          } else {
            // print("Commondys${Common.days}");
            switch (Common.days) {
              case 0:
                setCheckIn(1);
                break;
              case 1:
                setCheckIn(2);
                break;
              case 2:
                setCheckIn(3);
                break;
              case 3:
                setCheckIn(4);
                break;
              case 4:
                setCheckIn(5);
                break;
              case 5:
                setCheckIn(6);
                break;
              case 6:
                setCheckIn(7);
                break;
              case 7:
                setCheckIn(0);
                break;
            }

            // }
          }
        }).catchError((err) {
          print(err);
        });
      } else {
        setCheckIn(1);
      }
    });
  }

  void _dialog(BuildContext context, title, descriptions,image ) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialogBox(
            title: title,
            descriptions: descriptions,
            text: "OK",
            img: image,
          );
        });
  }

  void incrementDate() {
    RepositoryImpl.getInstance().getCheckin().then((value) {
      print("valuelanguage1111111$value");
      if (value != null) {
        Common.days = int.parse(value);
        print("Common.days${Common.days}");
        switch (Common.days) {
          case 0:
            {
              coinDaily = [
                {"name": "20", "value": 20, "status": false},
                {"name": "20", "value": 20, "status": false},
                {"name": "30", "value": 30, "status": false},
                {"name": "30", "value": 30, "status": false},
                {"name": "40", "value": 40, "status": false},
                {"name": "40", "value": 40, "status": false},
                {"name": "60x2", "value": 120, "status": false},
              ];
              break;
            }
          case 1:
            {
              coinDaily = [
                {"name": "20", "value": 20, "status": true},
                {"name": "20", "value": 20, "status": false},
                {"name": "30", "value": 30, "status": false},
                {"name": "30", "value": 30, "status": false},
                {"name": "40", "value": 40, "status": false},
                {"name": "40", "value": 40, "status": false},
                {"name": "60x2", "value": 120, "status": false},
              ];
              break;
            }
          case 2:
            {
              coinDaily = [
                {"name": "20", "value": 20, "status": true},
                {"name": "20", "value": 20, "status": true},
                {"name": "30", "value": 30, "status": false},
                {"name": "30", "value": 30, "status": false},
                {"name": "40", "value": 40, "status": false},
                {"name": "40", "value": 40, "status": false},
                {"name": "60x2", "value": 120, "status": false},
              ];
              break;
            }
          case 3:
            {
              coinDaily = [
                {"name": "20", "value": 20, "status": true},
                {"name": "20", "value": 20, "status": true},
                {"name": "30", "value": 30, "status": true},
                {"name": "30", "value": 30, "status": false},
                {"name": "40", "value": 40, "status": false},
                {"name": "40", "value": 40, "status": false},
                {"name": "60x2", "value": 120, "status": false},
              ];
              break;
            }
          case 4:
            {
              coinDaily = [
                {"name": "20", "value": 20, "status": true},
                {"name": "20", "value": 20, "status": true},
                {"name": "30", "value": 30, "status": true},
                {"name": "30", "value": 30, "status": true},
                {"name": "40", "value": 40, "status": false},
                {"name": "40", "value": 40, "status": false},
                {"name": "60x2", "value": 120, "status": false},
              ];
              break;
            }
          case 5:
            {
              coinDaily = [
                {"name": "20", "value": 20, "status": true},
                {"name": "20", "value": 20, "status": true},
                {"name": "30", "value": 30, "status": true},
                {"name": "30", "value": 30, "status": true},
                {"name": "40", "value": 40, "status": true},
                {"name": "40", "value": 40, "status": false},
                {"name": "60x2", "value": 120, "status": false},
              ];
              break;
            }
          case 6:
            {
              coinDaily = [
                {"name": "20", "value": 20, "status": true},
                {"name": "20", "value": 20, "status": true},
                {"name": "30", "value": 30, "status": true},
                {"name": "30", "value": 30, "status": true},
                {"name": "40", "value": 40, "status": true},
                {"name": "40", "value": 40, "status": true},
                {"name": "60x2", "value": 120, "status": false},
              ];
              break;
            }
          case 7:
            {
              coinDaily = [
                {"name": "20", "value": 20, "status": true},
                {"name": "20", "value": 20, "status": true},
                {"name": "30", "value": 30, "status": true},
                {"name": "30", "value": 30, "status": true},
                {"name": "40", "value": 40, "status": true},
                {"name": "40", "value": 40, "status": true},
                {"name": "60x2", "value": 120, "status": true},
              ];
              break;
            }
        }
        print(coinDaily);
        update(["check"]);
      } else {
        coinDaily = [
          {"name": "20", "value": 20, "status": false},
          {"name": "20", "value": 20, "status": false},
          {"name": "30", "value": 30, "status": false},
          {"name": "30", "value": 30, "status": false},
          {"name": "40", "value": 40, "status": false},
          {"name": "40", "value": 40, "status": false},
          {"name": "60x2", "value": 120, "status": false},
        ];
        update();
      }
    });
  }

  getCoin(int days) {
    return coinDaily[days - 1]["value"];
  }

  void setCheckIn(int days) async {
    Common.days = days;
    await RepositoryImpl.getInstance().setCheckin("${Common.days}");
    Common.coin += getCoin(Common.days);
    await RepositoryImpl.getInstance().setDatetime(date);
    // Fluttertoast.showToast(
    //     msg: "You have +${getCoin(Common.days)} coin",
    //     toastLength: Toast.LENGTH_SHORT,
    //     textColor: Colors.white,
    //     backgroundColor: Colors.grey,
    //     gravity: ToastGravity.CENTER);
    _dialog(context, "",
        "${AppLocalizations.of(context).translate("Successful attendance! You get")} ${getCoin(Common.days)} coins", "img_coin.png");
    incrementDate();
  }

  // invited friend
  void inviteNext(String tex) async {
    if (Common.isLogedIn) {
      if (tex.contains("invite")) {
        await Get.to(InviteFriend());
      } else {
        await Get.to(LoadedCoin());
      }
      profile["coin"] = Common.coin;
      update();
    } else {
      goLogin();
    }
  }

  void goLogin() async {
    var data = await Get.to(LoginScreen());
    if (data != null) {
      profile = data["value"];
      isLogin = Common.isLogedIn;
      update();
    }
  }
}
