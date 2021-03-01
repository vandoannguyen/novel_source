import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/app_localizations.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/common/constant.dart';
import 'package:init_app/screen/table_content/table_content_controller.dart';
import 'package:init_app/widgets/appbar_second.dart';

// ignore: must_be_immutable
class TableContentScreen extends BaseWidget<TableContentController> {
  static const String routeName = '/table-content';
  static const String name = 'table content';
  String id;
  ScrollController _scrollController;

  TableContentScreen(this.id);

  @override
  Widget build(BuildContext context, {controllerSuper}) {
    super.build(context, controllerSuper: TableContentController());
    controller.getChapter(id);
    controller.getChapterBought(id);
    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.offset >=
                _scrollController.position.maxScrollExtent &&
            !_scrollController.position.outOfRange) {
          controller.loadMore(id);
        }
      });
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            appbarSecond(AppLocalizations.of(context).translate(name)),
            Expanded(
              child: GetBuilder<TableContentController>(
                builder: (_) =>
                    // _.listChaps == null || _.isLoadig
                    //     ? Container(
                    //         alignment: Alignment.center,
                    //         child: CircularProgressIndicator(),
                    //       )
                    //     :
                    Stack(
                  children: [
                    ListView.builder(
                        controller: _scrollController,
                        physics: AlwaysScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:
                            _.listChaps == null ? 0 : _.listChaps.length + 1,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              controller.read(_.listChaps[index]);
                            },
                            child: index < _.listChaps.length
                                ? Container(
                                    color: Colors.transparent,
                                    padding: EdgeInsets.all(15.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "${_.listChaps[index].title}",
                                          ),
                                        ),
                                        _.listChaps[index].coin > 0 &&
                                                !_.listChapterBought.contains(
                                                    _.listChaps[index].id)
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
                                  )
                                : _.isLoadAll
                                    ? Container()
                                    : Container(
                                        height: 40,
                                        alignment: Alignment.center,
                                        child: CircularProgressIndicator(),
                                      ),
                          );
                        }),
                    GetBuilder<TableContentController>(
                        builder: (_) => _.isLoadig
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
