import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/common/constant.dart';
import 'package:init_app/screen/about_us/about_us_controller.dart';
import 'package:init_app/widgets/appbar_second.dart';

class AboutUsScreen extends BaseWidget<AboutUsController> {
  static const String routeName = '/about-us';
  static const String name = 'Về chúng tôi';
  AboutUsController controller = Get.put(AboutUsController());
  @override
  initState({AboutUsController controller}) {
    return super.initState(controller: controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            appbarSecond(AboutUsScreen.name),
            Container(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              child: Image.asset(
                Common.pathImg + "ic_coin.png",
                width: 100.0,
                fit: BoxFit.contain,
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Phiên bản"),
                  Text(
                    controller.version,
                    style: TextStyle(color: Color(Constant.colorTxtDefault)),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                controller.clickItem("POLICY");
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 0.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(
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
                    Expanded(child: Text("Chính sách quyền riêng tư")),
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
          ],
        ),
      ),
    );
  }
}
