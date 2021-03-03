import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/app_localizations.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/common/images.dart';
import 'package:init_app/data/network/NovalModel.dart';
import 'package:init_app/screen/bookstore/novel_bookstore/novel_book_controller.dart';
import 'package:init_app/screen/list_all_novel/list_all_novel.dart';
import 'package:init_app/utils/intent_animation.dart';
import 'package:init_app/widgets/item_book_hor.dart';

import '../../../common/common.dart';
import '../../../common/constant.dart';

class NovelBookstoreScreen extends BaseWidget<NovelBookController> {
  static const String routeName = '/NovelBookstore';
  static const String name = 'NovelBookstore';
  final CarouselController controllerCarousel = CarouselController();
  final CarouselController controllerCarouselNewest = CarouselController();

  var _scrollController;

  void clickItem(index, item) {
    print("object ${item.toJson()}");
  }

  @override
  Widget build(BuildContext context, {NovelBookController controllerSuper}) {
    super.build(context, controllerSuper: NovelBookController());
    controller.getBanner();
    controller.getNewest();
    controller.getHotest();
    _scrollController = new ScrollController()
      ..addListener(() {
        if (_scrollController.offset >=
                _scrollController.position.maxScrollExtent &&
            !_scrollController.position.outOfRange) {
          print("Scroll to bottom");
          // controller.loadMore(id);
          controller.loadMoreHotest();
        }
      });
    return SingleChildScrollView(
      child: Column(
        children: [
          GetBuilder<NovelBookController>(
              // init: controller,
              builder: (_) {
            return _.listBanner == null
                ? Container(
                    height: 180,
                    width: 180 * 9 / 16,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  )
                : Stack(
                    alignment: Alignment.center,
                    children: [
                      CarouselSlider(
                        carouselController: controllerCarousel,
                        options: CarouselOptions(
                          height: 180.0,
                          aspectRatio: 16 / 9,
                          viewportFraction: 1,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: false,
                          onPageChanged: controller.changeCarousel,
                          scrollDirection: Axis.horizontal,
                        ),
                        items: _.listBanner.map((item) {
                          return Builder(
                            builder: (BuildContext context) {
                              return GestureDetector(
                                  onTap: () {
                                    controller.clickItem(
                                        _, NovelModel(id: item.bookId));
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: FadeInImage.assetNetwork(
                                      image: item.bannerPic,
                                      placeholder: ic_loading,
                                      fit: BoxFit.cover,
                                    ),
                                  ));
                            },
                          );
                        }).toList(),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _.listBanner.map((url) {
                            int index = _.listBanner.indexOf(url);
                            return GetBuilder<NovelBookController>(
                              builder: (_) => Container(
                                width: 10.0,
                                height: 2.0,
                                margin: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 2.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: _.currentCarousel == index
                                      ? Color(Constant.colorTxtSecond)
                                      : Color(0xFFfdbbc5),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  );
          }),
          titleWidget(
              checkAll: true,
              icon: "ic_edit.png",
              name: AppLocalizations.of(context).translate("newest"),
              nameAll: AppLocalizations.of(context).translate("read more"),
              funcAll: () {
                IntentAnimation.intentNomal(
                    context: context,
                    screen: ListAllNovel(
                      title:  AppLocalizations.of(context).translate("NOVEL NEWEST"),
                      type: ListAllNovel.NEW,
                    ));
              }),
          GetBuilder<NovelBookController>(
            builder: (_) => _.listNewest == null
                ? Container(
                    height: 180,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  )
                : GetBuilder<NovelBookController>(
                    // init: controller,
                    builder: (_) {
                      return _.listNewest == null
                          ? Container(
                              height: 180,
                              alignment: Alignment.center,
                              child: CircularProgressIndicator())
                          : Column(
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    CarouselSlider(
                                      carouselController:
                                          controllerCarouselNewest,
                                      options: CarouselOptions(
                                        // disableCenter: true,
                                        height: 180.0,
                                        // aspectRatio: 1.0,
                                        viewportFraction: 0.3,
                                        initialPage: 1,
                                        enableInfiniteScroll: false,
                                        autoPlayInterval: Duration(seconds: 3),
                                        autoPlayAnimationDuration:
                                            Duration(milliseconds: 800),
                                        autoPlayCurve: Curves.fastOutSlowIn,
                                        enlargeCenterPage: true,
                                        onPageChanged: (index, _) {
                                          controller.changeCarouselNewest(
                                              index, _);
                                        },
                                        scrollDirection: Axis.horizontal,
                                      ),
                                      items: _.listNewest.map((item) {
                                        return Builder(
                                          builder: (BuildContext context) {
                                            return GestureDetector(
                                              onTap: () {
                                                controller.clickItem(_, item);
                                              },
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                    bottom: 5.0),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color(Constant
                                                              .colorTxtDefault)
                                                          .withOpacity(0.2),
                                                      spreadRadius: 0,
                                                      blurRadius: 10,
                                                      offset: Offset(0, 0),
                                                    ),
                                                  ],
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                  child:
                                                      FadeInImage.assetNetwork(
                                                    placeholder: ic_loading,
                                                    image: item.bpic,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      }).toList(),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          width: 25.0,
                                          child: IconButton(
                                            padding: EdgeInsets.all(0.0),
                                            icon: Icon(
                                              Icons.arrow_back_ios_rounded,
                                              size: 16.0,
                                              color: Color(
                                                  Constant.colorTxtDefault),
                                            ),
                                            onPressed: () =>
                                                controllerCarouselNewest
                                                    .previousPage(),
                                          ),
                                        ),
                                        Container(
                                          width: 25.0,
                                          child: IconButton(
                                            padding: EdgeInsets.all(0.0),
                                            icon: Icon(
                                              Icons.navigate_next_rounded,
                                              size: 25.0,
                                              color: Color(
                                                  Constant.colorTxtDefault),
                                            ),
                                            onPressed: () =>
                                                controllerCarouselNewest
                                                    .nextPage(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                GetBuilder<NovelBookController>(
                                  init:
                                      controller, // INIT IT ONLY THE FIRST TIME
                                  builder: (_) => Container(
                                    padding: EdgeInsets.fromLTRB(
                                        15.0, 25.0, 15.0, 20.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding:
                                              EdgeInsets.only(bottom: 15.0),
                                          child: Text(
                                            "${_.listNewest[_.currentCarouselNewest].name}",
                                            style: TextStyle(
                                              color: Color(
                                                  Constant.colorTxtDefault),
                                              fontSize: 16.0,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Text(
                                          // controller.images[controller.currentCarouselNewest] +
                                          "${_.listNewest[_.currentCarouselNewest].desc}",
                                          style: TextStyle(
                                              color: Color(
                                                  Constant.colorTxtDefault),
                                              fontSize: 13.5,
                                              height: 1.25),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            );
                    },
                  ),
          ),
          // titleWidget(
          //     checkAll: true,
          //     icon: "ic_edit.png",
          //     name: " Khu mực miễn phí",
          //     nameAll: "Xem tất cả",
          //     funcAll: () {}),
          // GridView.count(
          //   physics: NeverScrollableScrollPhysics(),
          //   shrinkWrap: true,
          //   childAspectRatio: 0.6,
          //   crossAxisCount: 3,
          //   crossAxisSpacing: 10,
          //   mainAxisSpacing: 10,
          //   padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 15.0),
          //   children: List.generate(1, (index) {
          //     return Container();
          //     // return itemBookVer(
          //     //     index: index,
          //     //     // item: null,
          //     //     item: Common.myBooks[index],
          //     //     func: () {
          //     //       controller.clickItem(index, Common.myBooks[index]);
          //     //     });
          //   }),
          // ),
          titleWidget(
              checkAll: true,
              icon: "ic_edit.png",
              name: AppLocalizations.of(context).translate("hot selling books"),
              nameAll: AppLocalizations.of(context).translate("read more"),
              funcAll: () {
                IntentAnimation.intentNomal(
                    context: context,
                    screen: ListAllNovel(
                      title: AppLocalizations.of(context).translate("NOVEL HOTTEST"),
                      type: ListAllNovel.HOT,
                    ));
              }),
          GetBuilder<NovelBookController>(
            // init: controller,
            builder: (_) {
              return _.listHotest == null
                  ? Container(
                      height: 180,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator())
                  : ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _.listHotest.length + 1,
                      itemBuilder: (BuildContext context, int index) {
                        return index == _.listHotest.length
                            ? _.isLoadAll
                                ? Container()
                                : Container(
                                    height: 50,
                                    child: CircularProgressIndicator(),
                                    alignment: Alignment.center)
                            : itemBookHor(
                                index: index,
                                item: _.listHotest[index],
                                func: () {
                                  controller.clickItem(
                                      index, _.listHotest[index]);
                                });
                      });
            },
          ),
        ],
      ),
      controller: _scrollController,
    );
  }

  Widget titleWidget({icon, name, checkAll, nameAll, funcAll}) {
    return GestureDetector(
      onTap: funcAll,
      child: Container(
        margin: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Image.asset(
                    Common.pathImg + icon,
                    width: 20.0,
                    height: 20.0,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Text(
                      name,
                      style: TextStyle(
                        color: Color(Constant.colorTxtSecond),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            checkAll
                ? Row(
                    children: [
                      Text(
                        nameAll,
                        style:
                            TextStyle(color: Color(Constant.colorTxtDefault)),
                      ),
                      Icon(
                        Icons.navigate_next_rounded,
                        color: Color(Constant.colorTxtDefault),
                      ),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  void changeLanguage() {
    print("okok changeLanguage");
  }
}
