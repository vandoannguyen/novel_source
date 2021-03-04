import 'package:flutter/material.dart';
import 'package:init_app/app_localizations.dart';
import 'package:init_app/common/constant.dart';
import 'package:init_app/screen/bookcase/bookcase_screen.dart';
import 'package:init_app/screen/bookstore/bookstore_screen.dart';
import 'package:init_app/screen/personal/personal_screen.dart';
import 'package:init_app/screen/task/task_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  HomeScreen({Key key, this.index}) : super(key: key);
  int index;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[];

  PageController _pageController;
  BookcaseScreen bookcaseScreen;
  BookstoreScreen bookstoreScreen;
  TaskScreen taskScreen;
  PersonalScreen personalScreen;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bookcaseScreen = BookcaseScreen((value) {
      _selectedIndex = 1;
      setState(() {});
      if (_pageController != null) _pageController.jumpToPage(_selectedIndex);
      _widgetOptions.elementAt(_selectedIndex);
    } //callback change page
        );
    createBookStore();
    taskScreen = TaskScreen(callBack: callBack);
    personalScreen = PersonalScreen(callBack: callBack);
    _widgetOptions = <Widget>[
      bookcaseScreen,
      bookstoreScreen,
      taskScreen,
      personalScreen
    ];
    if (widget.index != null) {
      _pageController =
          new PageController(initialPage: widget.index, keepPage: true);
    } else {
      _pageController = new PageController(initialPage: 0, keepPage: true);
    }
  }

  void _onItemTapped(int index) {
    _pageController.jumpToPage(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  void callBack(key, value) {
    print("callback${key}");
    switch (key) {
      case "GOTO_TAB":
        _onItemTapped(value);
        break;
      case "CHANGE_LANGUAGE":
        bookstoreScreen.changeLanguage();
        createBookStore();
        break;

      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: _widgetOptions,
          onPageChanged: (page) {},
        ),
        // child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/ic_menu_bookcase.png",
              height: 25.0,
              fit: BoxFit.contain,
            ),
            activeIcon: Image.asset(
              "assets/images/ic_menu_bookcase_ac.png",
              height: 25.0,
              fit: BoxFit.contain,
            ),
            label: AppLocalizations.of(context).translate("bookcase"),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/ic_menu_bookstore.png",
              fit: BoxFit.contain,
              height: 25.0,
            ),
            activeIcon: Image.asset(
              "assets/images/ic_menu_bookstore_ac.png",
              height: 25.0,
              fit: BoxFit.contain,
            ),
            label: AppLocalizations.of(context).translate("bookstore"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined),
            label: AppLocalizations.of(context).translate("tasks"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: AppLocalizations.of(context).translate("personal"),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(Constant.colorTxtSecond),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        selectedLabelStyle: TextStyle(fontSize: 11.0),
        unselectedLabelStyle: TextStyle(fontSize: 10.0),
      ),
    );
  }

  void createBookStore() {
    bookstoreScreen = BookstoreScreen();
  }
}
