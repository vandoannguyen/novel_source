import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import 'base_controller.dart';

abstract class BaseWidget<C extends BaseController> extends GetWidget<C> {
  C controller;

  initState({@required C controller}) {
    this.controller = controller;
    Get.put(controller);
  }
}
