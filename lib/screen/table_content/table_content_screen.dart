import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/common/constant.dart';
import 'package:init_app/screen/table_content/table_content_controller.dart';
import 'package:init_app/widgets/appbar_second.dart';

// ignore: must_be_immutable
class TableContentScreen extends BaseWidget<TableContentController> {
  static const String routeName = '/table-content';
  static const String name = 'Mục lục';
  TableContentController controller = Get.put(TableContentController());

  @override
  initState({TableContentController controller}) {
    return super.initState(controller: controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            appbarSecond(TableContentScreen.name),
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
