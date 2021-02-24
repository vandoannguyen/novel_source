import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/common/images.dart';
import 'package:init_app/screen/detail_comic_book_screen/detail_comic_book_controller.dart';
import 'package:init_app/widgets/button_main.dart';
import 'package:init_app/widgets/item_book_ver.dart';

import '../../common/constant.dart';

// ignore: must_be_immutable
class DetailComicBookScreen extends BaseWidget<DetailComicBookController> {
  String idBook;

  DetailComicBookScreen({this.idBook});

  static const String routeName = '/detail-comic-book';
  static const String name = 'Chi tiết sách tiểu thuyết';

  @override
  Widget build(BuildContext context, {controllerSuper}) {
    super.build(context, controllerSuper: DetailComicBookController());
    var size = MediaQuery.of(context).size;
    controller.getBookDetail(idBook);
    controller.getComments(idBook);
    controller.getHotest();
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage(Common.pathImg + "bg_btn_checkined.jpg"),
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                  child: new BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.white.withOpacity(0.2),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(0.0, 35.0, 0.0, 0.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    icon: Icon(
                                      Icons.arrow_back_ios_rounded,
                                      color: Color(Constant.colorTxtDefault),
                                    ),
                                    onPressed: () {
                                      controller.callBack("BACK", null);
                                    }),
                                IconButton(
                                  onPressed: () {
                                    controller.callBack("SHARE", null);
                                  },
                                  icon: Icon(
                                    Icons.share_outlined,
                                    color: Color(Constant.colorTxtDefault),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.fromLTRB(20.0, 20.0, 10.0, 30.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(Constant.colorTxtDefault)
                                            .withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5.0),
                                    child:
                                        GetBuilder<DetailComicBookController>(
                                      builder: (_) =>
                                          _.detail == null || _.isLoading
                                              ? Image.asset(
                                                  ic_loading,
                                                  fit: BoxFit.cover,
                                                  width: 80.0,
                                                  height: 100.0,
                                                )
                                              : FadeInImage.assetNetwork(
                                                  placeholder: ic_loading,
                                                  image: _.detail.bpic,
                                                  fit: BoxFit.cover,
                                                  width: 80.0,
                                                  height: 100.0,
                                                ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GetBuilder<DetailComicBookController>(
                                    builder: (_) => Container(
                                      padding: EdgeInsets.only(left: 10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                              _.detail != null && !_.isLoading
                                                  ? _.detail.name
                                                  : "",
                                              style: TextStyle(
                                                fontSize: 18.0,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  _.detail != null &&
                                                          !_.isLoading
                                                      ? _.detail.writerName
                                                      : "",
                                                  style:
                                                      TextStyle(fontSize: 13.0),
                                                ),
                                                Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5.0),
                                                    height: 10.0,
                                                    width: 1.0,
                                                    color: Colors.black),
                                                Text(
                                                  "FULL",
                                                  style:
                                                      TextStyle(fontSize: 12.0),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            "Cập nhật tới ..",
                                            style: TextStyle(
                                              fontSize: 13.0,
                                              color: Color(
                                                  Constant.colorTxtSecond),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          RatingBarIndicator(
                                            rating: 2.75,
                                            itemBuilder: (context, index) =>
                                                Icon(
                                              Icons.star,
                                              color: Color(Constant.colorStar),
                                            ),
                                            unratedColor: Colors.white,
                                            itemCount: 5,
                                            itemSize: 18.0,
                                            direction: Axis.horizontal,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //
                Container(
                  color: Colors.white,
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 0.5,
                          color:
                              Color(Constant.colorTxtDefault).withOpacity(0.5),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 0.0),
                        child: Text(
                          "Reward",
                          style: TextStyle(
                            color: Color(Constant.colorTxtSecond),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 0.5,
                          color:
                              Color(Constant.colorTxtDefault).withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 30.0,
                  color: Colors.white,
                  child: ListView.builder(
                      physics: AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 15,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30.0),
                            child: Image.asset(
                              ic_loading,
                              fit: BoxFit.cover,
                              width: 30.0,
                              height: 30.0,
                            ),
                            // child: Image.assest(
                            //   "https://www.gettyimages.com/gi-resources/images/500px/983794168.jpg",
                            //   fit: BoxFit.cover,
                            //   width: 30.0,
                            //   height: 30.0,
                            // ),
                          ),
                        );
                      }),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(top: 15.0, bottom: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Common.pathImg + "ic_coin.png",
                        width: 18.0,
                        height: 18.0,
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Text(
                          "1234",
                          style:
                              TextStyle(color: Color(Constant.colorTxtSecond)),
                        ),
                      ),
                      Container(
                          height: 25.0,
                          child: ButtonMain(
                              name: "Thưởng",
                              func: () {},
                              color: Color(Constant.colorTxtSecond))),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 10.0),
                  child: GetBuilder<DetailComicBookController>(
                    builder: (_) => _.textShowFlag
                        ? Text(
                            _.detail != null && !_.isLoading
                                ? _.detail.desc
                                : "",
                            style: TextStyle(fontSize: 14.0),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )
                        : Text(
                            // xem full des
                            _.detail != null && !_.isLoading
                                ? _.detail.desc
                                : "",
                            style: TextStyle(fontSize: 14.0),
                          ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      controller.clickShowMore(controller.textShowFlag);
                    },
                    child: GetBuilder<DetailComicBookController>(
                        builder: (_) => Container(
                              padding: EdgeInsets.all(10),
                              color: Colors.transparent,
                              child: _.textShowFlag
                                  ? Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "Xem thêm",
                                          style: TextStyle(
                                              color: Color(
                                                  Constant.colorTxtSecond)),
                                        ),
                                        Icon(Icons.keyboard_arrow_down_rounded,
                                            color:
                                                Color(Constant.colorTxtSecond))
                                      ],
                                    )
                                  : Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "Rút gọn",
                                          style: TextStyle(
                                              color: Color(
                                                  Constant.colorTxtSecond)),
                                        ),
                                        Icon(Icons.keyboard_arrow_up_rounded,
                                            color:
                                                Color(Constant.colorTxtSecond))
                                      ],
                                    ),
                            )),
                  ),
                ),
                //
                Container(
                  height: 0.5,
                  color: Color(Constant.colorTxtDefault).withOpacity(0.3),
                ),

                //TABLE_CONTENT
                GestureDetector(
                  onTap: () {
                    controller.callBack("TABLE_CONTENT", idBook);
                  },
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 5.0),
                          child: Image.asset(
                            Common.pathImg + "ic_edit.png",
                            width: 20.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Text(
                          "Mục lục",
                          style: TextStyle(),
                        ),
                        Expanded(child: Container()),
                        Text(
                          "FULL",
                          style:
                              TextStyle(color: Color(Constant.colorTxtSecond)),
                        ),
                        Icon(
                          Icons.navigate_next_rounded,
                          color: Color(Constant.colorTxtDefault),
                        ),
                      ],
                    ),
                  ),
                ),
                //INVITE
                GestureDetector(
                  onTap: () {
                    controller.callBack("INVITE", null);
                  },
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Mời bạn bè sẽ được tặng xu",
                          style: TextStyle(),
                        ),
                        Expanded(child: Container()),
                        Icon(
                          Icons.navigate_next_rounded,
                          color: Color(Constant.colorTxtDefault),
                        ),
                      ],
                    ),
                  ),
                ),
                //  HOW_ADD_COIN
                GestureDetector(
                  onTap: () {
                    controller.callBack("HOW_ADD_COIN", null);
                  },
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Làm sao để nạp xu?",
                          style: TextStyle(),
                        ),
                        Expanded(child: Container()),
                        Icon(
                          Icons.navigate_next_rounded,
                          color: Color(Constant.colorTxtDefault),
                        ),
                      ],
                    ),
                  ),
                ),
