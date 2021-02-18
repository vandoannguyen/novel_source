import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
  FeedbackController controller = Get.put(FeedbackController());
  final ctlTextEditContent = TextEditingController();
  final ctlTextEditEmail = TextEditingController();
  @override
  initState({FeedbackController controller}) {
    return super.initState(controller: controller);
  }

  @override
  void dispose() {
    // super.dispose();
    ctlTextEditContent.dispose();
    ctlTextEditEmail.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                  margin: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 15.0),
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
                  bottom: 15,
                  child: GetBuilder<FeedbackController>(
                    init: FeedbackController(),
                    builder: (controller) => Text(
                      (controller.maxCount - controller.count).toString(),
                      style: TextStyle(fontSize: 10.0),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 15.0),
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
              margin: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 15.0),
              width: double.infinity,
              height: 40.0,
              child: ButtonMain(
                name: "Gửi",
                color: Color(Constant.colorTxtSecond),
                func: () {
                  controller.sendCmt(ctlTextEditContent.text);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
