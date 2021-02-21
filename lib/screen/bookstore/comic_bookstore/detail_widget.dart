import 'package:flutter/material.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/screen/bookstore/detail_comic/invite_friend.dart';
import 'package:init_app/screen/tutorials/tutorial_loaded_coin.dart';

class DetailWidget extends StatefulWidget {
  DetailWidget({Key key}) : super(key: key);

  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
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
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "Tac gia",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13, color: Colors.grey[400]),
                      ),
                      Text(
                        "Hoa Hoa",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13, color: Colors.grey[800]),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "Trang thai",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13, color: Colors.grey[400]),
                      ),
                      Text(
                        "Dang cap nhat",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13, color: Colors.grey[800]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Gioi thieu",
                    style: TextStyle(fontSize: 13, color: Colors.grey[400]),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      "Pin của iPhone sử dụng công nghệ lithium-ion. So với các thế hệ công nghệ pin trước đây, pin lithium-ion sạc nhanh hơn, tuổi thọ cao hơn và có mật độ năng lượng lớn hơn giúp tăng thời lượng và giảm trọng lượng. Công nghệ pin sạc lithium-ion hiện nay là công nghệ tốt nhất cho thiết bị của bạn. Tìm hiểu thêm về pin lithium-ion.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13, color: Colors.grey[800]),
                    ),
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
                        "Luot doc",
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
                        "Thich",
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
                        "Da o tu sach",
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
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: Divider())),
                    Text(
                      "Thuong",
                      style: TextStyle(color: Colors.pink),
                    ),
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: Divider())),
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
                      )
                      // child: Row(
                      //   children: <Widget>[
                      //     Container(
                      //       margin: EdgeInsets.all(2),
                      //       child: Image.asset(
                      //        Common.pathImg + "ic_user.png", height: 20,
                      //        width: 20,
                      //       ),
                      //     ),

                      //   ],
                      // ),
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
                              Icon(
                                Icons.ac_unit,
                                color: Colors.yellow,
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
                            _onReward();
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
                                "Thuong",
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InviteFriend()));
              },
              title: Text(
                "Moi ban be se nhan duoc xu",
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TutorialLoadedCoin()));
              },
              title: Text(
                "Lam sao de nap xu",
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
            Container(
              margin: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Binh luan",
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
            Divider(
              height: 1,
              color: Colors.grey[400],
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 30,
              child: Center(
                child: Text(
                  "Xem tat ca binh luan",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            Divider(
              height: 1,
              color: Colors.grey[400],
            ),
            Container(
              height: 60,
              margin: EdgeInsets.only(top: 20, left: 20),
              child: Text(
                "HOT NHAT",
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
