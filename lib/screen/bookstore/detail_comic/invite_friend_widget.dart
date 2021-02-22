import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:init_app/common/common.dart';

class InviteFriendWidget extends StatefulWidget {
  InviteFriendWidget({Key key}) : super(key: key);

  @override
  _InviteFriendWidgetState createState() => _InviteFriendWidgetState();
}

class _InviteFriendWidgetState extends State<InviteFriendWidget> {

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }
  //copylink
  void _copyLink(String text){
    Clipboard.setData(new ClipboardData(text: text)).then((_){
      Scaffold.of(context).showSnackBar(
          SnackBar(content:Text("Link copied to clipboard")));
    });
  }
  //shareface
  // void shareOnFacebook() async {
  //   String result = await FlutterSocialContentShare.share(
  //       type: ShareType.facebookWithoutImage,
  //       url: "https://www.apple.com",
  //       quote: "captions");
  //   print(result);
  // }
  //sharewhats
  // void shareWhatsapp() async {
  //   String result = await FlutterSocialContentShare.shareOnWhatsapp(
  //       number: "xxxxxx", text: "Text appears here");
  //   print(result);
  // }
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
                "Share for friend",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Text(
                "Moi ban be nhan xu thuong",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 11, color: Colors.grey[800]),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 10, left: 15, right: 15),
              height: 100,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          child: Image.asset(
                            Common.pathImg + "facebook.png",
                            height: 60,
                            width: 60,
                          ),
                        ),
                      ),
                      Text(
                        "facebook",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Image.asset(
                        Common.pathImg + "whatsapp.png",
                        height: 60,
                        width: 60,
                      ),
                      Text(
                        "whatsapp",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Image.asset(
                        Common.pathImg + "line.png",
                        height: 60,
                        width: 60,
                      ),
                      Text(
                        "line",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Image.asset(
                        Common.pathImg + "copy.png",
                        height: 60,
                        width: 60,
                      ),
                      Text(
                        "copy link",
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
                    "1. Moi 1 ban thuong 10 xu",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    "2. Moi lan ban be nap xu se duoc huong 10% xu ma ban be nap.",
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Remind",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    "1. Mot so dien thoai chi co the moi mot lan",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    "2. Ban be cua ban dang nhap thanh cong moi duoc nhan thuong xu.",
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
