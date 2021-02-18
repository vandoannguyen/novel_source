import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:init_app/common/constant.dart';
import 'package:init_app/screen/login/login_screen.dart';
import 'detail_widget.dart';
import 'pilihbad_widget.dart';

class DetailComicBook extends StatefulWidget {
  DetailComicBook({Key key}) : super(key: key);

  @override
  _DetailComicBookState createState() => _DetailComicBookState();
}

class _DetailComicBookState extends State<DetailComicBook>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 2, vsync: this);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } else {
      _onReward();
    }
  }

  void _onReward() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 49,
                  child: ListTile(
                    selectedTileColor: Colors.white,
                    leading: Icon(Icons.control_point),
                    title: Text(
                      "15",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Divider(
                  height: 1,
                  color: Colors.grey[400],
                ),
                Container(
                  height: 49,
                  child: ListTile(
                    selectedTileColor: Colors.white,
                    leading: Icon(Icons.control_point),
                    title: Text(
                      "50",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Divider(
                  height: 1,
                  color: Colors.grey[400],
                ),
                Container(
                  height: 49,
                  child: ListTile(
                    selectedTileColor: Colors.white,
                    leading: Icon(Icons.control_point),
                    title: Text(
                      "100",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Divider(
                  height: 1,
                  color: Colors.grey[400],
                ),
                Container(
                  height: 50,
                  child: ListTile(
                    selectedTileColor: Colors.grey[200],
                    title: Text(
                      "Khong",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[800]),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            new Container(
                width: double.infinity,
                height: 220,
                child: Stack(
                  children: <Widget>[
                    Image.network(
                      "https://www.gettyimages.com/gi-resources/images/500px/983794168.jpg",
                      fit: BoxFit.fitWidth,
                      height: 220,
                      width: width,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(60),
                              ),
                              margin: EdgeInsets.fromLTRB(20, 30, 0, 10),
                              height: 30,
                              width: 30,
                              child: Center(
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: 25,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(60),
                              ),
                              margin: EdgeInsets.fromLTRB(0, 30, 20, 10),
                              height: 30,
                              width: 30,
                              child: Center(
                                child: Icon(
                                  Icons.share,
                                  size: 25,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 30, top: 170),
                      height: 20,
                      child: Text("Name Book",
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    ),
                  ],
                )),
            new TabBar(
              controller: _controller,
              indicatorColor: Color(Constant.colorTxtPrimary),
              indicatorSize: TabBarIndicatorSize.label,
              unselectedLabelColor: Color(Constant.colorTxtDefault),
              labelColor: Color(Constant.colorTxtPrimary),
              tabs: [
                new Tab(
                  text: 'Detail',
                ),
                new Tab(
                  text: 'Pilih Bad',
                ),
              ],
            ),
            Expanded(
              child: new TabBarView(
                controller: _controller,
                children: <Widget>[
                  DetailWidget(),
                  PilihbadWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Text("Follow"),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Text("Read Now"),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Text("Coin"),
            label: "",
          ),
        ],
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        onTap: _onItemTapped,
      ),
    );
  }
}
