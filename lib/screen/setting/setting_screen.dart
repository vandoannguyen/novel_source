import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/common/constant.dart';
import 'package:init_app/screen/setting/setting_controller.dart';
import 'package:init_app/widgets/appbar_second.dart';
import 'package:init_app/widgets/button_main.dart';

// ignore: must_be_immutable
class SettingScreen extends BaseWidget<SettingController> {
  static const String routeName = '/setting';
  static const String name = 'Cài đặt';
  SettingController controller = Get.put(SettingController());

  @override
  initState({SettingController controller}) {
    return super.initState(controller: controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            appbarSecond(SettingScreen.name),
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
                      Common.pathImg + "ic_edit.png",
                      width: 20.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Expanded(child: Text("Mở khóa bộ nhớ")),
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
                        Common.pathImg + "ic_edit.png",
                        width: 20.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Expanded(child: Text("Xóa bộ nhớ")),
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
                        Common.pathImg + "ic_edit.png",
                        width: 20.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Expanded(child: Text("Quyền sở hữu")),
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
                        Common.pathImg + "ic_edit.png",
                        width: 20.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Expanded(child: Text("Về chúng tôi")),
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
                showDialog(
                  context: context,
                  builder: (BuildContext context) => Dialog(
                    // shape: RoundedRectangleBorder(
                    //     borderRadius:
                    //         BorderRadius.circular(
                    //             0.0)), //this right here
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Chọn Ngôn Ngữ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18.0),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.changeLanguage("INDONESIA");
                            },
                            child: Container(
                              padding:
                                  EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                              child: Text(
                                "Bahasa Indonesia",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  // color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.changeLanguage("LANGUAGE");
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              child: Text(
                                "Tiếng Việt",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  // color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.changeLanguage("Vi");
                            },
                            child: Container(
                              padding:
                                  EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                              child: Text(
                                "Tiếng Việt",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  // color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
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
                      "Chọn ngôn ngữ",
                      style: TextStyle(
                        color: Color(Constant.colorTxtDefault),
                      ),
                    )),
                    Text(
                      "Tiếng Việt",
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
            Container(
              width: double.infinity,
              height: 40.0,
              margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 25.0),
              child: ButtonMain(
                name: "Đăng xuất",
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
