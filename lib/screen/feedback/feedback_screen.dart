import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/screen/feedback/feedback_controller.dart';
import 'package:init_app/widgets/button_main.dart';

import '../../common/constant.dart';

// ignore: must_be_immutable
class FeedbackScreen extends BaseWidget<FeedbackController> {
  static const String routeName = '/feedback';
  static const String name = 'Ý kiến phản hồi';
  final ctlTextEditContent = TextEditingController();
  final ctlTextEditEmail = TextEditingController();

  @override
  void dispose() {
    // super.dispose();
    ctlTextEditContent.dispose();
    ctlTextEditEmail.dispose();
  }

  @override
  Widget build(BuildContext context, {controllerSuper}) {
    super.build(context, controllerSuper: FeedbackController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      FeedbackScreen.name,
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      padding: EdgeInsets.all(10.0),
                      onPressed: () {
                        controller.back();
                      },
                      icon: Icon(Icons.arrow_back_ios_rounded),
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                  // padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: TextField(
                    maxLines: 8,
                    controller: ctlTextEditContent,
                    onChanged: (text) {
                      controller.countWord(text.length);
                    },
                    decoration: InputDecoration(
                      hintText:
                          "Vui lòng gửi ý kiến phản hồi cho chúng tôi ! Nếu có thể xin liên hệ qua FB của fanpage (${Common.fanpageName}), cảm ơn !",
                      hintStyle: TextStyle(
                        fontSize: 15.0,
                        color: Color(Constant.colorTxtDefault).withOpacity(0.8),
                      ),
                      contentPadding: EdgeInsets.all(10.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Positioned(
                  right: 18,
                  bottom: 0,
                  child: GetBuilder<FeedbackController>(
                    builder: (controller) => Text(
                      (controller.maxCount - controller.count).toString(),
                      style: TextStyle(fontSize: 10.0),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 25.0),
              // padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: TextField(
                maxLines: 1,
                controller: ctlTextEditContent,
                onChanged: (text) {
                  controller.countWord(text.length);
                },
                decoration: InputDecoration(
                  hintText: "Xin nhận email của bạn (Bắt buộc)",
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    color: Color(Constant.colorTxtDefault).withOpacity(0.8),
                  ),
                  contentPadding: EdgeInsets.all(10.0),
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 25.0),
              width: double.infinity,
              height: 40.0,
              child: ButtonMain(
                name: "Gửi",
                color: Color(Constant.colorTxtSecond),
                func: () {
                  controller.send(
                      ctlTextEditEmail.text, ctlTextEditContent.text);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 25.0),
              width: double.infinity,
              height: 50.0,
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    side: BorderSide(
                      color: Colors.black,
                      width: 0.5,
                    ),
                  ),
                  color: Colors.white,
                  padding: EdgeInsets.all(0.0),
                  onPressed: () {
                    controller.contactsFB();
                  },
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Liên hệ FB",
                          style: TextStyle(),
                        ),
                      ),
                      Align(
                        alignment: Alignment(-0.98, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset(
                            Common.pathImg + "ic_edit.png",
                            fit: BoxFit.cover,
                            width: 45.0,
                            height: 45.0,
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
