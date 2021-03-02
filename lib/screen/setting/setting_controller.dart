import 'package:get/get.dart';
import 'package:init_app/base/base_controller.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/data/repository.dart';
import 'package:init_app/screen/about_us/about_us_screen.dart';
import 'package:init_app/screen/load/load_controller.dart';
import 'package:init_app/screen/ownership/ownership_screen.dart';
import 'package:init_app/widgets/dialog_language.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../load/load_screen.dart';
class SettingController extends BaseController {

  LoadController ctl = Get.put(LoadController());
  bool autoLock = false;
  String language = "";
  dynamic profile;
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    selectedLanguage();
  }

  void changeLanguage(context) {
    showDialogLanguage(context, (value) {
      RepositoryImpl.getInstance().setLanguage(value);
      Common.language = value;
    selectedLanguage();
    });
    print("object ${Common.language}");
    
  }
  void selectedLanguage(){
switch (Common.language) {
      case "vi":
        language = "Vietnamese";
        update();
        break;
         case "id":
         language = "Bahasa Indonesia";
        update();
        break;
         case "th":
         language = "Thailand";
        update();
        break;
      default:
    }
  }
  void clickItem(key) {
    switch (key) {
      case "AUTO_LOCK":
        autoLock = !autoLock;
        update();
        break;
      case "DELETE_MEMORY":
        break;
      case "OWNERSHIP":
        Get.to(OwnershipScreen());
        break;
      case "ABOUT_US":
        Get.to(AboutUsScreen());
        break;
      default:
    }
  }
  void goSignOut(){
    if(Common.isLogedIn){
      _showMyDialogSignOut();
    }else{
      _showMyDialogSignIn();
    }
  }
  void goLogin() async {
    // var data = await Get.to(LoginScreen());
    // if (data != null) {
    //   profile = data["value"];
    //   Common.isLogedIn = true;
    //   update();
    // }
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => LoadScreen()),
        ModalRoute.withName('/')
    );
  }
  Future<void> _handleSignOut() => _googleSignIn.disconnect();
  Future<void> _showMyDialogSignIn() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.symmetric(vertical: 180),
          title: Text('Messenger'),
          content: Container(
            height: 50.0,
              child: Center(
                child: Text("Truoc tien ban can phai dang nhap", style: TextStyle(color: Colors.black)),)),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  child: Text('Dang nhap ngay'),
                  onPressed: () {
                    goLogin();
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text('Khong'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
  Future<void> _showMyDialogSignOut() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.symmetric(vertical: 180),
          title: Text('Messenger'),
          content: Container(
              child: Center(
                child: Text("Ban co muon dang xuat khong?", style: TextStyle(color: Colors.black)),)),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  child: Text('Co'),
                  onPressed: () {
                    _handleSignOut();
                    RepositoryImpl.getInstance()
                        .setLogedData(type: "")
                        .then((value) {});
                    goLogin();
                  },
                ),
                TextButton(
                  child: Text('Khong'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
