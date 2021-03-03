import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/app_localizations.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/screen/survey_question/survey_question_controller.dart';
import 'package:init_app/widgets/appbar_second.dart';
import 'package:init_app/widgets/button_main.dart';

import '../../common/constant.dart';

// ignore: must_be_immutable
class SurveyQuestionScreen extends BaseWidget<SurveyQuestionController> {
  static const String routeName = '/survey_question';
  static const String name = 'survey question';
  SurveyQuestionController controller = Get.put(SurveyQuestionController());
  final ctlTextEditContent = TextEditingController();
  final ctlTextEditEmail = TextEditingController();

  @override
  initState({SurveyQuestionController controller}) {
    return super.initState(controller: controller);
  }

  @override
  Widget build(BuildContext context, {controllerSuper}) {
    super.build(context, controllerSuper: SurveyQuestionController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            appbarSecond(AppLocalizations.of(context).translate(name), context),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                        AssetImage(Common.pathImg + "bg_survey_question.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: SingleChildScrollView(
                  child: GetBuilder<SurveyQuestionController>(
                    init: SurveyQuestionController(),
                    builder: (controller) => Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(35.0, 30.0, 35.0, 30.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                width: 1.0,
                                color: Color(Constant.colorTxtDefault)
                                    .withOpacity(0.5)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 15.0),
                          child: Column(
                            children: [
                              Text(
                                "1. ${AppLocalizations.of(context).translate("survey question 1")}",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Color(Constant.colorTxtSecond),
                                ),
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: "Less than 1 hour",
                                    groupValue: controller.answers[0],
                                    onChanged: (value) {
                                      controller.changeAnswers(0, value);
                                    },
                                    activeColor: Color(Constant.colorTxtSecond),
                                  ),
                                  Text(
                                    "A. ${AppLocalizations.of(context).translate("survey question 1 answers 1")}",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Color(Constant.colorTxtSecond),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: "2 hours",
                                    groupValue: controller.answers[0],
                                    onChanged: (value) {
                                      controller.changeAnswers(0, value);
                                    },
                                    activeColor: Color(Constant.colorTxtSecond),
                                  ),
                                  Text(
                                    "B. ${AppLocalizations.of(context).translate("survey question 1 answers 2")}",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Color(Constant.colorTxtSecond),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: "3 hours",
                                    groupValue: controller.answers[0],
                                    onChanged: (value) {
                                      controller.changeAnswers(0, value);
                                    },
                                    activeColor: Color(Constant.colorTxtSecond),
                                  ),
                                  Text(
                                    "C. ${AppLocalizations.of(context).translate("survey question 1 answers 3")}",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Color(Constant.colorTxtSecond),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: "3 or more hours",
                                    groupValue: controller.answers[0],
                                    onChanged: (value) {
                                      controller.changeAnswers(0, value);
                                    },
                                    activeColor: Color(Constant.colorTxtSecond),
                                  ),
                                  Text(
                                    "D. ${AppLocalizations.of(context).translate("survey question 1 answers 4")}",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Color(Constant.colorTxtSecond),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 30.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                width: 1.0,
                                color: Color(Constant.colorTxtDefault)
                                    .withOpacity(0.5)),
                            borderRadius: BorderRadius.all(Radius.circular(
                                    15.0) //                 <--- border radius here
                                ),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 15.0),
                          child: Column(
                            children: [
                              Text(
                                "2. ${AppLocalizations.of(context).translate("survey question 2")}",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Color(Constant.colorTxtSecond),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              TextField(
                                maxLines: 5,
                                controller: ctlTextEditContent,
                                onChanged: (text) {
                                  controller.changeAnswers(1, text);
                                },
                                style: TextStyle(
                                    color: Color(Constant.colorTxtSecond),
                                    fontSize: 16.0),
                                cursorColor: Color(Constant.colorTxtSecond),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(Constant.colorTxtSecond)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                        color: Color(Constant.colorTxtSecond)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(Constant.colorTxtSecond)),
                                  ),
                                  hintText:
                                      "${AppLocalizations.of(context).translate("Please enter the Story you like best")}",
                                  hintStyle: TextStyle(
                                    fontSize: 16.0,
                                    color: Color(Constant.colorTxtSecond)
                                        .withOpacity(0.6),
                                  ),
                                  contentPadding: EdgeInsets.all(10.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 30.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                width: 1.0,
                                color: Color(Constant.colorTxtDefault)
                                    .withOpacity(0.5)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "3. ${AppLocalizations.of(context).translate("survey question 3")}",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Color(Constant.colorTxtSecond),
                                ),
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: "Modern Romance",
                                    groupValue: controller.answers[2],
                                    onChanged: (value) {
                                      controller.changeAnswers(2, value);
                                    },
                                    activeColor: Color(Constant.colorTxtSecond),
                                  ),
                                  Text(
                                    "A. ${AppLocalizations.of(context).translate("survey question 3 answers 1")}",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Color(Constant.colorTxtSecond),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: "Ancient Fiction/ Fantasy",
                                    groupValue: controller.answers[2],
                                    onChanged: (value) {
                                      controller.changeAnswers(2, value);
                                    },
                                    activeColor: Color(Constant.colorTxtSecond),
                                  ),
                                  Text(
                                    "B. ${AppLocalizations.of(context).translate("survey question 3 answers 2")}",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Color(Constant.colorTxtSecond),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: "Urban/City",
                                    groupValue: controller.answers[2],
                                    onChanged: (value) {
                                      controller.changeAnswers(2, value);
                                    },
                                    activeColor: Color(Constant.colorTxtSecond),
                                  ),
                                  Text(
                                    "C. ${AppLocalizations.of(context).translate("survey question 3 answers 3")}",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Color(Constant.colorTxtSecond),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: "Other",
                                    groupValue: controller.answers[2],
                                    onChanged: (value) {
                                      controller.changeAnswers(2, value);
                                    },
                                    activeColor: Color(Constant.colorTxtSecond),
                                  ),
                                  Text(
                                    "D. ${AppLocalizations.of(context).translate("survey question 3 answers 4")}",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Color(Constant.colorTxtSecond),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                width: 100.0,
                                margin: EdgeInsets.only(left: 15.0),
                                child: TextField(
                                  maxLines: 1,
                                  enabled:  controller.answers[2] == "Other" ? true: false,
                                  onChanged: (text) {
                                    controller.changeAnswers(3, text);
                                  },
                                  cursorColor: Color(Constant.colorTxtSecond),
                                  style: TextStyle(
                                      color: Color(Constant.colorTxtSecond),
                                      fontSize: 16.0),
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color(Constant.colorTxtSecond)),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color(Constant.colorTxtSecond)),
                                    ),
                                    hintText: "",
                                    isDense: true,
                                    hintStyle: TextStyle(
                                        fontSize: 16.0,
                                        color: Color(Constant.colorTxtSecond)
                                            .withOpacity(0.6)),
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 5.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 30.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                width: 1.0,
                                color: Color(Constant.colorTxtDefault)
                                    .withOpacity(0.5)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 15.0),
                          child: Column(
                            children: [
                              Text(
                                "4. ${AppLocalizations.of(context).translate("survey question 4")}",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Color(Constant.colorTxtSecond),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              TextField(
                                // maxLines: 1,
                                onChanged: (text) {
                                  controller.changeAnswers(4, text);
                                },
                                style: TextStyle(
                                    color: Color(Constant.colorTxtSecond),
                                    fontSize: 16.0),
                                cursorColor: Color(Constant.colorTxtSecond),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(Constant.colorTxtSecond)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                    borderSide: BorderSide(
                                        color: Color(Constant.colorTxtSecond)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                    borderSide: BorderSide(
                                        color: Color(Constant.colorTxtSecond)),
                                  ),
                                  hintText:
                                      "${AppLocalizations.of(context).translate("Payment methods")}",
                                  hintStyle: TextStyle(
                                      fontSize: 16.0,
                                      color: Color(Constant.colorTxtSecond)
                                          .withOpacity(0.6)),
                                  contentPadding: EdgeInsets.all(10.0),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              TextField(
                                // maxLines: 1,
                                onChanged: (text) {
                                  controller.changeAnswers(5, text);
                                },
                                style: TextStyle(
                                    color: Color(Constant.colorTxtSecond),
                                    fontSize: 16.0),
                                cursorColor: Color(Constant.colorTxtSecond),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(Constant.colorTxtSecond)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                    borderSide: BorderSide(
                                        color: Color(Constant.colorTxtSecond)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                    borderSide: BorderSide(
                                        color: Color(Constant.colorTxtSecond)),
                                  ),
                                  hintText:
                                      "${AppLocalizations.of(context).translate("Payment methods")}",
                                  hintStyle: TextStyle(
                                      fontSize: 16.0,
                                      color: Color(Constant.colorTxtSecond)
                                          .withOpacity(0.6)),
                                  contentPadding: EdgeInsets.all(10.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 30.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                width: 1.0,
                                color: Color(Constant.colorTxtDefault)
                                    .withOpacity(0.5)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 15.0),
                          child: Column(
                            children: [
                              Text(
                                "5. ${AppLocalizations.of(context).translate("survey question 5")}",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Color(Constant.colorTxtSecond),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              TextField(
                                maxLines: 5,
                                onChanged: (text) {
                                  controller.changeAnswers(6, text);
                                },
                                style: TextStyle(
                                    color: Color(Constant.colorTxtSecond),
                                    fontSize: 16.0),
                                cursorColor: Color(Constant.colorTxtSecond),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(Constant.colorTxtSecond)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                        color: Color(Constant.colorTxtSecond)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                        color: Color(Constant.colorTxtSecond)),
                                  ),
                                  hintText:
                                      "${AppLocalizations.of(context).translate("Please write in your comments")}",
                                  hintStyle: TextStyle(
                                      fontSize: 16.0,
                                      color: Color(Constant.colorTxtSecond)
                                          .withOpacity(0.6)),
                                  contentPadding: EdgeInsets.all(10.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
                          height: 40.0,
                          child: ButtonMain(
                            name:
                                AppLocalizations.of(context).translate("done"),
                            color: Color(Constant.colorTxtSecond),
                            txtSize: 16.0,
                            func: () {
                               FocusScope.of(context).unfocus();
                              controller.done();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
