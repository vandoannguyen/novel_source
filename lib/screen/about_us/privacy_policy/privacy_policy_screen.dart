// import 'dart:io';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:init_app/app_localizations.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/screen/about_us/privacy_policy/privacy_policy_controller.dart';
import 'package:init_app/widgets/appbar_second.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPolicyScreen extends BaseWidget<PrivacyPolicyController> {
  static const String routeName = '/privacy-policy';
  static const String name = 'privacy policy';
  final key = UniqueKey();
  // if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  WebViewController _controller;

  loadHtmlFromAssets() async {
    String fileText = await rootBundle.loadString('assets/html/policy-en.html');
    _controller.loadUrl(Uri.dataFromString(fileText,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }

  @override
  Widget build(BuildContext context, {controllerSuper}) {
    super.build(context, controllerSuper: PrivacyPolicyController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            appbarSecond(AppLocalizations.of(context).translate(name)),
            Expanded(
              child: GetBuilder(
                builder: (_) => WebView(
                  initialUrl: 'about:blank',
                  javascriptMode: JavascriptMode.disabled,
                  onWebViewCreated: (WebViewController webViewController) {
                    _controller = webViewController;
                    loadHtmlFromAssets();
                  },
                ),
              ),
            ),
            // Expanded(
            //   child: GetBuilder(
            //     builder: (_) => WebView(
            //       key: key,
            //       initialUrl: controller.url,
            //       javascriptMode: JavascriptMode.unrestricted,

            //       // onWebViewCreated: (WebViewController webViewController) {
            //       // },
            //       // javascriptChannels: <JavascriptChannel>[

            //       // ].toSet(),

            //       // onPageFinished: controller.doneLoading,
            //       // onPageStarted: controller.startLoading,

            //       // gestureNavigationEnabled: true,
            //     ),
            //     // Center(
            //     //   child: CircularProgressIndicator(),
            //     // ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
