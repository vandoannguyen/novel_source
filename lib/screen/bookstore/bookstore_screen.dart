import 'package:flutter/material.dart';
import 'package:init_app/common/constant.dart';
import 'package:init_app/screen/bookstore/novel_bookstore/novel_bookstore_screen.dart';
import 'package:init_app/screen/search/search_screen.dart';

class BookstoreScreen extends StatefulWidget {
  static const String routeName = '/bookstore';
  static const String name = 'KHO SÁCH';

  BookstoreScreen({Key key}) : super(key: key);

  @override
  _BookstoreState createState() => _BookstoreState();
}

class _BookstoreState extends State<BookstoreScreen>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 1, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchScreen()));
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                padding: EdgeInsets.symmetric(vertical: 5.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Tìm kiếm sách, tác giả ",
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                    Icon(
                      Icons.search,
                      size: 15.0,
                      color: Colors.grey[400],
                    ),
                  ],
                ),
              ),
            ),
            // new TabBar(
            //   controller: _controller,
            //   indicatorColor: Color(Constant.colorTxtPrimary),
            //   indicatorSize: TabBarIndicatorSize.label,
            //   unselectedLabelColor: Color(Constant.colorTxtDefault),
            //   labelColor: Color(Constant.colorTxtPrimary),
            //   tabs: [
            //     new Tab(
            //       text: 'Tiểu thuyết',
            //     ),
            //     new Tab(
            //       text: 'Miễn phí',
            //     ),
            //     new Tab(
            //       text: 'Truyện tranh',
            //     ),
            // ],
            // ),
            // Expanded(
            //   child: new TabBarView(
            //     controller: _controller,
            //     children: <Widget>[
            //       // NovelBookstoreScreen(),
            //       //       FreeBookstoreScreen(),
            //       //       ComicBookstoreScreen(),
            //     ],
            //   ),
            // ),
             Container(
            padding: EdgeInsets.fromLTRB(0, 5.0, 0, 15.0),
            child: Text("Tiểu thuyết", style: TextStyle(color: Color(Constant.colorTxtPrimary), fontSize: 20.0, fontWeight: FontWeight.bold),)),
          Expanded(
            child: new TabBarView(
              controller: _controller,
              children: <Widget>[
                NovelBookstoreScreen(),
                // FreeBookstoreScreen(),
                // ComicBookstoreScreen(),
              ],
            ),
          ),
          ],
        ),
    );
  }
}
