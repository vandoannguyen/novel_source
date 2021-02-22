import 'package:flutter/material.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/screen/bookstore/free_bookstore/free_bookstore_controller.dart';

import '../../../common/constant.dart';

// ignore: must_be_immutable
class FreeBookstoreScreen extends BaseWidget<FreeBookstoreController> {
  static const String routeName = '/FreeBookstore';
  static const String name = 'Books Store';
  void clickItem(item, index) {
    print("fhsdf  $index");
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) {
          return itemBook(index, index);
        });
  }

  Widget itemBook(item, index) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(Constant.colorTxtDefault).withOpacity(0.5),
            width: 0.3,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                  color: Color(Constant.colorTxtDefault).withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image.network(
                "https://www.gettyimages.com/gi-resources/images/500px/983794168.jpg",
                fit: BoxFit.cover,
                width: 80.0,
                height: 100.0,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("name",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                  Text(
                      "TS sẽ lì xì luôn 1tr cho tất cả ứng viên trúng tuyển join trong tháng 02 này luôn nhé 😍, quy trình phỏng vấn tinh gọn chỉ  01 vòng ONLINE qua SKYPE thuiii, người nhà ITS dễ xương lắm, gia nhập biệt đội dễ xương LUÔN HÔM NAY, APPLY GỬI CV ĐỂ CÓ CƠ HỘI NHẬN QUÀ NHÉ CÁC DEV",
                      style: TextStyle(
                        fontSize: 13.0,
                        color: Color(Constant.colorTxtDefault),
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "tacgia",
                          style: TextStyle(
                              color: Color(Constant.colorTxtPrimary),
                              fontSize: 13.0),
                        ),
                        Image.asset(
                          Common.pathImg + "ic_edit.png",
                          width: 100.0,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
