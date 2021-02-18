import 'package:flutter/material.dart';
import 'package:init_app/common/constant.dart';
import 'package:init_app/screen/bookstore/detail/invite_friend_widget.dart';
import 'package:init_app/screen/bookstore/detail/myfriend_widget.dart';

class InviteFriend extends StatefulWidget {
  InviteFriend({Key key}) : super(key: key);

  @override
  _InviteFriendState createState() => _InviteFriendState();
}

class _InviteFriendState extends State<InviteFriend>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Moi ban be",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TabBar(
              controller: _controller,
              indicatorColor: Color(Constant.colorTxtPrimary),
              indicatorSize: TabBarIndicatorSize.label,
              unselectedLabelColor: Color(Constant.colorTxtDefault),
              labelColor: Color(Constant.colorTxtPrimary),
              tabs: [
                new Tab(
                  text: 'Moi ban be',
                ),
                new Tab(
                  text: 'Ban toi',
                ),
              ],
            ),
            Expanded(
              child: new TabBarView(
                controller: _controller,
                children: <Widget>[
                  InviteFriendWidget(),
                  MyFriendWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
