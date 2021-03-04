import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/screen/comment/comment_controller.dart';
import 'package:init_app/widgets/button_main.dart';

import '../../common/constant.dart';

// ignore: must_be_immutable
class CommentScreen extends BaseWidget<CommentController> {
  static const String routeName = '/comment';
  static const String name = 'Bình luận';
  final controllerTextEdit = TextEditingController();
  String id;

  @override
  void dispose() {
    // super.dispose();
    controllerTextEdit.dispose();
  }

  CommentScreen(this.id);

  @override
  Widget build(BuildContext context, {controllerSuper}) {
    super.build(context, controllerSuper: CommentController());
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
                      CommentScreen.name,
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
            Container(
              padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 15.0),
              child: Row(
                children: [
                  Text("Bình luận"),
                  Container(
                    padding: EdgeInsets.only(left: 15.0, right: 10.0),
                    child: RatingBarIndicator(
                      rating: 5,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Color(Constant.colorStar),
                      ),
                      unratedColor: Colors.grey[200],
                      itemCount: 5,
                      itemSize: 18.0,
                      direction: Axis.horizontal,
                    ),
                  ),
                  Text(
                    "(Bắt buộc)",
                    style: TextStyle(
                        color: Color(Constant.colorTxtDefault), fontSize: 13.0),
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
                    controller: controllerTextEdit,
                    onChanged: (text) {
                    },
                    decoration: InputDecoration(
                      hintText:
                          "Chấm điểm và viết nhận xét của bạn (trong ${controller.maxCount} chữ)",
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
                  child: GetBuilder<CommentController>(
                    builder: (controller) => Text(
                      (controller.maxCount - controllerTextEdit.text.length).toString(),
                      style: TextStyle(fontSize: 10.0),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 15.0),
              width: double.infinity,
              height: 40.0,
              child: ButtonMain(
                name: "send",
                color: Color(Constant.colorTxtSecond),
                func: () {
                  controller.sendCmt(controllerTextEdit.text, idBook: id);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
