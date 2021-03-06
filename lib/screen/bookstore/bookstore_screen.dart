import 'package:flutter/material.dart';
import 'package:init_app/app_localizations.dart';
import 'package:init_app/common/constant.dart';
import 'package:init_app/screen/bookstore/novel_bookstore/novel_bookstore_screen.dart';
import 'package:init_app/screen/search/search_screen.dart';

class BookstoreScreen extends StatefulWidget {
  static const String routeName = '/bookstore';
  static const String name = 'bookstore';
  _BookstoreState state;
  // dynamic isChangeLanguage = false;

  BookstoreScreen({Key key}) : super(key: key);

  @override
  _BookstoreState createState() {
    state = _BookstoreState();
    return state;
  }

  void changeLanguage() {
    // isChangeLanguage = true;
    if (state != null) {
      state.changeLanguage();
    }
  }
}

class _BookstoreState extends State<BookstoreScreen>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController _controller;
  NovelBookstoreScreen novelBookstoreScreen;

  @override
  void initState() {
    super.initState();
    novelBookstoreScreen = NovelBookstoreScreen();
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
                    AppLocalizations.of(context)
                        .translate("search for books or authors"),
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
          //       text: 'Ti???u thuy???t',
          //     ),
          //     new Tab(
          //       text: 'Mi???n ph??',
          //     ),
          //     new Tab(
          //       text: 'Truy???n tranh',
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
              child: Text(
                AppLocalizations.of(context).translate("novel"),
                style: TextStyle(
                    color: Color(Constant.colorTxtPrimary),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              )),
          Expanded(
            child: new TabBarView(
              controller: _controller,
              children: <Widget>[
                novelBookstoreScreen
                // FreeBookstoreScreen(),
                // ComicBookstoreScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  void changeLanguage() {
    if (novelBookstoreScreen != null) novelBookstoreScreen.changeLanguage();
  }
}
