import 'package:flutter/material.dart';

class InviteFriendWidget extends StatefulWidget {
  InviteFriendWidget({Key key}) : super(key: key);

  @override
  _InviteFriendWidgetState createState() => _InviteFriendWidgetState();
}

class _InviteFriendWidgetState extends State<InviteFriendWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                "Chia se cho ban be",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                "Moi ban be nhan xu thuong",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 11, color: Colors.grey[800]),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 100,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(Icons.ac_unit),
                      Text(
                        "facebook",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.ac_unit),
                      Text(
                        "whatsapp",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.ac_unit),
                      Text(
                        "line",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.content_copy),
                      Text(
                        "copy Link",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              color: Colors.grey,
            ),
            Container(
              margin: EdgeInsets.only(top: 30, left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Moi ban be nhan xu thuong",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    "1.Moi 1 ban thuong 10 xu",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    "2.Moi lan ban be nap xu se duoc huong 10% xu ma ban be nap.",
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Nhac nho",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    "1.Mot so dien thoai chi co the moi mot lan",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    "2.Ban be cua ban dang nhap thanh cong moi duoc nhan thuong xu.",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
