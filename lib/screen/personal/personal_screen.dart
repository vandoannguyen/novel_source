import 'package:flutter/material.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/widgets/button_main.dart';

import '../../common/constant.dart';
import '../../common/constant.dart';

class PersonalScreen extends StatefulWidget {
  static const String routeName = '/personal';
  static const String name = 'CÁ NHÂN';
  PersonalScreen({Key key}) : super(key: key);

  @override
  _PersonalState createState() => _PersonalState();
}

class _PersonalState extends State<PersonalScreen> {
  void napXu() {}

  void click(key) {
    switch (key) {
      case "DETAIL_TRANSACTION":
        break;
      case "SUPPORT":
        break;
      case "COME_AUTHOR":
        break;
      case "QUESTION":
        break;
      case "FEEDBACK":
        break;
      case "SETTING":
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey[200],
      child: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              width: size.width,
              padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
              child: Text(PersonalScreen.name,
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 15.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    color: Color(Constant.colorTxtDefault).withOpacity(0.5),
                    width: 0.3,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(10.0, 0, 15.0, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: Image.network(
                        "https://www.gettyimages.com/gi-resources/images/500px/983794168.jpg",
                        fit: BoxFit.cover,
                        width: 50.0,
                        height: 50.0,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: EdgeInsets.only(bottom: 5.0),
                          child: Text(
                            "name",
                            style: TextStyle(fontSize: 20.0),
                          )),
                      Text(
                        "id",
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Color(Constant.colorTxtDefault)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Text("Số dư xu: " + "40.0"),
                        Image.asset(
                          Common.pathImg + "ic_coin.png",
                          fit: BoxFit.contain,
                          width: 18.0,
                          height: 18.0,
                        ),
                      ],
                    ),
                  ),
                  ButtonMain(
                      name: "Nạp Xu",
                      func: () {
                        napXu();
                      })
                ],
              ),
            ),
            SizedBox(
              height: 3.0,
            ),
            item(
                name: "Chi tiết giao dịch xu",
                icon: "ic_edit.png",
                func: () {
                  click("DETAIL_TRANSACTION");
                }),
            item(
                name: "Hỗ trợ online",
                icon: "ic_edit.png",
                func: () {
                  click("SUPPORT");
                }),
            item(
                name: "Trở thành tác giả",
                icon: "ic_edit.png",
                func: () {
                  click("COME_AUTHOR");
                }),
            item(
                name: "Câu hỏi thường gặp",
                icon: "ic_edit.png",
                func: () {
                  click("QUESTION");
                }),
            item(
                name: "Ý kiến phản hồi",
                icon: "ic_edit.png",
                func: () {
                  click("FEEDBACK");
                }),
            item(
                name: "Cài đặt",
                icon: "ic_edit.png",
                func: () {
                  click("SETTING");
                }),
          ],
        ),
      ),
    );
  }

  Widget item({name, icon, func}) {
    return GestureDetector(
      onTap: func,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              color: Color(Constant.colorTxtDefault).withOpacity(0.5),
              width: 0.3,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(15.0),
              child: Image.asset(
                Common.pathImg + icon,
                width: 25.0,
                height: 25.0,
              ),
            ),
            Expanded(child: Text(name)),
            Container(
              margin: EdgeInsets.all(5.0),
              child: Icon(
                Icons.navigate_next_rounded,
                color: Color(Constant.colorTxtDefault),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
