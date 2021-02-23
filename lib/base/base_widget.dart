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
    controllerSuper.context = context;
    initState(controller: controllerSuper);
  }

  initState({@required C controller}) {
    this.controller = controller;
    Get.create(() => controller);
  }
}
