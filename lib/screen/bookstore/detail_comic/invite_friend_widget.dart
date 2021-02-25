import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:init_app/common/common.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:social_share_plugin/social_share_plugin.dart';

class InviteFriendWidget extends StatefulWidget {
  InviteFriendWidget({Key key}) : super(key: key);

  @override
  _InviteFriendWidgetState createState() => _InviteFriendWidgetState();
}

class _InviteFriendWidgetState extends State<InviteFriendWidget> {
  @override
  void setState(fn) async{
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
  Future<void> _shareOnFacebook(String text) async {
    List<AppInfo> apps = await InstalledApps.getInstalledApps(true, true);
    for(int i=0; i < apps.length; i++){
      if(apps.elementAt(i).packageName == "com.facebook.katana"){
        Fluttertoast.showToast(msg: "Facebook App Installed", backgroundColor: Colors.grey, textColor: Colors.white, gravity: ToastGravity.BOTTOM, toastLength: Toast.LENGTH_SHORT);
        final quote =
            'Flutter is Google’s portable UI toolkit for building beautiful, natively-compiled applications for mobile, web, and desktop from a single codebase.';
        final result = await SocialSharePlugin.shareToFeedFacebookLink(
          quote: quote,
          url: text,
          onSuccess: (postId) {
            print('FACEBOOK SUCCESS $postId');
            return;
          },
          onCancel: () {
            print('FACEBOOK CANCELLED');
            return;
          },
          onError: (error) {
            print('FACEBOOK ERROR $error');
            return;
          },
        );
        break;
      }else{
        Fluttertoast.showToast(msg: "App not install ", backgroundColor: Colors.grey[200], textColor: Colors.red, gravity: ToastGravity.BOTTOM, toastLength: Toast.LENGTH_SHORT);
        break;
      }
    }

    // String result = await FlutterSocialContentShare.share(
    //     type: ShareType.facebookWithoutImage,
    //     url: "https://www.apple.com",
    //     quote: "captions");
    // print(result);
  }
  //sharetwitter
  void _shareTwitter(String text) async {
    List<AppInfo> apps = await InstalledApps.getInstalledApps(true, true);
    for(int i=0; i < apps.length; i++){
      if(apps.elementAt(i).packageName == "com.twitter.android"){
        Fluttertoast.showToast(msg: "Twitter App Installed", backgroundColor: Colors.grey, textColor: Colors.white, gravity: ToastGravity.BOTTOM, toastLength: Toast.LENGTH_SHORT);
        final quote =
            'Flutter is Google’s portable UI toolkit for building beautiful, natively-compiled applications for mobile, web, and desktop from a single codebase.';
        final result = await SocialSharePlugin.shareToTwitterLink(
          text: quote,
          url: text,
          onSuccess: (postId) {
            print('TWITTER SUCCESS $postId');
            return;
          },
          onCancel: () {
            print('TWITTER CANCELLED');
            return;
          },
        );
        break;
      }else{
        Fluttertoast.showToast(msg: "App not install ", backgroundColor: Colors.grey[200], textColor: Colors.red, gravity: ToastGravity.BOTTOM, toastLength: Toast.LENGTH_SHORT);
        break;
      }
    }

    // String result = await FlutterSocialContentShare.shareOnWhatsapp(
    //     number: "xxxxxx", text: "Text appears here");
    // print(result);
  }
  //sharemore
  Future<void> _shareMore(String text) async {
        await FlutterShare.share(
            title: 'Share more app',
            text: 'Example share text',
            linkUrl: text,
            chooserTitle: 'Choose app share link'
        );
  }
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
                        onTap: (){
                          _shareOnFacebook("https");
                        },
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
                      GestureDetector(
                        onTap: (){
                          _shareTwitter("https");
                        },
                        child: Container(
                          child: Image.asset(
                            Common.pathImg + "twitter.png",
                            height: 60,
                            width: 60,
                          ),
                        ),
                      ),
                      Text(
                        "twitter",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                            _shareMore("https");
                        },
                        child: Container(
                          child: Image.asset(
                            Common.pathImg + "more.png",
                            height: 60,
                            width: 60,
                          ),
                        ),
                      ),
                      Text(
                        "more",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                        },
                        child: Container(
                          child: Image.asset(
                            Common.pathImg + "copy.png",
                            height: 60,
                            width: 60,
                          ),
                        ),
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