//COMMENT
//                 Container(
//                   color: Colors.white,
//                   padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 10.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Bình luận",
//                         style: TextStyle(),
//                       ),
//                       Expanded(child: Container()),
//                       GestureDetector(
//                         onTap: () {
//                           controller.callBack("COMMENT", idBook);
//                         },
//                         child: Image.asset(
//                           Common.pathImg + "ic_edit.png",
//                           width: 20.0,
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 //ALL_CMT
//                 GestureDetector(
//                   onTap: () {
//                     controller.callBack("ALL_COMMENT", null);
//                   },
//                   child: Container(
//                     alignment: Alignment.center,
//                     padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       border: Border(
//                         top: BorderSide(
//                           color:
//                               Color(Constant.colorTxtDefault).withOpacity(0.5),
//                           width: 0.3,
//                         ),
//                       ),
//                     ),
//                     child: Text(
//                       "Xem tất cả bình luận",
//                       style: TextStyle(
//                         color: Color(Constant.colorTxtDefault),
//                       ),
//                     ),
//                   ),
//                 ),
                GetBuilder<DetailComicBookController>(
                    builder: (_) => _.hotest != null
                        ? hotBook(_.hotest)
                        : Container(
                            height: 180,
                            alignment: Alignment.center,
                            child: CircularProgressIndicator(),
                          )),
              ],
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  controller.postFollow(idBook);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 40.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(Constant.colorTxtDefault).withOpacity(0.5),
                      width: 0.3,
                    ),
                  ),
                  child: GetBuilder<DetailComicBookController>(
                    builder: (_) => Text(
                      _.detail != null &&
                              !Common.myBooks
                                  .where((value) => value.id == _.detail.id)
                                  .toList()
                                  .isEmpty
                          ? "Unfollow"
                          : "Follow",
                      style: TextStyle(
                        color: Color(Constant.colorTxtSecond),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  controller.callBack("TABLE_CONTENT", idBook);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 40.0,
                  // decoration: BoxDecoration(
                  color: Color(Constant.colorTxtSecond),
                  //   border: Border.all(
                  //     color: Color(Constant.colorTxtDefault).withOpacity(0.5),
                  //     width: 0.3,
                  //   ),
                  // ),
                  child: Text(
                    "Read now",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(Constant.colorTxtDefault).withOpacity(0.5),
                    width: 0.3,
                  ),
                ),
                child: Text(
                  "Reward",
                  style: TextStyle(
                    color: Color(Constant.colorTxtSecond),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    ));
  }

  Widget hotBook(hotest) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(padding: EdgeInsets.all(15.0), child: Text("HOTEST")),
          Row(
            children: (hotest as List)
                .map((e) => Expanded(
                      flex: 1,
                      child: Container(
                        height: 180.0,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child: itemBookVer(
                            item: e,
                            func: (_) {
                              idBook = e.id;
                              controller.getBookDetail(idBook);
                              controller.getComments(idBook);
                              controller.getHotest();
                            }),
                      ),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
