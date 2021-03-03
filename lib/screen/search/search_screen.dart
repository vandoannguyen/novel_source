import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/common/constant.dart';
import 'package:init_app/data/network/NovalModel.dart';
import 'package:init_app/screen/search/search_controller.dart';
import 'package:init_app/common/images.dart';
// ignore: must_be_immutable
class SearchScreen extends BaseWidget<SearchController> {
  static const String routeName = '/search';
  static const String name = 'Search';

  @override
  Widget build(BuildContext context, {controllerSuper}) {
    super.build(context, controllerSuper: SearchController());
    controller.getNewest();
    controller.getHotest();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Center(
                      child: IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          iconSize: 22,
                          color: Colors.grey[800],
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ),
                  ),
                  Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width * 0.72,
                    margin: EdgeInsets.only(top: 6, bottom: 6),
                    // margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                    // padding: EdgeInsets.symmetric(vertical: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    ),
                    child: Center(
                      child: GetBuilder<SearchController>(
                        builder: (_) {
                          return TextField(
                            onTap: () {
                              _.isFocus = true;
                            },
                            controller: _.textcontroller,
                            onChanged: (text) {
                              if (text.length > 0) {
                                controller.getSearch(text);
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(top: 3, left: 15.0),
                              fillColor: Colors.grey[400],
                              hintText: "Search book, author",
                              hintStyle: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 12,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.0),
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(32.0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.0),
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(32.0),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.onClickSearch();
                    },
                    child: Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.all(10),
                        child: Center(
                            child: Text(
                              "No",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12),
                        ))),
                  ),
                ],
              ),
            ),
            Expanded(child: GetBuilder<SearchController>(
                // global: false,
                builder: (__) {
              return __.isFocus
                  ? Container(
                      child: __.listSearch != null
                          ? Container(
                              child: __.listSearch.length > 0
                                  ? ListView.builder(
                                      itemCount: controller.listSearch.length,
                                      itemBuilder: (context, index) {
                                        final item =
                                            controller.listSearch[index];
                                        return itemBookSearch(
                                            index: index,
                                            item: item,
                                            func: () {
                                              __.clickItem(index, item);
                                              __.onClickSearch();
                                            });
                                      })
                                  : Container(
                                      child: Text(
                                        "List is empty",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0),
                                      ),
                                    ),
                            )
                          : Container(
                        alignment: Alignment.topCenter,
                              child: Container(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                    )
                  : Container(
                      child: Column(
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(top: 10, left: 10, right: 10),
                            child: Row(
                              children: [
                                Image.asset(Common.pathImg + "promotional.png",
                                    height: 20.0, width: 20.0),
                                Container(
                                  margin: EdgeInsets.only(left: 5.0),
                                  child: Text(
                                    "HOTTEST",
                                    style: TextStyle(color: Colors.pink),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GetBuilder<SearchController>(
                            builder: (_) => _.listNewest == null
                                ? Container(
                                    height: 180,
                                    alignment: Alignment.center,
                                    child: CircularProgressIndicator(),
                                  )
                                : Container(
                                    height: 120,
                                    child: GridView.builder(
                                        physics:
                                            AlwaysScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio:
                                              MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  (MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      8),
                                        ),
                                        itemCount: 4,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          int ind = index + 1;
                                          return GestureDetector(
                                            onTap: () {
                                              _.clickItem(
                                                  ind, _.listNewest[index]);
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(left: 10),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 20,
                                                    width: 20,
                                                    color: Colors.red,
                                                    child: Center(
                                                      child: Text("$ind",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white)),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5.0),
                                                    child: Center(
                                                      child: Text(
                                                        "${_.listNewest[index].name}",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            color: Colors
                                                                .grey[800],
                                                            fontSize: 11.0),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Image.asset(Common.pathImg + "like.png",
                                    height: 20.0, width: 20.0),
                                Container(
                                  margin: EdgeInsets.only(left: 5.0),
                                  child: Text(
                                    "Sach hot ban chay",
                                    style: TextStyle(color: Colors.pink),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: GetBuilder<SearchController>(
                              builder: (_) {
                                return _.listHotest == null
                                    ? Container(
                                        height: 180,
                                        alignment: Alignment.center,
                                        child: CircularProgressIndicator())
                                    : GridView.builder(
                                        // physics: AlwaysScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          mainAxisSpacing: 10,
                                          childAspectRatio: 0.75,
                                          // childAspectRatio: MediaQuery.of(context).size.width /
                                          //     (MediaQuery.of(context).size.height),
                                        ),
                                        itemCount: 6,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          int ind = index + 1;
                                          return GestureDetector(
                                            onTap: () {
                                              _.clickItem(
                                                  ind, _.listHotest[index]);
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  left: 10, right: 10),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.network(
                                                    "${_.listHotest[index].bpic}",
                                                    fit: BoxFit.cover,
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: 5.0),
                                                    child: Center(
                                                      child: Text(
                                                        "${_.listHotest[index].name}",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            color: Colors
                                                                .grey[800],
                                                            fontSize: 13.0),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                              },
                            ),
                          ),
                        ],
                      ),
                    );
            }))
          ],
        ),
      ),
    );
  }
}
Widget itemBookSearch({NovelModel item, index, func}) {
  return GestureDetector(
    onTap: func,
    child: Container(
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
              child: FadeInImage.assetNetwork(
                placeholder: ic_loading,
                image: item.bpic,
                fit: BoxFit.cover,
                width: 80.0,
                height: 120.0,
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
                  Text("${item.name}",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                  Container(
                    margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${item.writerName}",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.red,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text("Tieu thuyet",
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.white,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Text("${item.desc}",
                        style: TextStyle(
                            fontSize: 12.0,
                            color: Color(Constant.colorTxtDefault),
                            height: 1.25
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis),
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
