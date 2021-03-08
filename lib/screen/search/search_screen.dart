import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/app_localizations.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/common/constant.dart';
import 'package:init_app/common/images.dart';
import 'package:init_app/data/network/NovalModel.dart';
import 'package:init_app/screen/search/search_controller.dart';

// ignore: must_be_immutable
class SearchScreen extends BaseWidget<SearchController> {
  static const String routeName = '/search';
  static const String name = 'Search';

  @override
  Widget build(BuildContext context, {controllerSuper}) {
    super.build(context, controllerSuper: SearchController());
    controller.getNewest();
    controller.getHotest();
    // ValueNotifier<List<NovelModel>> filtered =
    //     ValueNotifier<List<NovelModel>>([]);

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              // height: 40,
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
                              hintText: AppLocalizations.of(context)
                                  .translate("search for books or authors"),
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
                          AppLocalizations.of(context).translate("No"),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12),
                        ))),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GetBuilder<SearchController>(
                  // global: false,
                  builder: (__) {
                return __.isFocus
                    ? Container(
                        child: __.listSearch != null
                            ? Container(
                                child: __.listSearch.length > 0
                                    ? ListView.builder(
                                        itemCount: controller.listSearch.length,
                                        physics:
                                            AlwaysScrollableScrollPhysics(),
                                        shrinkWrap: true,
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
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            Common.pathImg + "img_empty.png",
                                            height: 150.0,
                                            fit: BoxFit.contain,
                                          ),
                                          Text(
                                            AppLocalizations.of(context)
                                                .translate("List is empty"),
                                            style: TextStyle(
                                                color: Color(
                                                    Constant.colorTxtDefault),
                                                fontSize: 15.0),
                                          ),
                                        ],
                                      ),
                              )
                            : Container(
                                alignment: Alignment.center,
                                child: CircularProgressIndicator(),
                              ),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  top: 10, left: 10, right: 10, bottom: 10.0),
                              child: Row(
                                children: [
                                  Image.asset(
                                      Common.pathImg + "promotional.png",
                                      height: 20.0,
                                      width: 20.0),
                                  Container(
                                    margin: EdgeInsets.only(left: 5.0),
                                    child: Text(
                                      AppLocalizations.of(context)
                                          .translate("hottest"),
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
                                      alignment: Alignment.topCenter,
                                      child: GridView.builder(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          padding: EdgeInsets.fromLTRB(
                                              0.0, 0, 0.0, 0.0),
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
                                                        10),
                                          ),
                                          itemCount: 4,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            int ind = index + 1;
                                            return GestureDetector(
                                              onTap: () {
                                                _.clickItem(
                                                    ind, _.listNewest[index]);
                                              },
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                                alignment: Alignment.topCenter,
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
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
                              margin: EdgeInsets.only(left: 10, top: 10.0),
                              child: Row(
                                children: [
                                  Image.asset(Common.pathImg + "like.png",
                                      height: 20.0, width: 20.0),
                                  Container(
                                    margin: EdgeInsets.only(left: 5.0),
                                    child: Text(
                                      AppLocalizations.of(context)
                                          .translate("hot selling books"),
                                      style: TextStyle(color: Colors.pink),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GetBuilder<SearchController>(
                              builder: (_) {
                                return _.listHotest == null
                                    ? Container(
                                        height: 180,
                                        alignment: Alignment.center,
                                        child: CircularProgressIndicator())
                                    : GridView.builder(
                                        physics: NeverScrollableScrollPhysics(),
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
                                        padding: EdgeInsets.fromLTRB(
                                            10.0, 15, 10.0, 15.0),
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
                                                  left: 5, right: 5),
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
                          ],
                        ),
                      );
              }),
            )
          ],
        ),
      ),
    );
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          Text(
                              item.writerName != null
                                  ? "${item.writerName}"
                                  : "",
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.red,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),
                          Container(
                            padding: EdgeInsets.fromLTRB(20.0, 5.0, 10.0, 5.0),
                            decoration: BoxDecoration(
                              image: new DecorationImage(
                                image: new ExactAssetImage(
                                    'assets/images/ic_comic_book.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Text(
                                AppLocalizations.of(controller.context)
                                    .translate("novel"),
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
                      padding: EdgeInsets.only(bottom: 0.0),
                      child: Text("${item.desc}",
                          style: TextStyle(
                              fontSize: 12.0,
                              color: Color(Constant.colorTxtDefault),
                              height: 1.25),
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
}
