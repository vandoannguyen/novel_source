import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/data/network/NovalChapterModel.dart';
import 'package:init_app/screen/chapter_list/chapter_list_controller.dart';

class ChapterList extends BaseWidget<ChapterListController> {
  var id;
  var _controller = ScrollController();

  ChapterList(this.id) {
    print("this.id${this.id}");
  }

  @override
  Widget build(BuildContext context) {
    _controller.addListener(() {});
    initState(controller: ChapterListController(context));
    controller.getChapterList(id, page: 1);
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black87,
                        ),
                        onPressed: () => Navigator.of(context).pop()),
                    Expanded(
                        child: Text(
                      "Chapter list".toUpperCase(),
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ))
                  ],
                ),
              ),
              Expanded(
                child: GetBuilder<ChapterListController>(
                  init: controller,
                  builder: (_) => _.list == null || _.list.isEmpty
                      ? Container(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          controller: _controller,
                          itemCount: _.list.length,
                          itemBuilder: (ctx, index) => GestureDetector(
                            onTap: () {
                              clickItemChap(_.list[index]);
                            },
                            child: ItemChapter(_.list[index]),
                          ),
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void clickItemChap(NovalChapterModel chapter) {
    controller.read(chapter);
  }
}

class ItemChapter extends StatelessWidget {
  NovalChapterModel model;

  ItemChapter(this.model);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(model.title),
            ),
            Divider(
              color: Colors.pink,
              height: 1,
            )
          ],
        ));
  }
}
