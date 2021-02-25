import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/screen/feedback/feedback_controller.dart';
import 'package:init_app/widgets/appbar_second.dart';
import 'package:init_app/widgets/button_main.dart';

import '../../common/constant.dart';

// ignore: must_be_immutable
class FeedbackScreen extends BaseWidget<FeedbackController> {
  static const String routeName = '/feedback';
  static const String name = 'Feedback';
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              appbarSecond(name),
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
                            "Please send us your feedback! If possible, please contact fanpage's FB (${Common.fanpageName}), thank you !",
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
                    hintText: "Please enter your email (Required)",
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
                  name: "Send",
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
                            "Contact FB",
                            style: TextStyle(),
                          ),
                        ),
                        Align(
                          alignment: Alignment(-0.98, 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30.0),
                            child: Image.asset(
                              Common.pathImg + "ic_facebook.png",
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
      ),
    );
  }
}
