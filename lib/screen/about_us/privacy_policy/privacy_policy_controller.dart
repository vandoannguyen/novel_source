import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:init_app/base/base_controller.dart';
import 'package:init_app/common/common.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPolicyController extends BaseController {
  String url = "assets/html/policy-en.html";
  WebViewController _controller;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadHtmlFromAssets();
  }

  loadHtmlFromAssets() async {
    switch (Common.langNow) {
      case "en":
        url = "assets/html/policy-en.html";
        break;
      case "vi":
        url = "assets/html/policy-vi.html";
        break;
      case "th":
        url = "assets/html/policy-th.html";
        break;
      case "id":
        url = "assets/html/policy-id.html";
        break;
      default:
        break;
    }
    update();
    String fileText = await rootBundle.loadString(url);
    _controller.loadUrl(Uri.dataFromString(fileText,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}
