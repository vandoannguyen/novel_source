import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/app_localizations.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/common/constant.dart';
import 'package:init_app/screen/setting/setting_controller.dart';
import 'package:init_app/widgets/appbar_second.dart';
import 'package:init_app/widgets/button_main.dart';

// ignore: must_be_immutable
class SettingScreen extends BaseWidget<SettingController> {
  static const String routeName = '/setting';
  static const String name = 'settings';

  @override
  Widget build(BuildContext context, {controllerSuper}) {
    super.build(context, controllerSuper: SettingController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            appbarSecond(AppLocalizations.of(context).translate(name)),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    color: Color(Constant.colorTxtDefault).withOpacity(0.5),
                    width: 0.3,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(15.0),
                    child: Image.asset(
                      Common.pathImg + "ic_lock.png",
                      width: 20.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Expanded(child: Text(AppLocalizations.of(context).translate("auto unlock"))),
                  Container(
                    margin: EdgeInsets.all(5.0),
                    child: GetBuilder<SettingController>(
                      builder: (_) => Switch(
                        value: controller.autoLock,
                        onChanged: (value) {
                          controller.clickItem("AUTO_LOCK");
                        },
                        activeTrackColor: Colors.green[400],
                        activeColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                controller.clickItem("DELETE_MEMORY");
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 0.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(
                      color: Color(Constant.colorTxtDefault).withOpacity(0.5),
                      width: 0.3,
                    ),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(15.0),
                      child: Image.asset(
                        Common.pathImg + "ic_trash.png",
                        width: 20.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Expanded(child: Text(AppLocalizations.of(context).translate("delete memory"))),
                    Text(
                      "0B",
                      style: TextStyle(
                        color: Color(Constant.colorTxtDefault),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.navigate_next_rounded,
                        color: Color(Constant.colorTxtDefault),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                controller.clickItem("OWNERSHIP");
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 0.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(
                      color: Color(Constant.colorTxtDefault).withOpacity(0.5),
                      width: 0.3,
                    ),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(15.0),
                      child: Image.asset(
                        Common.pathImg + "ic_ownership.png",
                        width: 20.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Expanded(child: Text(AppLocalizations.of(context).translate("ownership"),),),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.navigate_next_rounded,
                        color: Color(Constant.colorTxtDefault),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                controller.clickItem("ABOUT_US");
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 0.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(
                      color: Color(Constant.colorTxtDefault).withOpacity(0.5),
                      width: 0.3,
                    ),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(15.0),
                      child: Image.asset(
                        Common.pathImg + "ic_us.png",
                        width: 20.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Expanded(child: Text(AppLocalizations.of(context).translate("about us"),),),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.navigate_next_rounded,
                        color: Color(Constant.colorTxtDefault),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                controller.changeLanguage(context);
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(
                      color: Color(Constant.colorTxtDefault).withOpacity(0.5),
                      width: 0.3,
                    ),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Text(
                      AppLocalizations.of(context).translate("choose language"),
                      style: TextStyle(
                        color: Color(Constant.colorTxtDefault),
                      ),
                    )),
                    GetBuilder<SettingController>(
                        builder: (_) => Text(
                              controller.language,
                              style: TextStyle(
                                color: Color(Constant.colorTxtDefault),
                              ),
                            )),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.navigate_next_rounded,
                        color: Color(Constant.colorTxtDefault),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 40.0,
              margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 25.0),
              child: ButtonMain(
                name: AppLocalizations.of(context).translate("logout"),
                color: Color(Constant.colorTxtSecond),
                txtSize: 16.0,
                func: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
