import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/common/constant.dart';
import 'package:init_app/screen/setting/setting_controller.dart';
import 'package:init_app/screen/tutorial_buy_coin/tutorial_buy_coin_controller.dart';
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

  void a() {
    print("object");
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
                  Expanded(child: Text(name)),
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
              onTap: () {},
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
              onTap: () {},
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
              onTap: () {},
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
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
              child: ButtonMain(
                  name: "Đăng xuất",
                  func: () {},
                  color: Color(Constant.colorTxtSecond)),
            ),
          ],
        ),
      ),
    );
  }
}
