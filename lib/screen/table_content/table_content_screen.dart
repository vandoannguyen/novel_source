import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/common/constant.dart';
import 'package:init_app/screen/table_content/table_content_controller.dart';

// ignore: must_be_immutable
class TableContentScreen extends BaseWidget<TableContentController> {
  static const String routeName = '/table-content';
  static const String name = 'Mục lục';
  TableContentController controller = Get.put(TableContentController());

  @override
  initState({TableContentController controller}) {
    print("initState");
    return super.initState(controller: controller);
  }

  @override
  Widget build(BuildContext context) {
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
                      TableContentScreen.name,
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
            Expanded(
              child: ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Chương 1 : Nhắm mắt lại",
                            ),
                          ),
                          Icon(
                            Icons.lock_outline_rounded,
                            size: 20.0,
                            color: Color(Constant.colorTxtDefault),
                          )
                        ],
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
