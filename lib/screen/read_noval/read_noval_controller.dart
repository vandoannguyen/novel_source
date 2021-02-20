import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:init_app/base/base_controller.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/data/repository.dart';
import 'package:init_app/utils/crypt_utils.dart';

class ReadNovalController extends BaseController {
  String read = "";

  String chap = "";
  dynamic chaps = [];
  List<Page> widgets;
  TextStyle titleStyle, contentStyle;
  double widthScreen = 0;
  double paddingWidth = 10;
  double paddingHeight = 10;
  double heightScreen = 0;

  List<Page> pages = new List();

  double mTitleInterval = 0;

  ReadNovalController() {
    titleStyle = new TextStyle(fontSize: 30, color: Colors.black);
    contentStyle = new TextStyle(fontSize: 20, color: Colors.black);
  }

  void readNoval(id) {
    RepositoryImpl.getInstance()
        .chapByNoval(id: id, page: 1, limit: 20)
        .then((value) {
      chaps = value;
      changePage(chaps[0]["id"]);
    });
  }

  void changePage(id) {
    print(id);
    read = null;
    RepositoryImpl.getInstance().readNoval(id: id).then((value) {
      String data = CryptUtils.decryptAESCryptoJS(
          value["result"]["content_text"], Common.ONEADX_KEY);
      chap = value["result"]["title"];
      read = CryptUtils.decodeBase4(data);
      update();
      pages = getPages(chap, read);
      update();
      print("pages.length${pages.length}");
      // CallNativeUtils.invokeMethod(
      //     method: "read", aguments: {"title": chap, "content": read});
    });
  }

  List<Page> getPages(String chap, String read) {
    List<Page> pages = new List();
    List<String> lines = new List();
    List<String> paragraphs = new List();
    // paragraphs.add(chap);
    paragraphs.addAll(read.split("\\n"));
    double heightVisible = heightScreen;
    // print("heightScreen$heightVisible");
    var isShowTitle = true;
    while (!paragraphs.isEmpty) {
      String paragraph = paragraphs[0];
      if (!isShowTitle) {
        if (paragraph == "") {
          paragraphs.removeAt(0);
          print("page0000${pages.length}");
          continue;
        }
        paragraph = "" + paragraph + "\n";
      } else {}
      while (paragraph.length > 0) {
        List<String> splitString = paragraph.split(" ");
        String subStrBuilder = "";
        for (int i = 0; i < splitString.length; i++) {
          // if (splitString[i] == "") {
          //   print("continue");
          //   continue;
          // }
          TextPainter textPainter =
              TextPainter(textDirection: TextDirection.ltr);
          textPainter.text = new TextSpan(
              text: subStrBuilder + splitString[i] + " ", style: contentStyle);

          textPainter.layout();

          if (textPainter.width < widthScreen) {
            subStrBuilder += splitString[i] + " ";
          } else {
            subStrBuilder.trimRight();
            heightVisible -= textPainter.height;
            // 设置段落间距 Đặt khoảng cách đoạn văn
            heightVisible -= mTitleInterval;
            // if (isShowTitle) {
            //   // titleLinesCount += 1;
            //   rHeight -= mTitleInterval;
            // } else {
            //   rHeight -= mTextInterval;
            // }
            // print("heightVisible -= textPainter.height  ${heightVisible}");
            break;
          }
          if (subStrBuilder.contains("\\n")) break;
        }
        if (heightVisible <= 0) {
          List<String> liness = new List();
          liness.addAll(lines);
          pages.add(new Page(chap, liness, titleStyle, contentStyle));
          heightVisible = heightScreen;
          lines.clear();
          continue;
        }
        String subStr = subStrBuilder;
        if (subStr != "\n") {
          //将一行字节，存储到lines中 Lưu trữ một dòng byte trong dòng
          lines.add(subStr);

          // // 设置段落间距 Đặt khoảng cách đoạn văn
          // if (isShowTitle) {
          //   // titleLinesCount += 1;
          //   rHeight -= mTitleInterval;
          // } else {
          //   rHeight -= mTextInterval;
          // }
        }
        // Mùa vụ
        if (subStr.length == 0 || paragraph.length < subStr.length) {
          // paragraph = "";
          break;
        }
        paragraph = paragraph.substring(subStr.length);
      }
      if (isShowTitle) isShowTitle = false;
      paragraphs.removeAt(0);
    }
    return pages;
  }

  void setSizePage(double width, double height) {
    widthScreen = width - paddingWidth;
    heightScreen = height - paddingHeight;
  }
}

class Page {
  String title;
  List<String> lines;
  TextStyle titleStyle;
  TextStyle contentStyle;

  // Page(this.title, this.lines);

  Page(this.title, this.lines, this.titleStyle, this.contentStyle);
}
