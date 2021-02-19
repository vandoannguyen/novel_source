import 'dart:math';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/common/constant.dart';
import 'package:init_app/screen/bookstore/free_bookstore/free_bookstore_screen.dart';
import 'package:init_app/screen/frequently_question/frequently_question_controller.dart';
import 'package:init_app/widgets/appbar_second.dart';

// ignore: must_be_immutable
class FrequentlyQuestionScreen
    extends BaseWidget<FrequentlyQuestionController> {
  static const String routeName = '/frequently-question';
  static const String name = 'Câu hỏi thường gặp';
  FrequentlyQuestionController controller =
      Get.put(FrequentlyQuestionController());
  final ctlTextEditContent = TextEditingController();
  final ctlTextEditEmail = TextEditingController();
  @override
  initState({FrequentlyQuestionController controller}) {
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
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            appbarSecond(FrequentlyQuestionScreen.name),
            Expanded(
              child: ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.questions.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ExpandablePanel(
                      theme: ExpandableThemeData(
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                        tapBodyToExpand: true,
                        tapBodyToCollapse: true,
                        hasIcon: false,
                        tapHeaderToExpand: true,
                      ),
                      header: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              ExpandableIcon(
                                theme: ExpandableThemeData(
                                  tapBodyToExpand: true,
                                  tapBodyToCollapse: true,
                                  expandIcon: Icons.chevron_right_rounded,
                                  collapseIcon:
                                      Icons.keyboard_arrow_down_rounded,
                                  iconColor: Color(Constant.colorTxtDefault),
                                  iconSize: 28.0,
                                  iconRotationAngle: pi / 2,
                                  iconPadding: EdgeInsets.only(right: 0),
                                  hasIcon: false,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                    "${index + 1}. ${controller.questions[index]["question"]}",
                                    style: TextStyle(
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.w500)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      expanded: Container(
                        padding: EdgeInsets.all(15.0),
                        child: index == 0
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.questions[index]["answer"][0],
                                    style: TextStyle(
                                      color: Color(Constant.colorTxtDefault),
                                      height: 1.25,
                                    ),
                                    softWrap: true,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      controller.goTutorial();
                                    },
                                    child: Text(
                                      'Bấm vào đây hướng dẫn nạp xu',
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Colors.blue),
                                    ),
                                  ),
                                  Text(
                                    controller.questions[index]["answer"][1],
                                    style: TextStyle(
                                      color: Color(Constant.colorTxtDefault),
                                      height: 1.25,
                                    ),
                                    softWrap: true,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      controller.goTutorial();
                                    },
                                    child: Text(
                                      'Bấm vào đây hướng dẫn nạp xu',
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Colors.blue),
                                    ),
                                  ),
                                ],
                              )
                            : Text(
                                controller.questions[index]["answer"],
                                style: TextStyle(
                                  color: Color(Constant.colorTxtDefault),
                                  height: 1.25,
                                ),
                                // softWrap: true,
                              ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
