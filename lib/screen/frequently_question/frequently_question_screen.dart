import 'dart:math';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:init_app/app_localizations.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/common/constant.dart';
import 'package:init_app/screen/frequently_question/frequently_question_controller.dart';
import 'package:init_app/widgets/appbar_second.dart';

// ignore: must_be_immutable
class FrequentlyQuestionScreen
    extends BaseWidget<FrequentlyQuestionController> {
  static const String routeName = '/frequently-question';
  static const String name = 'frequently question';

  @override
  Widget build(BuildContext context, {controllerSuper}) {
    super.build(context, controllerSuper: FrequentlyQuestionController());
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            appbarSecond(AppLocalizations.of(context).translate(name)),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // question 1
                    ExpandablePanel(
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
                                    "1. " +
                                        AppLocalizations.of(context).translate(
                                            "I dont know how to deposit coins"),
                                    style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                      expanded: Container(
                          padding: EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)
                                    .translate("Payment method on Google play"),
                                style: TextStyle(
                                  color: Color(Constant.colorTxtDefault),
                                  height: 1.5,
                                ),
                                softWrap: true,
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.goTutorial();
                                },
                                child: Text(
                                  AppLocalizations.of(context).translate(
                                      'Click here for coin refill instructions'),
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.blue),
                                ),
                              ),
                              Text(
                                AppLocalizations.of(context).translate(
                                    "Payment method on goole play by viettel"),
                                style: TextStyle(
                                  color: Color(Constant.colorTxtDefault),
                                  height: 1.5,
                                ),
                                softWrap: true,
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.goTutorial();
                                },
                                child: Text(
                                  AppLocalizations.of(context).translate(
                                      'Click here for coin refill instructions'),
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.blue),
                                ),
                              ),
                            ],
                          )),
                    ),
                    // question 2
                    ExpandablePanel(
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
                                    "2. " +
                                        AppLocalizations.of(context).translate(
                                            'How can I get more coins'),
                                    style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                      expanded: Container(
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context).translate(
                                  'Through the payment methods to load coins to get more coins'),
                              style: TextStyle(
                                color: Color(Constant.colorTxtDefault),
                                height: 1.5,
                              ),
                              softWrap: true,
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.goHome();
                              },
                              child: Text(
                                AppLocalizations.of(context).translate(
                                    'Click here to receive more coins'),
                                style: TextStyle(
                                  color: Color(Constant.colorTxtDefault),
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.questions.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ExpandablePanel(
                            theme: ExpandableThemeData(
                              headerAlignment:
                                  ExpandablePanelHeaderAlignment.center,
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
                                        iconColor:
                                            Color(Constant.colorTxtDefault),
                                        iconSize: 28.0,
                                        iconRotationAngle: pi / 2,
                                        iconPadding: EdgeInsets.only(right: 0),
                                        hasIcon: false,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                          "${index + 3}. " +
                                              AppLocalizations.of(context)
                                                  .translate(controller
                                                          .questions[index]
                                                      ["question"]),
                                          style: TextStyle(
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.w500,
                                            height: 1.5,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            expanded: Container(
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                AppLocalizations.of(context).translate(
                                    controller.questions[index]["answer"]),
                                style: TextStyle(
                                  color: Color(Constant.colorTxtDefault),
                                  height: 1.5,
                                ),
                                // softWrap: true,
                              ),
                            ),
                          );
                        }),
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
