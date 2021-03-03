import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchInBrowser(String url, bool forceWebView,context) async {
   if (await canLaunch(url)) {
    if (forceWebView) { // mở brower tại app
      await launch(
        url,
        forceSafariVC: forceWebView,
        forceWebView: forceWebView,
        enableJavaScript: forceWebView,
        enableDomStorage: forceWebView,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      await launch(
        url,
        forceSafariVC: forceWebView,
        forceWebView: forceWebView,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    }
  } else {
    Get.snackbar('', "Could not launch $url",
        titleText: Text(
          "ERROR",
          style: TextStyle(color: Colors.red, fontSize: 18.0),
        ),
        snackPosition: SnackPosition.BOTTOM);
    throw 'Could not launch $url';
  }
}
