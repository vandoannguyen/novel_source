import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/screen/survey_question/survey_question_controller.dart';
import 'package:init_app/widgets/appbar_second.dart';
import 'package:init_app/widgets/button_main.dart';
import '../../common/constant.dart';

// ignore: must_be_immutable
class SurveyQuestionScreen extends BaseWidget<SurveyQuestionController> {
  static const String routeName = '/survey_question';
  static const String name = 'Survey Question';
  SurveyQuestionController controller = Get.put(SurveyQuestionController());
  final ctlTextEditContent = TextEditingController();
  final ctlTextEditEmail = TextEditingController();
  @override
  initState({SurveyQuestionController controller}) {
    return super.initState(controller: controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            appbarSecond(SurveyQuestionScreen.name),
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
                      builder: (controller) =>  Column(
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
                              "1. Bạn mỗi ngày dành bao nhiêu thời gian đọc truyện?",
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
                                  "A. Less than 1 hour",
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
                                  "B. 2 hours",
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
                                  value: "3 hours" ,
                                  groupValue: controller.answers[0],
                                  onChanged: (value) {
                                    controller.changeAnswers(0, value);
                                  },
                                  activeColor: Color(Constant.colorTxtSecond),
                                ),
                                Text(
                                  "C. 3 hours",
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
                                  "D. 3 or more hours",
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
                              "2. Which stories do you like best in ${Common.fanpageName}?",
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
                                hintText: "Please enter the Story you like best",
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
                          borderRadius: BorderRadius.all(Radius.circular(
                                  15.0),
                              ),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "3. What kind of stories do you hope to be able to read at ${Common.fanpageName} later?",
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Color(Constant.colorTxtSecond),
                              ),
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: "Modern love language",
                                  groupValue: controller.answers[2],
                                  onChanged: (value) {
                                    controller.changeAnswers(2, value);
                                  },
                                  activeColor: Color(Constant.colorTxtSecond),
                                ),
                                Text(
                                  "A. Modern love language",
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
                                  "B. Ancient Fiction/ Fantasy",
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
                                  "C. Urban/City",
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
                                  "D. Other",
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
                                onChanged: (text) {
                                  controller.changeAnswers(2, text);
                                },
                                cursorColor: Color(Constant.colorTxtSecond),
                                style: TextStyle(
                                    color: Color(Constant.colorTxtSecond),
                                    fontSize: 16.0),
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(Constant.colorTxtSecond)),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(Constant.colorTxtSecond)),
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
                          borderRadius: BorderRadius.all(Radius.circular(
                                  15.0) 
                              ),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 15.0),
                        child: Column(
                          children: [
                            Text(
                              "4. What online payment methods do you usually use ?",
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
                                controller.changeAnswers(3, text);
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
                                hintText: "Payment methods",
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
                                hintText: "Payment methods",
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
                          borderRadius: BorderRadius.all(Radius.circular(
                                  15.0) 
                              ),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 15.0),
                        child: Column(
                          children: [
                            Text(
                              "5. For our app, do you have anything to comment on?",
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
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                      color: Color(Constant.colorTxtSecond)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                      color: Color(Constant.colorTxtSecond)),
                                ),
                                hintText: "Please write in your comments",
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
                          name: "DONE",
                          color: Color(Constant.colorTxtSecond),
                          txtSize: 16.0,
                          func: () {
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
