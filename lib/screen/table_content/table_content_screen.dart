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
  String id;
  ScrollController _scrollController;

  TableContentScreen(this.id);

  @override
  Widget build(BuildContext context, {controllerSuper}) {
    super.build(context, controllerSuper: TableContentController());
    controller.getChapter(id);
    _scrollController = ScrollController()
      ..addListener(() {
        print(_scrollController.position.extentAfter);
        if (_scrollController.position.extentAfter < 500) {
          // setState(() {
          //   items.addAll(new List.generate(42, (index) => 'Inserted $index'));
          // });
        }
        // if (_scrollController.position.pixels ==
        //     _scrollController.position.maxScrollExtent) {
        //   controller.loadMore(id);
        // }
      });
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            appbarSecond(TableContentScreen.name),
            Expanded(
              child: GetBuilder<TableContentController>(
                builder: (_) => _.listChaps == null || _.isLoadig
                    ? Container(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      )
                    : Stack(
                        children: [
                          ListView.builder(
                              controller: _scrollController,
                              physics: AlwaysScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: _.listChaps.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    controller.read(_.listChaps[index]);
                                  },
                                  child: Container(
                                    color: Colors.transparent,
                                    padding: EdgeInsets.all(15.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            _.listChaps[index].title,
                                          ),
                                        ),
                                        _.listChaps[index].coin > 0
                                            ? Icon(
                                                Icons.lock_outline_rounded,
                                                size: 20.0,
                                                color: Color(
                                                    Constant.colorTxtDefault),
                                              )
                                            : Container(
                                                width: 20,
                                              )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                          GetBuilder<TableContentController>(
                              builder: (_) => _.isLoadMore
                                  ? GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        color: Colors.transparent,
                                        alignment: Alignment.center,
                                        child: CircularProgressIndicator(),
                                      ),
                                    )
                                  : Container(
                                      height: 0,
                                    )),
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
