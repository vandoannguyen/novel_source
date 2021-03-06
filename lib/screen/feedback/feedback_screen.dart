import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/app_localizations.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/screen/feedback/feedback_controller.dart';
import 'package:init_app/widgets/appbar_second.dart';
import 'package:init_app/widgets/button_main.dart';

import '../../common/constant.dart';

// ignore: must_be_immutable
class FeedbackScreen extends BaseWidget<FeedbackController> {
  static const String routeName = '/feedback';
  static const String name = 'feedback';
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              appbarSecond(
                  AppLocalizations.of(context).translate(name), context),
              // Stack(
              //   children: [
              Container(
                margin: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                // padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: TextField(
                  controller: ctlTextEditContent,
                  maxLines: 8,
                  maxLength: controller.maxCount,
                  maxLengthEnforced: true,
                  onChanged: (text) {
                  },
                  decoration: InputDecoration(
                 
                    hintText: AppLocalizations.of(context)
                            .translate('please send us your feedback') +
                        "(${Common.fanpageName}), " +
                        AppLocalizations.of(context).translate('thanks'),
                    hintStyle: TextStyle(
                      fontSize: 13.0,
                      color: Color(Constant.colorTxtDefault).withOpacity(0.8),
                    ),
                    contentPadding: EdgeInsets.all(10.0),
                    border: InputBorder.none,
                  ),
                ),
              ),
              // Positioned(
              //   right: 18,
              //   bottom: 0,
              //   child: GetBuilder<FeedbackController>(
              //     builder: (controller) => Text(
              //       (controller.maxCount - ctlTextEditContent.text.length).toString(),
              //       style: TextStyle(fontSize: 10.0),
              //     ),
              //   ),
              // ),
              //   ],
              // ),
              // Container(
              //   margin: EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 25.0),
              //   // padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
              //   decoration: BoxDecoration(
              //     color: Colors.grey[200],
              //     borderRadius: BorderRadius.all(Radius.circular(5.0)),
              //   ),
              //   child: TextField(
              //     maxLines: 1,
              //     controller: ctlTextEditEmail,
              //     onChanged: (text) {
              //       controller.countWord(text.length);
              //     },
              //     decoration: InputDecoration(
              //       hintText: AppLocalizations.of(context)
              //           .translate("please enter your email"),
              //       hintStyle: TextStyle(
              //         fontSize: 15.0,
              //         color: Color(Constant.colorTxtDefault).withOpacity(0.8),
              //       ),
              //       contentPadding: EdgeInsets.all(10.0),
              //       border: InputBorder.none,
              //     ),
              //   ),
              // ),
              Container(
                margin: EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 25.0),
                width: double.infinity,
                height: 40.0,
                child: ButtonMain(
                  name: AppLocalizations.of(context).translate('send'),
                  color: Color(Constant.colorTxtSecond),
                  txtSize: 16.0,
                  func: () {
                    FocusScope.of(context).unfocus();
                    controller.send(ctlTextEditContent.text);
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
                    FocusScope.of(context).unfocus();
                    controller.contactsFB();
                  },
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          AppLocalizations.of(context).translate("contact FB"),
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
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
