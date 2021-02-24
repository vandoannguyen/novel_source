import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/widgets/item_book_hor.dart';

import 'list_all_novel_controller.dart';

class ListAllNovel extends BaseWidget<ListAllNovelController> {
  static final String HOT = "hot";
  static final String NEW = "new";
  static final String FREE = "free";
  String title;
  String type;

  ScrollController _scrollController;

  ListAllNovel({this.title, this.type});

  Widget build(BuildContext context, {controllerSuper}) {
    super.build(context, controllerSuper: ListAllNovelController());
    _scrollController = new ScrollController()..addListener(() {
      if (_scrollController.offset >=
          _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        controller.loadMore();
      }
    });
    controller.getList(type);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(title,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400)),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: GetBuilder<ListAllNovelController>(
            builder: (_) => Stack(
                  children: [
                    ListView.builder(
                        controller: _scrollController,
                        itemCount: _.list != null ? _.list.length : 0,
                        itemBuilder: (BuildContext context, int index) {
                          return itemBookHor(
                              index: index,
                              item: _.list[index],
                              func: () {
                                controller.clickItem(index, _.list[index]);
                              });
                        }),
                    _.isLoading
                        ? GestureDetector(
                            onTap: () {},
                            child: Container(
                              alignment: Alignment.center,
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : Container(height: 0)
                  ],
                )),
      ),
    );
  }
}
