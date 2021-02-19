import 'package:flutter/material.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/common/images.dart';

import 'load_controller.dart';

class LoadScreen extends BaseWidget<LoadController> {
  static const String routeName = "/load";

  @override
  Widget build(BuildContext context) {
    initState(controller: LoadController());
    controller.login(context);
    Future.delayed(Duration(seconds: 2), controller.getLaguage(context));
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Container(
                    width: 100,
                    height: 100,
                    child: ic_launcher,
                  ),
                ),
                flex: 1,
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                        ),
                      )))
            ],
          ),
        ),
      ),
    );
  }

  void showDialogLanguage() {}
}
