import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:init_app/app_localizations.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/common/constant.dart';
import 'package:init_app/widgets/appbar_second.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../base/base_widget.dart';
import 'come_author_controller.dart';

class ComeAuthorScreen extends BaseWidget<ComeAuthorController> {
  static const String routeName = '/bookcase';
  static const String name = "become author";
  int color = 0xFFfdf1f1;
  

  build(BuildContext context, {controllerSuper}) {
    super.build(context, controllerSuper: ComeAuthorController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            appbarSecond(AppLocalizations.of(context).translate(name)),
            // Expanded(
            //   child: WebView(
            //     initialUrl: 'about:blank',
            //      javascriptMode: JavascriptMode.disabled,
            //     onWebViewCreated: (WebViewController webViewController) {
            //       _controller = webViewController;
            //       _loadHtmlFromAssets();
            //     },

            //   ),
            // ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          Common.pathImg + "img.png",
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            padding: EdgeInsets.only(top: 20.0),
                            child: Text(
                              AppLocalizations.of(context).translate(name),
                              style: TextStyle(color: Color(Constant.colorTxtPrimary), fontSize: 25.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
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
                              "${Common.appName} ${AppLocalizations.of(context).translate("an application that synthesizes the best hot novels and comics")}",
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
                                    height: 1,
                                    color: Color(Constant.colorTxtSecond)
                                        .withOpacity(0.8),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 0.0),
                                  child: Text(
                                    AppLocalizations.of(context)
                                        .translate("How to submit work"),
                                    style: TextStyle(
                                        color: Color(Constant.colorTxtSecond),
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 1,
                                    color: Color(Constant.colorTxtSecond)
                                        .withOpacity(0.8),
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
                                  AppLocalizations.of(context)
                                      .translate("Send your work to"),
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
                                    height: 1,
                                    color: Color(Constant.colorTxtSecond)
                                        .withOpacity(0.8),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 0.0),
                                  child: Text(
                                    AppLocalizations.of(context).translate(
                                        "Method of receiving royalties"),
                                    style: TextStyle(
                                        color: Color(Constant.colorTxtSecond),
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 1,
                                    color: Color(Constant.colorTxtSecond)
                                        .withOpacity(0.8),
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
                                  "- ${AppLocalizations.of(context).translate("Based on the locked chapters to receive")}",
                                  style: TextStyle(
                                      color: Color(Constant.colorTxtSecond),
                                      fontSize: 13.0,
                                      height: 1.5),
                                ),
                                Text(
                                  "- ${AppLocalizations.of(context).translate("Rely on readers coins reward to receive")}",
                                  style: TextStyle(
                                      color: Color(Constant.colorTxtSecond),
                                      fontSize: 13.0,
                                      height: 1.5),
                                ),
                                Text(
                                  "- ${AppLocalizations.of(context).translate("Based on licensing")}",
                                  style: TextStyle(
                                      color: Color(Constant.colorTxtSecond),
                                      fontSize: 13.0,
                                      height: 1.5),
                                ),
                                Text(
                                  AppLocalizations.of(context).translate(
                                      "Also, if you are fluent in Chinese and Vietnamese"),
                                  style: TextStyle(
                                      color: Color(Constant.colorTxtSecond),
                                      fontSize: 13.0,
                                      height: 1.5),
                                ),
                                Text(
                                  "\n${AppLocalizations.of(context).translate("Dear")}!\n",
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
