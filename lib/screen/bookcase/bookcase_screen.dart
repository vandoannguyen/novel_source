import 'package:flutter/material.dart';
import 'package:init_app/widgets/button_main.dart';
import 'package:init_app/widgets/item_book_ver.dart';

import '../../common/Common.dart';

class BookcaseScreen extends StatefulWidget {
  static const String routeName = '/bookcase';
  static const String name = 'TỦ SÁCH';
  BookcaseScreen({Key key}) : super(key: key);

  @override
  _BookcaseState createState() => _BookcaseState();
}

class _BookcaseState extends State<BookcaseScreen> {
  List list = [
    "fbhgf",
    "Note for anyone visiting this page in 2020",
    "fbhgf",
    "Note for anyone visiting this page in 2020",
    "fbhgf",
    "fbhgf",
    "fbhgf",
    "fbhgf",
  ];
  void clickItem(index, item) {
    print("object $index");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    BookcaseScreen.name,
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        Common.pathImg + "ic_edit.png",
                        width: 20.0,
                        height: 20.0,
                      ),
                      Text("Manage"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Login to read more!",
                  style: TextStyle(color: Colors.grey[400]),
                ),
                ButtonMain(
                  name: "Login",
                  func: () {},
                  color: Color(0xFFF44336),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              physics: AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              childAspectRatio: 0.6,
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 15.0),
              children: List.generate((list.length + 1), (index) {
                if (index == list.length)
                  return addBook();
                else
                  return itemBookVer(list[index], index);
                return itemBookVer(
                    item: list[index],
                    index: index,
                    func: () {
                      clickItem(index, index);
                    });
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget addBook() {
    return Container(
      padding: EdgeInsets.all(0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Image.network(
              "https://blog.hamtruyentranh.com/wp-content/uploads/2019/01/55950935_p0.png",
              fit: BoxFit.fill,
            ),
          ),
          Container(
            height: 60.0,
          ),
        ],
      ),
    );
  }
}
