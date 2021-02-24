import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/common/constant.dart';
import 'package:init_app/widgets/appbar_second.dart';

import '../../base/base_widget.dart';
import 'come_author_controller.dart';

class ComeAuthorScreen extends BaseWidget<ComeAuthorController> {
  static const String routeName = '/bookcase';
  static const String name = "Become Author";
  int color = 0xFFfdf1f1;

  build(BuildContext context, {controllerSuper}) {
    super.build(context, controllerSuper: ComeAuthorController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            appbarSecond(name),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      Common.pathImg + "img_come_author.png",
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 30.0),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                                  Border.all(width: 15.0, color: Color(color)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                            child: Text(
                              "${Common.appName} An application that synthesizes the best hot novels and comics, adds to the fun of your spare time. In order to bring readers more unique works, we sincerely welcome you to join us in bringing readers the best stories.",
                              style: TextStyle(
                                  color: Color(Constant.colorTxtSecond),
                                  fontSize: 13.0,
                                  height: 1.5),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 25.0, bottom: 15.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 2,
                                    color: Color(color),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 0.0),
                                  child: Text(
                                    "How to submit work",
                                    style: TextStyle(
                                        color: Color(Constant.colorTxtSecond),
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 2,
                                    color: Color(color),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                              color: Color(color),
                              // border: Border.all(width: 15.0, color: Color(color)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Send your work to ${Common.appName}: ${Common.email}@gmail.com email inbox. Once approved, ${Common.fanpageName} will help you promote free work expansion. What are you waiting for without shaking hands immediately contact ${Common.fanpageName}.",
                                  style: TextStyle(
                                      color: Color(Constant.colorTxtSecond),
                                      fontSize: 13.0,
                                      height: 1.5),
                                ),
                                Text(
                                  "FB: ${Common.fanpageName}",
                                  style: TextStyle(
                                      color: Color(Constant.colorTxtSecond),
                                      fontSize: 13.0,
                                      height: 1.5),
                                ),
                                Text(
                                  "Email: ${Common.email}",
                                  style: TextStyle(
                                      color: Color(Constant.colorTxtSecond),
                                      fontSize: 13.0,
                                      height: 1.5),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 25.0, bottom: 15.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 2,
                                    color: Color(color),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 0.0),
                                  child: Text(
                                    "Method of receiving royalties",
                                    style: TextStyle(
                                        color: Color(Constant.colorTxtSecond),
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 2,
                                    color: Color(color),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                              color: Color(color),
                              // border: Border.all(width: 15.0, color: Color(color)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "- Based on the locked chapters to receive",
                                  style: TextStyle(
                                      color: Color(Constant.colorTxtSecond),
                                      fontSize: 13.0,
                                      height: 1.5),
                                ),
                                Text(
                                  "- Rely on readers coins reward to receive",
                                  style: TextStyle(
                                      color: Color(Constant.colorTxtSecond),
                                      fontSize: 13.0,
                                      height: 1.5),
                                ),
                                Text(
                                  "- Based on licensing",
                                  style: TextStyle(
                                      color: Color(Constant.colorTxtSecond),
                                      fontSize: 13.0,
                                      height: 1.5),
                                ),
                                Text(
                                  "Also, if you are fluent in Chinese and Vietnamese, you can become a translator to receive a reward.",
                                  style: TextStyle(
                                      color: Color(Constant.colorTxtSecond),
                                      fontSize: 13.0,
                                      height: 1.5),
                                ),
                                Text(
                                  "\nDear!\n",
                                  style: TextStyle(
                                      color: Color(Constant.colorTxtSecond),
                                      fontSize: 13.0,
                                      height: 1.5),
                                ),
                              ],
                            ),
                          ),
                        ],
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
