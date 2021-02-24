import 'package:flutter/material.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/common/constant.dart';
import 'package:init_app/common/images.dart';
import 'package:init_app/screen/about_us/about_us_controller.dart';
import 'package:init_app/widgets/appbar_second.dart';

class AboutUsScreen extends BaseWidget<AboutUsController> {
  static const String routeName = '/about-us';
  static const String name = 'About us';

  @override
  Widget build(BuildContext context, {AboutUsController controllerSuper}) {
    super.build(context, controllerSuper: AboutUsController());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            appbarSecond(AboutUsScreen.name),
            Container(
              padding: EdgeInsets.symmetric(vertical: 30.0),
                width: 100.0,
              child: ic_launcher,
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Version"),
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
                        Common.pathImg + "ic_policy.png",
                        width: 20.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Expanded(child: Text("Privacy Policy")),
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