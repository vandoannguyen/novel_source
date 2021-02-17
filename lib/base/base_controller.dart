import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class BaseController extends GetxController {
  void showMess(String mess, TypeMess type) {
    Fluttertoast.showToast(
        msg: mess,
        toastLength: Toast.LENGTH_SHORT,
        fontSize: 16,
        textColor: Colors.white,
        backgroundColor: type == TypeMess.INFORMATION
            ? Color(0xAA4CAF50)
            : type == TypeMess.NORMAL
                ? Color(0xAA2196F3)
                : Color(0xAAF44336));
  }
}

enum TypeMess { INFORMATION, WARNING, NORMAL }

class BaseStatus {}

class BaseStatusLoading extends BaseStatus {}

class BaseStatusLoaded extends BaseStatus {
  dynamic value;

  BaseStatusLoaded(this.value);
}

class BaseStatusFailed extends BaseStatus {
  String mess;

  BaseStatusFailed(this.mess);
}
