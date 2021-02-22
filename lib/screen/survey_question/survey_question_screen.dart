import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/screen/survey_question/survey_question_controller.dart';
import 'package:init_app/widgets/appbar_second.dart';
import 'package:init_app/widgets/button_main.dart';

import '../../common/constant.dart';

// ignore: must_be_immutable
class SurveyQuestionScreen extends BaseWidget<SurveyQuestionController> {
  static const String routeName = '/survey_question';
  static const String name = 'Câu hỏi khảo sát';
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
            appbarSecond(SurveyQuestionScreen.name),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(35.0, 30.0, 35.0, 30.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            width: 3.0,
                            color: Color(Constant.colorTxtDefault)
                                .withOpacity(0.5)),
                        borderRadius: BorderRadius.all(Radius.circular(
                                5.0) //                 <--- border radius here
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
                                value: 1,
                                groupValue: controller.answers[0],
                                onChanged: (value) {
                                  controller.changeAnswers(0, value);
                                },
                                activeColor: Color(Constant.colorTxtSecond),
                              ),
                              Text(
                                "A. Dưới 1 tiếng",
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
                                value: 2,
                                groupValue: controller.answers[0],
                                onChanged: (value) {
                                  controller.changeAnswers(0, value);
                                },
                              ),
                              Text(
                                "B. 2 tiếng",
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
                                value: 3,
                                groupValue: controller.answers[0],
                                onChanged: (value) {
                                  controller.changeAnswers(0, value);
                                },
                              ),
                              Text(
                                "C. 3 tiếng",
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
                                value: 4,
                                groupValue: controller.answers[0],
                                onChanged: (value) {
                                  controller.changeAnswers(0, value);
                                },
                              ),
                              Text(
                                "D. 3 tiếng trở lên",
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
                            width: 3.0,
                            color: Color(Constant.colorTxtDefault)
                                .withOpacity(0.5)),
                        borderRadius: BorderRadius.all(Radius.circular(
                                5.0) //                 <--- border radius here
                            ),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 15.0),
                      child: Column(
                        children: [
                          Text(
                            "1. Bạn thích nhất truyện nào ở Mê Tình Truyện?",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Color(Constant.colorTxtSecond),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextField(
                            maxLines: 8,
                            controller: ctlTextEditContent,
                            onChanged: (text) {
                              controller.changeAnswers(2, text);
                            },
                            style: TextStyle(
                                color: Color(Constant.colorTxtSecond),
                                fontSize: 16.0),
                            decoration: InputDecoration(
                              border: new OutlineInputBorder(
                                  // border: InputBorder.none,
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: new BorderSide(
                                      color: Color(Constant.colorTxtSecond))),
                              hintText: "Mời nhập vào Truyện bạn thích nhất",
                              hintStyle: TextStyle(
                                  fontSize: 16.0,
                                  color: Color(Constant.colorTxtSecond)
                                      .withOpacity(0.6)),
                              contentPadding: EdgeInsets.all(10.0),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 30.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            width: 3.0,
                            color: Color(Constant.colorTxtDefault)
                                .withOpacity(0.5)),
                        borderRadius: BorderRadius.all(Radius.circular(
                                5.0) //                 <--- border radius here
                            ),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 15.0),
                      child: Column(
                        children: [
                          Text(
                            "3. Bạn hi vọng về sau có thể đọc được các thể loại Truyện nào ở Mê Tình Truyện",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Color(Constant.colorTxtSecond),
                            ),
                          ),
                          Row(
                            children: [
                              Radio(
                                value: 1,
                                groupValue: controller.answers[0],
                                onChanged: (value) {
                                  controller.changeAnswers(0, value);
                                },
                              ),
                              Text(
                                "A. Ngôn tình hiện đại",
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
                                value: 2,
                                groupValue: controller.answers[0],
                                onChanged: (value) {
                                  controller.changeAnswers(0, value);
                                },
                              ),
                              Text(
                                "B. Xuyên không cổ đại",
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
                                value: 3,
                                groupValue: controller.answers[0],
                                onChanged: (value) {
                                  controller.changeAnswers(0, value);
                                },
                              ),
                              Text(
                                "C. Đô thị",
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
                                value: 4,
                                groupValue: controller.answers[0],
                                onChanged: (value) {
                                  controller.changeAnswers(0, value);
                                },
                              ),
                              Text(
                                "D. Khác",
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
                      margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
                      height: 40.0,
                      child: ButtonMain(
                        name: "Đã xong",
                        color: Color(Constant.colorTxtSecond),
                        txtSize: 16.0,
                        func: () {},
                      ),
                    ),
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
