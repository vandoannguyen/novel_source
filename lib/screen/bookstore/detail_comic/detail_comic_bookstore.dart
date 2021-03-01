import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/common/constant.dart';
import 'package:init_app/data/network/NovalModel.dart';
import 'package:init_app/data/repository.dart';
import 'package:init_app/widgets/bottom_sheet_coin.dart';
import 'package:init_app/widgets/dialog_loading.dart';
import 'detail_widget.dart';
import 'pilihbad_widget.dart';
import 'package:flutter_share/flutter_share.dart';

class DetailComicBook extends StatefulWidget {
  DetailComicBook({Key key}) : super(key: key);

  @override
  _DetailComicBookState createState() => _DetailComicBookState();
}

class _DetailComicBookState extends State<DetailComicBook> with SingleTickerProviderStateMixin {
  TabController _controller;
  bool isFollow = false;
  NovelModel detail;
  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 2, vsync: this);
  }

  Future<void> share(String link) async {
    await FlutterShare.share(title: 'Share book', text: 'Share book', linkUrl: link, chooserTitle: 'Choose app share book');
  }

  void postFollow(String idBook) {
    showDialogLoading(context);
    if (Common.myBooks.where((element) => element.id == idBook).toList().length == 0) {
      RepositoryImpl.getInstance().addBookIntoMyBooks(idBook: idBook).then((value) {
        if (value != null) {
          print(value);
          // Navigator.of(context).pop();
          Navigator.pop(context);
          Common.myBooks.add(NovelModel.fromJson(detail.toJson()));
          //update();
        }
      }).catchError((err) {
        Navigator.pop(context);
        // Navigator.of(context).pop();
      });
    } else {
      RepositoryImpl.getInstance().removeBookFromMyBook(idBook: idBook).then((value) {
        print(value);
        // Navigator.of(context).pop();
        Navigator.pop(context);
        Common.myBooks = Common.myBooks.where((e) => e.id != detail.id).toList();
        //update();
      }).catchError((err) {
        //Navigator.of(context).pop();
        Navigator.pop(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                expandedHeight: 220.0,
                floating: false,
                pinned: true,
                flexibleSpace: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      child: Image(
                        image: NetworkImage(
                          "https://www.gettyimages.com/gi-resources/images/500px/983794168.jpg",
                        ),
                        fit: BoxFit.fill,
                      ),
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
                  IconButton(
                    onPressed: () {
                      share("link book");
                    },
                    icon: Icon(
                      Icons.share_outlined,
                      color: Colors.white,
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
                        text: 'List',
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
                        postFollow("idTest");
                        setState(() {
                          // isFollow = !isFollow;
                          detail != null && !Common.myBooks.where((value) => value.id == detail.id).toList().isNotEmpty
                              ? isFollow = false
                              : isFollow = true;
                          //Navigator.pop(context);
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
                          child: Text(isFollow ? "Bookcase" : "Follow",
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
                        onDialogBottomSheet(context);
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
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
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
