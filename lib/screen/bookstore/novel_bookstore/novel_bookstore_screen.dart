import 'package:flutter/material.dart';
import 'package:init_app/widgets/item_book_hor.dart';
import 'package:init_app/widgets/item_book_ver.dart';

import '../../../common/common.dart';
import '../../../common/constant.dart';

class NovelBookstoreScreen extends BaseWidget<NovelBookController> {
  static const String routeName = '/NovelBookstore';
  static const String name = 'NovelBookstore';
  NovelBookController controller = Get.put(NovelBookController());
  final CarouselController controllerCarousel = CarouselController();
  final CarouselController controllerCarouselNewest = CarouselController();

  @override
  initState({NovelBookController controller}) {
    return super.initState(controller: controller);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
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
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: false,
                  onPageChanged: controller.changeCarousel,
                  scrollDirection: Axis.horizontal,
                ),
                items: controller.images.map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(color: Colors.amber),
                        child: Image.network(
                          item,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              Positioned(
                bottom: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: controller.images.map((url) {
                    int index = controller.images.indexOf(url);
                    return GetBuilder<NovelBookController>(
                      init: NovelBookController(),
                      builder: (controller) => Container(
                        width: 10.0,
                        height: 2.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: controller.currentCarousel == index
                              ? Color(Constant.colorTxtSecond)
                              : Color(0xFFfdbbc5),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          titleWidget(
              checkAll: true,
              icon: "ic_edit.png",
              name: " Mới nhất",
              nameAll: "Xem tất cả",
              funcAll: () {}),
          Stack(
            alignment: Alignment.center,
            children: [
              CarouselSlider(
                carouselController: controllerCarouselNewest,
                options: CarouselOptions(
                  // disableCenter: true,
                  height: 180.0,
                  // aspectRatio: 1.0,
                  viewportFraction: 0.3,
                  initialPage: 1,
                  enableInfiniteScroll: false,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  onPageChanged: controller.changeCarouselNewest,
                  scrollDirection: Axis.horizontal,
                ),
                items: controller.images.map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        padding: EdgeInsets.only(bottom: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          boxShadow: [
                            BoxShadow(
                              color: Color(Constant.colorTxtDefault)
                                  .withOpacity(0.2),
                              spreadRadius: 0,
                              blurRadius: 10,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: FadeInImage.assetNetwork(
                            placeholder: Common.pathImg + "ic_edit.png",
                            image: item,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 25.0,
                    child: IconButton(
                      padding: EdgeInsets.all(0.0),
                      icon: Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 16.0,
                        color: Color(Constant.colorTxtDefault),
                      ),
                      onPressed: () => controllerCarouselNewest.previousPage(),
                    ),
                  ),
                  Container(
                    width: 25.0,
                    child: IconButton(
                      padding: EdgeInsets.all(0.0),
                      icon: Icon(
                        Icons.navigate_next_rounded,
                        size: 25.0,
                        color: Color(Constant.colorTxtDefault),
                      ),
                      onPressed: () => controllerCarouselNewest.nextPage(),
                    ),
                  ),
                ],
              ),
            ],
          ),
          GetBuilder<NovelBookController>(
            init: NovelBookController(), // INIT IT ONLY THE FIRST TIME
            builder: (controller) => Container(
              padding: EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      "${controller.currentCarouselNewest} Bánh Mì Ông Màu",
                      style: TextStyle(
                        color: Color(Constant.colorTxtDefault),
                        fontSize: 18.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    // controller.images[controller.currentCarouselNewest] +
                    "Bánh Mì Ông Màu|Tập 78 Full:i Quốc Cường Bánh Mì Ông Màu|Tập 78 Full: Ra tay bóp cổ Như Quỳnh, Trúc Linh bị lộ thân phận với Quốc Cường",
                    style: TextStyle(color: Color(Constant.colorTxtDefault)),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          titleWidget(
              checkAll: true,
              icon: "ic_edit.png",
              name: " Khu mực miễn phí",
              nameAll: "Xem tất cả",
              funcAll: () {}),
          GridView.count(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            childAspectRatio: 0.6,
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 15.0),
            children: List.generate(1, (index) {
              return itemBookVer(
                  index: index,
                  item: index,
                  func: () {
                    controller.clickItem(index, index);
                  });
            }),
          ),
          titleWidget(
              checkAll: true,
              icon: "ic_edit.png",
              name: " Sách hot bán chạy",
              nameAll: "Xem tất cả",
              funcAll: () {}),
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return itemBookHor(
                    index: index,
                    item: index,
                    func: () {
                      controller.clickItem(index, index);
                    });
              }),
        ],
      ),
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
                  Text(
                    name,
                    style: TextStyle(
                      color: Color(Constant.colorTxtSecond),
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
}
