import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:init_app/app_localizations.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/data/repository.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:social_share_plugin/social_share_plugin.dart';

class InviteFriendWidget extends StatefulWidget {
  InviteFriendWidget({Key key}) : super(key: key);

  @override
  _InviteFriendWidgetState createState() => _InviteFriendWidgetState();
}

class _InviteFriendWidgetState extends State<InviteFriendWidget> {
  // List<AppInfo> apps = [];
  String idInvite = "";
  @override
  void setState(fn) async{
    // TODO: implement setState
    super.setState(fn);

  }
  //get id invite
  void getInviteFriend(String idUser){
    RepositoryImpl.getInstance().inviteFriend(idUser: idUser).then((value) {
      print("getInviteFriend $value");
      idInvite = value;
    }).catchError((err){});
  }
  //copy link
  void _copyLink(String text){
    Clipboard.setData(new ClipboardData(text: text)).then((_){
      Scaffold.of(context).showSnackBar(
          SnackBar(content:Text("Link copied to clipboard")));
    });
  }
  //get lis app installed
  void _getList() async{
     Common.apps = await InstalledApps.getInstalledApps(true, true);
  }
  //share face
  Future<void> _shareOnFacebook(String text) async {
    //List<AppInfo> apps = await InstalledApps.getInstalledApps(true, true);
    for(int i=0; i < Common.apps.length; i++){
      if(Common.apps.elementAt(i).packageName == "com.facebook.katana"){
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
        print(result);
        break;
      }else{
        Fluttertoast.showToast(msg: "App not install ", backgroundColor: Colors.grey[200], textColor: Colors.red, gravity: ToastGravity.BOTTOM, toastLength: Toast.LENGTH_SHORT);
        break;
      }
    }
  }
  //share twitter
  void _shareTwitter(String text) async {
    // List<AppInfo> apps = await InstalledApps.getInstalledApps(true, true);
    for(int i=0; i < Common.apps.length; i++){
      if(Common.apps.elementAt(i).packageName == "com.twitter.android"){
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
  }
  //share more
  Future<void> _shareMore(String text) async {
        await FlutterShare.share(
            title: Common.appName,
            text: Common.url,
            linkUrl: text,
            chooserTitle: 'Choose app share'
        );
  }
  @override
  Widget build(BuildContext context) {
    if(Common.apps.isEmpty){
    _getList();
    }
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                AppLocalizations.of(context).translate("Share for friend"),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Text(
                "${AppLocalizations.of(context).translate("Invite friends to receive bonus coins")}",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12.0, color: Colors.grey[800]),
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
                          _shareOnFacebook(idInvite);
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
                        "Facebook",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                          _shareTwitter(idInvite);
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
                        "Twitter",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                            _shareMore(idInvite);
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
                        "More",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                          _copyLink(idInvite);
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
                        "Copy Link",
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
                  Container(
                    margin: EdgeInsets.only(bottom: 10.0),
                    child: Text(
                       "${AppLocalizations.of(context).translate("Invite friends to receive bonus coins detail")}",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  // Text(
                  //   "1. Moi 1 ban thuong 10 xu",
                  //   style: TextStyle(color: Colors.black),
                  // ),
                  // Text(
                  //   "2. Moi lan ban be nap xu se duoc huong 10% xu ma ban be nap.",
                  //   style: TextStyle(color: Colors.black),
                  // ),
                  // SizedBox(
                  //   height: 30,
                  // ),
                  // Container(
                  //   margin: EdgeInsets.only(bottom: 10.0),
                  //   child: Text(
                  //     "Remind",
                  //     style: TextStyle(color: Colors.black),
                  //   ),
                  // ),
                  // Text(
                  //   "1. Mot so dien thoai chi co the moi mot lan",
                  //   style: TextStyle(color: Colors.black),
                  // ),
                  // Text(
                  //   "2. Ban be cua ban dang nhap thanh cong moi duoc nhan thuong xu.",
                  //   style: TextStyle(color: Colors.black),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
