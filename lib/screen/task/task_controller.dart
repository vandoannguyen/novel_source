import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:init_app/base/base_controller.dart';
import 'package:init_app/screen/task/dialog_checkin.dart';

import '../../common/common.dart';
import '../../data/repository.dart';

class TaskController extends BaseController {
  // String checkValue = "";
  String date = "";
  bool isCheckdInScreen = false;
  List coinDaily;
  TaskController() {
    coinDaily = new List();
    coinDaily += [
      {"title": "1 Ngày", "name": "20", "value": 20, "status": false},
      {"title": "2 Ngày", "name": "20", "value": 20, "status": false},
      {"title": "3 Ngày", "name": "30", "value": 30, "status": false},
      {"title": "4 Ngày", "name": "30", "value": 30, "status": false},
      {"title": "5 Ngày", "name": "40", "value": 40, "status": false},
      {"title": "6 Ngày", "name": "40", "value": 40, "status": false},
      {"title": "7 Ngày", "name": "60x2", "value": 120, "status": false},
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
    print("checkInToday");
    RepositoryImpl.getInstance().getCheckin().then((value) {
      print(value);
      // nếu value== null thì set checkin
      if (value != null) {
        print("valuelanguage$value");
        Common.days = int.parse(value);
        RepositoryImpl.getInstance().getDatetime().then((value) async {
          if (value != null && today.day.toString() == value) {
            // checkValue = value;
            _dialog(context);
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
            setCheckIn(Common.days);

            //   switch (Common.days) {
            //     case 0:
            //       RepositoryImpl.getInstance().setCheckin("1");
            //       Common.coin_checkin += 20;
            //       RepositoryImpl.getInstance().setDatetime(date);
            //       Fluttertoast.showToast(
            //           msg: "You have +20 coin",
            //           toastLength: Toast.LENGTH_SHORT,
            //           textColor: Colors.white,
            //           backgroundColor: Colors.grey,
            //           gravity: ToastGravity.CENTER);
            //       break;
            //     case 1:
            //       RepositoryImpl.getInstance().setCheckin("2");
            //       Common.coin_checkin += 20;
            //       RepositoryImpl.getInstance().setDatetime(date);
            //       Fluttertoast.showToast(
            //           msg: "You have +20 coin",
            //           toastLength: Toast.LENGTH_SHORT,
            //           textColor: Colors.white,
            //           backgroundColor: Colors.grey,
            //           gravity: ToastGravity.CENTER);
            //       break;
            //     case 2:
            //       RepositoryImpl.getInstance().setCheckin("3");
            //       Common.coin_checkin += 20;
            //       RepositoryImpl.getInstance().setDatetime(date);
            //       Fluttertoast.showToast(
            //           msg: "You have +20 coin",
            //           toastLength: Toast.LENGTH_SHORT,
            //           textColor: Colors.white,
            //           backgroundColor: Colors.grey,
            //           gravity: ToastGravity.CENTER);
            //       break;
            //     case 3:
            //       RepositoryImpl.getInstance().setCheckin("4");
            //       Common.coin_checkin += 30;
            //       RepositoryImpl.getInstance().setDatetime(date);
            //       Fluttertoast.showToast(
            //           msg: "You have +30 coin",
            //           toastLength: Toast.LENGTH_SHORT,
            //           textColor: Colors.white,
            //           backgroundColor: Colors.grey,
            //           gravity: ToastGravity.CENTER);
            //       break;
            //     case 4:
            //       RepositoryImpl.getInstance().setCheckin("5");
            //       Common.coin_checkin += 30;
            //       RepositoryImpl.getInstance().setDatetime(date);
            //       Fluttertoast.showToast(
            //           msg: "You have +30 coin",
            //           toastLength: Toast.LENGTH_SHORT,
            //           textColor: Colors.white,
            //           backgroundColor: Colors.grey,
            //           gravity: ToastGravity.CENTER);
            //       break;
            //     case 5:
            //       RepositoryImpl.getInstance().setCheckin("6");
            //       Common.coin_checkin += 40;
            //       RepositoryImpl.getInstance().setDatetime(date);
            //       Fluttertoast.showToast(
            //           msg: "You have +40 coin",
            //           toastLength: Toast.LENGTH_SHORT,
            //           textColor: Colors.white,
            //           backgroundColor: Colors.grey,
            //           gravity: ToastGravity.CENTER);
            //       break;
            //     case 6:
            //       RepositoryImpl.getInstance().setCheckin("7");
            //       Common.coin_checkin += 40;
            //       RepositoryImpl.getInstance().setDatetime(date);
            //       Fluttertoast.showToast(
            //           msg: "You have +40 coin",
            //           toastLength: Toast.LENGTH_SHORT,
            //           textColor: Colors.white,
            //           backgroundColor: Colors.grey,
            //           gravity: ToastGravity.CENTER);
            //       break;
            //     case 7:
            //       RepositoryImpl.getInstance().setCheckin("0");
            //       Common.coin_checkin += 120;
            //       RepositoryImpl.getInstance().setDatetime(date);
            //       Fluttertoast.showToast(
            //           msg: "You have +120 coin",
            //           toastLength: Toast.LENGTH_SHORT,
            //           textColor: Colors.white,
            //           backgroundColor: Colors.grey,
            //           gravity: ToastGravity.CENTER);
            //       break;
            //   }
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

  void _dialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialogBox(
            title: "Messenger",
            descriptions: "Bạn đã đăng nhập hôm nay rồi. Quay trở lại vào ngày mai nhé!!!",
            text: "OK",
            img: Image.asset(Common.pathImg + "icon.png"),
          );
          // return AlertDialog(
          //   shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.all(Radius.circular(20.0))),
          //   backgroundColor: Colors.white,
          //   content: Container(
          //     height: 200,
          //     width: 200,
          //     decoration: BoxDecoration(),
          //     child: Center(
          //         child: Text(
          //             "Bạn đã đăng nhập hôm nay rồi. Quay trở lại vào ngày mai nhé!!!")),
          //   ),
          //   title: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text("Message"),
          //       IconButton(
          //           icon: Icon(Icons.close),
          //           onPressed: () {
          //             Navigator.pop(context);
          //           })
          //     ],
          //   ),
          // );
        });
  }

  void funcTask(String key) {
    switch (key) {
      case "ANSWER":
        break;
      case "INVITE":
        break;
      case "COIN_FOR_FRIEND":
        break;
      case "WATCH_ADS":
        break;
      case "READ_BOOK":
        break;
      default:
    }
  }

  void incrementDate() {
    print("incrementDate");
    RepositoryImpl.getInstance().getCheckin().then((value) {
      print("valuelanguage1111111$value");
      if (value != null) {
        Common.days = int.parse(value);
        print("Common.days${Common.days}");
        switch (Common.days) {
          case 0:
            {
              coinDaily = [
                {"title": "1 Ngày", "name": "20", "value": 20, "status": false},
                {"title": "2 Ngày", "name": "20", "value": 20, "status": false},
                {"title": "3 Ngày", "name": "30", "value": 30, "status": false},
                {"title": "4 Ngày", "name": "30", "value": 30, "status": false},
                {"title": "5 Ngày", "name": "40", "value": 40, "status": false},
                {"title": "6 Ngày", "name": "40", "value": 40, "status": false},
                {"title": "7 Ngày", "name": "60x2", "value": 120, "status": false},
              ];
              break;
            }
          case 1:
            {
              coinDaily = [
                {"title": "1 Ngày", "name": "20", "value": 20, "status": true},
                {"title": "2 Ngày", "name": "20", "value": 20, "status": false},
                {"title": "3 Ngày", "name": "30", "value": 30, "status": false},
                {"title": "4 Ngày", "name": "30", "value": 30, "status": false},
                {"title": "5 Ngày", "name": "40", "value": 40, "status": false},
                {"title": "6 Ngày", "name": "40", "value": 40, "status": false},
                {"title": "7 Ngày", "name": "60x2", "value": 120, "status": false},
              ];
              break;
            }
          case 2:
            {
              coinDaily = [
                {"title": "1 Ngày", "name": "20", "value": 20, "status": true},
                {"title": "2 Ngày", "name": "20", "value": 20, "status": true},
                {"title": "3 Ngày", "name": "30", "value": 30, "status": false},
                {"title": "4 Ngày", "name": "30", "value": 30, "status": false},
                {"title": "5 Ngày", "name": "40", "value": 40, "status": false},
                {"title": "6 Ngày", "name": "40", "value": 40, "status": false},
                {"title": "7 Ngày", "name": "60x2", "value": 120, "status": false},
              ];
              break;
            }
          case 3:
            {
              coinDaily = [
                {"title": "1 Ngày", "name": "20", "value": 20, "status": true},
                {"title": "2 Ngày", "name": "20", "value": 20, "status": true},
                {"title": "3 Ngày", "name": "30", "value": 30, "status": true},
                {"title": "4 Ngày", "name": "30", "value": 30, "status": false},
                {"title": "5 Ngày", "name": "40", "value": 40, "status": false},
                {"title": "6 Ngày", "name": "40", "value": 40, "status": false},
                {"title": "7 Ngày", "name": "60x2", "value": 120, "status": false},
              ];
              break;
            }
          case 4:
            {
              coinDaily = [
                {"title": "1 Ngày", "name": "20", "value": 20, "status": true},
                {"title": "2 Ngày", "name": "20", "value": 20, "status": true},
                {"title": "3 Ngày", "name": "30", "value": 30, "status": true},
                {"title": "4 Ngày", "name": "30", "value": 30, "status": true},
                {"title": "5 Ngày", "name": "40", "value": 40, "status": false},
                {"title": "6 Ngày", "name": "40", "value": 40, "status": false},
                {"title": "7 Ngày", "name": "60x2", "value": 120, "status": false},
              ];
              break;
            }
          case 5:
            {
              coinDaily = [
                {"title": "1 Ngày", "name": "20", "value": 20, "status": true},
                {"title": "2 Ngày", "name": "20", "value": 20, "status": true},
                {"title": "3 Ngày", "name": "30", "value": 30, "status": true},
                {"title": "4 Ngày", "name": "30", "value": 30, "status": true},
                {"title": "5 Ngày", "name": "40", "value": 40, "status": true},
                {"title": "6 Ngày", "name": "40", "value": 40, "status": false},
                {"title": "7 Ngày", "name": "60x2", "value": 120, "status": false},
              ];
              break;
            }
          case 6:
            {
              coinDaily = [
                {"title": "1 Ngày", "name": "20", "value": 20, "status": true},
                {"title": "2 Ngày", "name": "20", "value": 20, "status": true},
                {"title": "3 Ngày", "name": "30", "value": 30, "status": true},
                {"title": "4 Ngày", "name": "30", "value": 30, "status": true},
                {"title": "5 Ngày", "name": "40", "value": 40, "status": true},
                {"title": "6 Ngày", "name": "40", "value": 40, "status": true},
                {"title": "7 Ngày", "name": "60x2", "value": 120, "status": false},
              ];
              break;
            }
          case 7:
            {
              coinDaily = [
                {"title": "1 Ngày", "name": "20", "value": 20, "status": true},
                {"title": "2 Ngày", "name": "20", "value": 20, "status": true},
                {"title": "3 Ngày", "name": "30", "value": 30, "status": true},
                {"title": "4 Ngày", "name": "30", "value": 30, "status": true},
                {"title": "5 Ngày", "name": "40", "value": 40, "status": true},
                {"title": "6 Ngày", "name": "40", "value": 40, "status": true},
                {"title": "7 Ngày", "name": "60x2", "value": 120, "status": true},
              ];
              break;
            }
        }
        print(coinDaily);
        update(["check"]);
        // if (Common.days == 1) {
        //   coinDaily = [
        //     {"title": "1 Ngày", "name": "20", "value": 20, "status": true},
        //     {"title": "2 Ngày", "name": "20", "value": 20, "status": false},
        //     {"title": "3 Ngày", "name": "30", "value": 30, "status": false},
        //     {"title": "4 Ngày", "name": "30", "value": 30, "status": false},
        //     {"title": "5 Ngày", "name": "40", "value": 40, "status": false},
        //     {"title": "6 Ngày", "name": "40", "value": 40, "status": false},
        //     {"title": "7 Ngày", "name": "60x2", "value": 120, "status": false},
        //   ];
        // } else if (Common.days == 2) {
        //   coinDaily = [
        //     {"title": "1 Ngày", "name": "20", "value": 20, "status": true},
        //     {"title": "2 Ngày", "name": "20", "value": 20, "status": true},
        //     {"title": "3 Ngày", "name": "30", "value": 30, "status": false},
        //     {"title": "4 Ngày", "name": "30", "value": 30, "status": false},
        //     {"title": "5 Ngày", "name": "40", "value": 40, "status": false},
        //     {"title": "6 Ngày", "name": "40", "value": 40, "status": false},
        //     {"title": "7 Ngày", "name": "60x2", "value": 120, "status": false},
        //   ];
        // } else if (Common.days == 3) {
        //   coinDaily = [
        //     {"title": "1 Ngày", "name": "20", "value": 20, "status": true},
        //     {"title": "2 Ngày", "name": "20", "value": 20, "status": true},
        //     {"title": "3 Ngày", "name": "30", "value": 30, "status": true},
        //     {"title": "4 Ngày", "name": "30", "value": 30, "status": false},
        //     {"title": "5 Ngày", "name": "40", "value": 40, "status": false},
        //     {"title": "6 Ngày", "name": "40", "value": 40, "status": false},
        //     {"title": "7 Ngày", "name": "60x2", "value": 120, "status": false},
        //   ];
        // } else if (Common.days == 4) {
        //   coinDaily = [
        //     {"title": "1 Ngày", "name": "20", "value": 20, "status": true},
        //     {"title": "2 Ngày", "name": "20", "value": 20, "status": true},
        //     {"title": "3 Ngày", "name": "30", "value": 30, "status": true},
        //     {"title": "4 Ngày", "name": "30", "value": 30, "status": true},
        //     {"title": "5 Ngày", "name": "40", "value": 40, "status": false},
        //     {"title": "6 Ngày", "name": "40", "value": 40, "status": false},
        //     {"title": "7 Ngày", "name": "60x2", "value": 120, "status": false},
        //   ];
        // } else if (Common.days == 5) {
        //   coinDaily = [
        //     {"title": "1 Ngày", "name": "20", "value": 20, "status": true},
        //     {"title": "2 Ngày", "name": "20", "value": 20, "status": true},
        //     {"title": "3 Ngày", "name": "30", "value": 30, "status": true},
        //     {"title": "4 Ngày", "name": "30", "value": 30, "status": true},
        //     {"title": "5 Ngày", "name": "40", "value": 40, "status": true},
        //     {"title": "6 Ngày", "name": "40", "value": 40, "status": false},
        //     {"title": "7 Ngày", "name": "60x2", "value": 120, "status": false},
        //   ];
        // } else if (Common.days == 6) {
        //   coinDaily = [
        //     {"title": "1 Ngày", "name": "20", "value": 20, "status": true},
        //     {"title": "2 Ngày", "name": "20", "value": 20, "status": true},
        //     {"title": "3 Ngày", "name": "30", "value": 30, "status": true},
        //     {"title": "4 Ngày", "name": "30", "value": 30, "status": true},
        //     {"title": "5 Ngày", "name": "40", "value": 40, "status": true},
        //     {"title": "6 Ngày", "name": "40", "value": 40, "status": true},
        //     {"title": "7 Ngày", "name": "60x2", "value": 120, "status": false},
        //   ];
        // } else if (Common.days == 7) {
        //   coinDaily = [
        //     {"title": "1 Ngày", "name": "20", "value": 20, "status": true},
        //     {"title": "2 Ngày", "name": "20", "value": 20, "status": true},
        //     {"title": "3 Ngày", "name": "30", "value": 30, "status": true},
        //     {"title": "4 Ngày", "name": "30", "value": 30, "status": true},
        //     {"title": "5 Ngày", "name": "40", "value": 40, "status": true},
        //     {"title": "6 Ngày", "name": "40", "value": 40, "status": true},
        //     {"title": "7 Ngày", "name": "60x2", "value": 120, "status": true},
        //   ];
        // } else if (Common.days == 0) {
        //   coinDaily = [
        //     {"title": "1 Ngày", "name": "20", "value": 20, "status": false},
        //     {"title": "2 Ngày", "name": "20", "value": 20, "status": false},
        //     {"title": "3 Ngày", "name": "30", "value": 30, "status": false},
        //     {"title": "4 Ngày", "name": "30", "value": 30, "status": false},
        //     {"title": "5 Ngày", "name": "40", "value": 40, "status": false},
        //     {"title": "6 Ngày", "name": "40", "value": 40, "status": false},
        //     {"title": "7 Ngày", "name": "60x2", "value": 120, "status": false},
        //   ];
        // }
        // update();
      } else {
        coinDaily = [
          {"title": "1 Ngày", "name": "20", "value": 20, "status": false},
          {"title": "2 Ngày", "name": "20", "value": 20, "status": false},
          {"title": "3 Ngày", "name": "30", "value": 30, "status": false},
          {"title": "4 Ngày", "name": "30", "value": 30, "status": false},
          {"title": "5 Ngày", "name": "40", "value": 40, "status": false},
          {"title": "6 Ngày", "name": "40", "value": 40, "status": false},
          {"title": "7 Ngày", "name": "60x2", "value": 120, "status": false},
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
    Common.coin_checkin += getCoin(Common.days);
    await RepositoryImpl.getInstance().setDatetime(date);
    Fluttertoast.showToast(
        msg: "You have +${getCoin(Common.days)} coin",
        toastLength: Toast.LENGTH_SHORT,
        textColor: Colors.white,
        backgroundColor: Colors.grey,
        gravity: ToastGravity.CENTER);
    incrementDate();
  }
}
