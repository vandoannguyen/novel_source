import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/common/constant.dart';
import 'package:init_app/screen/login/login_screen.dart';
import 'detail_widget.dart';
import 'pilihbad_widget.dart';
import 'package:flutter_share/flutter_share.dart';
class DetailComicBook extends StatefulWidget {
  DetailComicBook({Key key}) : super(key: key);

  @override
  _DetailComicBookState createState() => _DetailComicBookState();
}

class _DetailComicBookState extends State<DetailComicBook>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  int _selectedIndex = 0;
  bool isFollow = false;
  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 2, vsync: this);
  }
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  //   if (index == 0) {
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => LoginScreen()));
  //   } else {
  //     _onReward();
  //   }
  // }
  Future<void> share() async {
    await FlutterShare.share(
        title: 'Example share',
        text: 'Example share text',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Example Chooser Title');
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Common.pathImg + "ic_coin.png",
                        width: 18.0,
                        height: 18.0,
                      ),
                      Text(
                        "15",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                  color: Colors.grey[400],
                ),
                Container(
                  height: 49,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Common.pathImg + "ic_coin.png",
                        width: 18.0,
                        height: 18.0,
                      ),
                      Text(
                        "50",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                  color: Colors.grey[400],
                ),
                Container(
                  height: 49,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Common.pathImg + "ic_coin.png",
                        width: 18.0,
                        height: 18.0,
                      ),
                      Text(
                        "150",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                  color: Colors.grey[400],
                ),
                Container(
                  color: Colors.grey[200],
                  height: 50,
                  child: ListTile(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    selectedTileColor: Colors.grey[200],
                    title: Text(
                      "No",
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
      body:DefaultTabController(
        length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              leading: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 15, left: 25),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey[200])
                  ),
                  child: Column(
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 8, left: 5),
                          child: Icon(Icons.arrow_back_ios, color: Colors.grey,)),
                    ],
                  ),
                ),
              ),
              expandedHeight: 220.0,
              floating: false,
              pinned: true,
              flexibleSpace: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    child: Image(image: NetworkImage(
                      "https://www.gettyimages.com/gi-resources/images/500px/983794168.jpg",

                    ), fit: BoxFit.fill,),
                  ),
                  FlexibleSpaceBar(
                      centerTitle: true,
                      title: Text("Name book",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          )),
                      background: Image.network(
                        "https://www.gettyimages.com/gi-resources/images/500px/983794168.jpg",
                        fit: BoxFit.cover,
                      )),
                ],

              ),
              actions: [
                GestureDetector(
                  onTap: (){
                    Fluttertoast.showToast(msg: "Share link", toastLength: Toast.LENGTH_SHORT, backgroundColor: Colors.grey, textColor: Colors.white, gravity: ToastGravity.CENTER);
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 15, right: 25),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey[200])
                    ),
                    child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: 8, left: 3, right: 3),
                            child: Icon(Icons.share, color: Colors.grey,)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(
                TabBar(
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
              ),
              pinned: true,
            ),
          ];
        },
        body: Column(
      children: [
      // new TabBar(
      //   controller: _controller,
      //   indicatorColor: Color(Constant.colorTxtPrimary),
      //   indicatorSize: TabBarIndicatorSize.label,
      //   unselectedLabelColor: Color(Constant.colorTxtDefault),
      //   labelColor: Color(Constant.colorTxtPrimary),
      //   tabs: [
      //     new Tab(
      //       text: 'Detail',
      //     ),
      //     new Tab(
      //       text: 'Pilih Bad',
      //     ),
      //   ],
      // ),
      Expanded(
        flex: 1,
        child: new TabBarView(
          controller: _controller,
          children: <Widget>[
            DetailWidget(),
            PilihbadWidget(),
          ],
        ),
      ),
      Container(
        height: 45,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                setState(() {
                  isFollow = !isFollow;
                });
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => LoginScreen()));
              },
              child: Container(
                height: 45,
                width: width * 0.3,
                child: Center(
                  child: Text(isFollow? "Bookcase" : "Follow",
                      style: TextStyle(
                        color: Colors.pink,
                      )),
                ),
              ),
            ),
            Divider(
              height: 1,
              color: Colors.grey,
            ),
            GestureDetector(
              child: Container(
                color: Colors.pink,
                height: 45,
                width: width * 0.3,
                child: Center(
                  child: Text("Read Now",
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
              ),
            ),
            Divider(
              height: 1,
              color: Colors.grey,
            ),
            GestureDetector(
              onTap: () {
                _onReward();
              },
              child: Container(
                height: 45,
                width: width * 0.3,
                child: Center(
                  child: Text("Coin",
                      style: TextStyle(
                        color: Colors.pink,
                      )),
                ),
              ),
            ),
          ],
        ),

      ),
      ],
        ),

      ),

      // bottomNavigationBar: BottomNavigationBar(
      //   items: <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Text(
      //         "Follow",
      //         style: TextStyle(color: Colors.pink),
      //       ),
      //       label: "",
      //     ),
      //     BottomNavigationBarItem(
      //       backgroundColor: Colors.pink,
      //       icon: Text(
      //         "Read Now",
      //         style: TextStyle(color: Colors.pink),
      //       ),
      //       label: "",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Text(
      //         "Coin",
      //         style: TextStyle(color: Colors.pink),
      //       ),
      //       label: "",
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   showSelectedLabels: false,
      //   selectedItemColor: Colors.pink,
      //   unselectedItemColor: Colors.white,
      //   showUnselectedLabels: false,
      //   onTap: _onItemTapped,
      // ),
      ),
    );
  }
}
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
