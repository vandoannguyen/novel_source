import 'package:flutter/material.dart';
import 'package:init_app/app_localizations.dart';
import 'package:init_app/screen/bookcase/bookcase_screen.dart';
import 'package:init_app/screen/bookstore/bookstore_screen.dart';
import 'package:init_app/screen/personal/personal_screen.dart';
import 'package:init_app/screen/task/task_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[];

  PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _widgetOptions = <Widget>[
      BookcaseScreen((value) {
        _selectedIndex = 1;
        setState(() {});
        _widgetOptions.elementAt(_selectedIndex);
      } //callback change page
          ),
      BookstoreScreen(),
      // TaskScreen(),
      TaskScreen(callBack: callBack),
      PersonalScreen()
    ];
    _pageController = new PageController(initialPage: 0, keepPage: true);
  }

  void _onItemTapped(int index) {
    _pageController.jumpToPage(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  void callBack(key, value) {
    switch (key) {
      case "GOTO_BOOKCASE":
        _onItemTapped(0);
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
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            activeIcon: Image.asset(
              "assets/images/ic_edit.png",
              width: 25.0,
              height: 25.0,
              color: Colors.pink,
            ),
            label: AppLocalizations.of(context).translate("bookcase"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
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
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        selectedLabelStyle: TextStyle(fontSize: 11.0),
        unselectedLabelStyle: TextStyle(fontSize: 10.0),
      ),
    );
  }
}
