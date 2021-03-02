import 'package:flutter/material.dart';
import 'package:init_app/screen/bookstore/detail_comic/invite_friend_widget.dart';

class InviteFriend extends StatefulWidget {
  InviteFriend({Key key}) : super(key: key);

  @override
  _InviteFriendState createState() => _InviteFriendState();
}

class _InviteFriendState extends State<InviteFriend> with SingleTickerProviderStateMixin {
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
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          "Invite friend",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            // TabBar(
            //   controller: _controller,
            //   indicatorColor: Color(Constant.colorTxtPrimary),
            //   indicatorSize: TabBarIndicatorSize.label,
            //   unselectedLabelColor: Color(Constant.colorTxtDefault),
            //   labelColor: Color(Constant.colorTxtPrimary),
            //   tabs: [
            //     new Tab(
            //       text: 'Invite friend',
            //     ),
            //     new Tab(
            //       text: 'My friend',
            //     ),
            //   ],
            // ),
            Expanded(
              child: InviteFriendWidget(),
              // child: new TabBarView(
              //   controller: _controller,
              //   children: <Widget>[
              //InviteFriendWidget(),
              //MyFriendWidget(),
              //],
              //),
            ),
          ],
        ),
      ),
    );
  }
}
