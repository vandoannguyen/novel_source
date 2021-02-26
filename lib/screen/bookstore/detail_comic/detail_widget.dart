import 'package:flutter/material.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/screen/bookstore/detail_comic/invite_friend.dart';
import 'package:init_app/screen/comment/comment_screen.dart';
import 'package:init_app/screen/comment_all/comment_all_screen.dart';
import 'package:init_app/screen/tutorials/tutorial_loaded_coin.dart';
import 'package:init_app/widgets/description_text.dart';
import 'package:init_app/widgets/bottom_sheet_coin.dart';

class DetailWidget extends StatefulWidget {
  DetailWidget({Key key}) : super(key: key);

  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 10),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "Author",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13, color: Colors.grey[400]),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5.0),
                        child: Text(
                          "Hoa Hoa",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 13, color: Colors.grey[800]),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "Status",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13, color: Colors.grey[400]),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5.0),
                        child: Text(
                          "Updating",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 13, color: Colors.grey[800]),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 265),
                    child: Text(
                      "Introduce",
                      style: TextStyle(fontSize: 13, color: Colors.grey[400]),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: DescriptionTextWidget(
                        text:
                            "Pin của iPhone sử dụng công nghệ lithium-ion. So với các thế hệ công nghệ pin trước đây, pin lithium-ion sạc nhanh hơn, tuổi thọ cao hơn và có mật độ năng lượng lớn hơn giúp tăng thời lượng và giảm trọng lượng. Công nghệ pin sạc lithium-ion hiện nay là công nghệ tốt nhất cho thiết bị của bạn. Tìm hiểu thêm về pin lithium-ion."),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "10432",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13, color: Colors.pink),
                      ),
                      Text(
                        "Reads",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13, color: Colors.grey[800]),
                      ),
                    ],
                  ),
                  Container(
                    height: 30,
                    child: VerticalDivider(
                      width: 1,
                      color: Colors.grey[400],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "334",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13, color: Colors.pink),
                      ),
                      Text(
                        "Like",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13, color: Colors.grey[800]),
                      ),
                    ],
                  ),
                  Container(
                    height: 30,
                    child: VerticalDivider(
                      width: 1,
                      color: Colors.grey[400],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "1359",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13, color: Colors.pink),
                      ),
                      Text(
                        "Bookcase",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13, color: Colors.grey[800]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(children: <Widget>[
                    Expanded(child: Container(margin: EdgeInsets.only(left: 10, right: 10), child: Divider())),
                    Text(
                      "Reward",
                      style: TextStyle(color: Colors.pink),
                    ),
                    Expanded(child: Container(margin: EdgeInsets.only(left: 10, right: 10), child: Divider())),
                  ]),
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                    height: 30,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 12,
                      itemBuilder: (context, i) {
                        return Container(
                          margin: EdgeInsets.all(3),
                          child: Image.asset(
                            Common.pathImg + "ic_user.png",
                            height: 20,
                            width: 20,
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Row(
                            children: <Widget>[
                              Image.asset(
                                Common.pathImg + "ic_coin.png",
                                height: 20,
                                width: 20,
                              ),
                              Text("3720",
                                  style: TextStyle(
                                    color: Colors.pink,
                                  )),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            onDialogBottomSheet(context);
                          },
                          child: Container(
                            height: 30,
                            width: 80,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: Center(
                              child: Text(
                                "Reward",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              color: Colors.grey[400],
            ),
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => InviteFriend()));
              },
              title: Text(
                "Invite friends to receive coins",
                style: TextStyle(color: Colors.black),
              ),
              trailing: Icon(
                Icons.navigate_next_sharp,
                color: Colors.grey,
              ),
            ),
            Divider(
              height: 1,
              color: Colors.grey[400],
            ),
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TutorialLoadedCoin()));
              },
              title: Text(
                "How to make a coin?",
                style: TextStyle(color: Colors.black),
              ),
              trailing: Icon(
                Icons.navigate_next_sharp,
                color: Colors.grey,
              ),
            ),
            Divider(
              height: 1,
              color: Colors.grey[400],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CommentScreen("test")));
              },
              child: Container(
                margin: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Comment",
                      style: TextStyle(color: Colors.black),
                    ),
                    Image.asset(
                      Common.pathImg + "ic_edit.png",
                      height: 20,
                      width: 20,
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              height: 1,
              color: Colors.grey[400],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CommentAllScreen()));
              },
              child: Container(
                margin: EdgeInsets.all(10),
                height: 30,
                child: Center(
                  child: Text(
                    "Watch all to comment",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
              child: Container(
                color: Colors.grey[200],
              ),
            ),
            Container(
              height: 80,
              margin: EdgeInsets.only(top: 20, right: 260),
              child: Text(
                "HOTTEST",
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.black, fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
