import 'package:flutter/material.dart';
import 'package:init_app/widgets/item_book_hor.dart';
import 'package:init_app/widgets/item_book_ver.dart';

import '../../../common/Common.dart';
import '../../../common/constant.dart';

class NovelBookstoreScreen extends StatefulWidget {
  static const String routeName = '/NovelBookstore';
  static const String name = 'Books Store';
  NovelBookstoreScreen({Key key}) : super(key: key);

  @override
  _NovelBookstoreState createState() => _NovelBookstoreState();
}

class _NovelBookstoreState extends State<NovelBookstoreScreen> {
  void clickItem(index, item) {
    print("object $index");
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          titleWidget(all: true, icon: "ic_edit.png", name: " Mới nhất"),
          titleWidget(
              all: true, icon: "ic_edit.png", name: " Khu mực miễn phí"),
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
                    clickItem(index, index);
                  });
            }),
          ),
          titleWidget(
              all: true, icon: "ic_edit.png", name: " Sách hot bán chạy"),
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return itemBookHor(
                    index: index,
                    item: index,
                    func: () {
                      clickItem(index, index);
                    });
              }),
        ],
      ),
    );
  }

  Widget titleWidget({icon, name, all}) {
    return Container(
      margin: EdgeInsets.fromLTRB(10.0, 10.0, 5.0, 10.0),
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
                Text(name,
                    style: TextStyle(color: Color(Constant.colorTxtPrimary))),
              ],
            ),
          ),
          all
              ? Container(
                  child: Row(
                    children: [
                      Text(
                        "Xem tất cả",
                        style:
                            TextStyle(color: Color(Constant.colorTxtDefault)),
                      ),
                      Container(
                        margin: EdgeInsets.all(0.0),
                        child: Icon(
                          Icons.navigate_next_rounded,
                          color: Color(Constant.colorTxtDefault),
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
