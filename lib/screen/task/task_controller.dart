import 'package:fluttertoast/fluttertoast.dart';
import 'package:init_app/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:init_app/screen/task/dialog_checkin.dart';
import '../../common/common.dart';
import '../../data/repository.dart';

class TaskController extends BaseController {
  // String checkValue = "";
  String date = "";
  bool isCheckdInScreen = false;

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

  void checkInToday() {
    isCheckdInScreen = true;
    update();
    DateTime today = DateTime.now();
    date = today.day.toString();
    RepositoryImpl.getInstance().getCheckin().then((value) {
      if (value != null) {
        print("valuelanguage$value");
        Common.days = int.parse(value);
      }
    });
    RepositoryImpl.getInstance().getDatetime().then((value) {
      if (value != null) {
        // checkValue = value;
        if (today.day.toString() == value) {
          _dialog(context);
        } else {
          switch (Common.days) {
            case 0:
              RepositoryImpl.getInstance().setCheckin("1");
              Common.coin_checkin += 20;
              RepositoryImpl.getInstance().setDatetime(date);
              Fluttertoast.showToast(
                  msg: "You have +20 coin",
                  toastLength: Toast.LENGTH_SHORT,
                  textColor: Colors.white,
                  backgroundColor: Colors.grey,
                  gravity: ToastGravity.CENTER);
              break;
            case 1:
              RepositoryImpl.getInstance().setCheckin("2");
              Common.coin_checkin += 20;
              RepositoryImpl.getInstance().setDatetime(date);
              Fluttertoast.showToast(
                  msg: "You have +20 coin",
                  toastLength: Toast.LENGTH_SHORT,
                  textColor: Colors.white,
                  backgroundColor: Colors.grey,
                  gravity: ToastGravity.CENTER);
              break;
            case 2:
              RepositoryImpl.getInstance().setCheckin("3");
              Common.coin_checkin += 20;
              RepositoryImpl.getInstance().setDatetime(date);
              Fluttertoast.showToast(
                  msg: "You have +20 coin",
                  toastLength: Toast.LENGTH_SHORT,
                  textColor: Colors.white,
                  backgroundColor: Colors.grey,
                  gravity: ToastGravity.CENTER);
              break;
            case 3:
              RepositoryImpl.getInstance().setCheckin("4");
              Common.coin_checkin += 30;
              RepositoryImpl.getInstance().setDatetime(date);
              Fluttertoast.showToast(
                  msg: "You have +30 coin",
                  toastLength: Toast.LENGTH_SHORT,
                  textColor: Colors.white,
                  backgroundColor: Colors.grey,
                  gravity: ToastGravity.CENTER);
              break;
            case 4:
              RepositoryImpl.getInstance().setCheckin("5");
              Common.coin_checkin += 30;
              RepositoryImpl.getInstance().setDatetime(date);
              Fluttertoast.showToast(
                  msg: "You have +30 coin",
                  toastLength: Toast.LENGTH_SHORT,
                  textColor: Colors.white,
                  backgroundColor: Colors.grey,
                  gravity: ToastGravity.CENTER);
              break;
            case 5:
              RepositoryImpl.getInstance().setCheckin("6");
              Common.coin_checkin += 40;
              RepositoryImpl.getInstance().setDatetime(date);
              Fluttertoast.showToast(
                  msg: "You have +40 coin",
                  toastLength: Toast.LENGTH_SHORT,
                  textColor: Colors.white,
                  backgroundColor: Colors.grey,
                  gravity: ToastGravity.CENTER);
              break;
            case 6:
              RepositoryImpl.getInstance().setCheckin("7");
              Common.coin_checkin += 40;
              RepositoryImpl.getInstance().setDatetime(date);
              Fluttertoast.showToast(
                  msg: "You have +40 coin",
                  toastLength: Toast.LENGTH_SHORT,
                  textColor: Colors.white,
                  backgroundColor: Colors.grey,
                  gravity: ToastGravity.CENTER);
              break;
            case 7:
              RepositoryImpl.getInstance().setCheckin("0");
              Common.coin_checkin += 120;
              RepositoryImpl.getInstance().setDatetime(date);
              Fluttertoast.showToast(
                  msg: "You have +120 coin",
                  toastLength: Toast.LENGTH_SHORT,
                  textColor: Colors.white,
                  backgroundColor: Colors.grey,
                  gravity: ToastGravity.CENTER);
              break;
          }
        }
      } else {
        switch (Common.days) {
          case 0:
            RepositoryImpl.getInstance().setCheckin("1");
            Common.coin_checkin += 20;
            RepositoryImpl.getInstance().setDatetime(date);
            Fluttertoast.showToast(
                msg: "You have +20 coin",
                toastLength: Toast.LENGTH_SHORT,
                textColor: Colors.white,
                backgroundColor: Colors.grey,
                gravity: ToastGravity.CENTER);
            break;
          case 1:
            RepositoryImpl.getInstance().setCheckin("2");
            Common.coin_checkin += 20;
            RepositoryImpl.getInstance().setDatetime(date);
            Fluttertoast.showToast(
                msg: "You have +20 coin",
                toastLength: Toast.LENGTH_SHORT,
                textColor: Colors.white,
                backgroundColor: Colors.grey,
                gravity: ToastGravity.CENTER);
            break;
          case 2:
            RepositoryImpl.getInstance().setCheckin("3");
            Common.coin_checkin += 20;
            RepositoryImpl.getInstance().setDatetime(date);
            Fluttertoast.showToast(
                msg: "You have +20 coin",
                toastLength: Toast.LENGTH_SHORT,
                textColor: Colors.white,
                backgroundColor: Colors.grey,
                gravity: ToastGravity.CENTER);
            break;
          case 3:
            RepositoryImpl.getInstance().setCheckin("4");
            Common.coin_checkin += 30;
            RepositoryImpl.getInstance().setDatetime(date);
            Fluttertoast.showToast(
                msg: "You have +30 coin",
                toastLength: Toast.LENGTH_SHORT,
                textColor: Colors.white,
                backgroundColor: Colors.grey,
                gravity: ToastGravity.CENTER);
            break;
          case 4:
            RepositoryImpl.getInstance().setCheckin("5");
            Common.coin_checkin += 30;
            RepositoryImpl.getInstance().setDatetime(date);
            Fluttertoast.showToast(
                msg: "You have +30 coin",
                toastLength: Toast.LENGTH_SHORT,
                textColor: Colors.white,
                backgroundColor: Colors.grey,
                gravity: ToastGravity.CENTER);
            break;
          case 5:
            RepositoryImpl.getInstance().setCheckin("6");
            Common.coin_checkin += 40;
            RepositoryImpl.getInstance().setDatetime(date);
            Fluttertoast.showToast(
                msg: "You have +40 coin",
                toastLength: Toast.LENGTH_SHORT,
                textColor: Colors.white,
                backgroundColor: Colors.grey,
                gravity: ToastGravity.CENTER);
            break;
          case 6:
            RepositoryImpl.getInstance().setCheckin("7");
            Common.coin_checkin += 40;
            RepositoryImpl.getInstance().setDatetime(date);
            Fluttertoast.showToast(
                msg: "You have +40 coin",
                toastLength: Toast.LENGTH_SHORT,
                textColor: Colors.white,
                backgroundColor: Colors.grey,
                gravity: ToastGravity.CENTER);
            break;
          case 7:
            RepositoryImpl.getInstance().setCheckin("0");
            Common.coin_checkin += 120;
            RepositoryImpl.getInstance().setDatetime(date);
            Fluttertoast.showToast(
                msg: "You have +120 coin",
                toastLength: Toast.LENGTH_SHORT,
                textColor: Colors.white,
                backgroundColor: Colors.grey,
                gravity: ToastGravity.CENTER);
            break;
        }
      }
    });
    // if (date == checkValue) {
    //   _dialog(context);
    // }
    // else{
    //   isCheckdInScreen = true;
    //   update(); // use update() to update counter variable on UI when increment be called
    //
    // }
  }

  void _dialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
      return CustomDialogBox(
        title: "Messenger",
        descriptions: "Bạn đã đăng nhập hôm nay rồi. Quay trở lại vào ngày mai nhé!!!",
        text: "OK",
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
}
