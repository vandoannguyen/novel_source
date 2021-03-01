import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import 'base_controller.dart';

abstract class BaseWidget<C extends BaseController> extends GetWidget<C> {
  C controller;

  @override
  Widget build(BuildContext context, {C controllerSuper}) {
    try {
      controller = Get.find();
      print("get controller ${controller}");
    } catch (err) {
      controllerSuper.context = context;
      initState(controller: (this.controller = controllerSuper));
      this.controller.context = context;
    }
  }

  initState({@required C controller}) {
    Get.lazyPut(() => controller);
  }
}
