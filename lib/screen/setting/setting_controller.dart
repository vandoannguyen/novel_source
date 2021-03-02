import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:init_app/base/base_controller.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/data/repository.dart';
import 'package:init_app/screen/about_us/about_us_screen.dart';
import 'package:init_app/screen/load/load_controller.dart';
import 'package:init_app/screen/load/load_screen.dart';
import 'package:init_app/screen/login/login_screen.dart';
import 'package:init_app/screen/ownership/ownership_screen.dart';
import 'package:init_app/widgets/dialog_language.dart';

class SettingController extends BaseController {
  LoadController ctl = Get.put(LoadController());
  bool autoLock = false;
  String language = "";
  bool isChangedLanguage = false;
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
      Common.language = value;
      RepositoryImpl.getInstance()
          .setLanguage(value)
          .then((value) {})
          .catchError((err) {});
      RepositoryImpl.getInstance().createMyBooks(
          timestamp:
              (DateTime.now().microsecondsSinceEpoch / 1000).round().toString(),
          data: Common.language);
      selectedLanguage();
      isChangedLanguage = true;
      update();
    });
  }

  void selectedLanguage() {
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

  void goSignOut() async {
    String logedType = await RepositoryImpl.getInstance().getLogedData();

    if (logedType != null) {
      _showMyDialogSignOut();
    } else {
      _showMyDialogSignIn();
    }
  }

  void goLoading() async {
    // var data = await Get.to(LoginScreen());
    // if (data != null) {
    //   profile = data["value"];
    //   Common.isLogedIn = true;
    //   update();
    // }
    // Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(builder: (BuildContext context) => LoadScreen()),
    //     ModalRoute.withName('/'));
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoadScreen()),
        (Route<dynamic> route) => false);
  }

  Future<void> _handleSignOut() async {
    String logedType = await RepositoryImpl.getInstance().getLogedData();
    if (logedType != null) {
      if (logedType == "google") {
        await _googleSignIn.disconnect();
      }
      if (logedType == "facebook") {
        final FacebookLogin facebookLogin = FacebookLogin();
        if (await facebookLogin.isLoggedIn) {
          await facebookLogin.logOut();
        }
      }
    }
  }

  Future<void> _showMyDialogSignIn() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Messenger'),
          content: Container(
            child: Text("Truoc tien ban can phai dang nhap",
                style: TextStyle(color: Colors.black)),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  child: Text('Dang nhap ngay'),
                  onPressed: () {
                    Navigator.pop(context);
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

  Future<void> _showMyDialogSignOut() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Messenger'),
          content: Container(
            child: Text("Ban co muon dang xuat khong?",
                style: TextStyle(color: Colors.black)),
          ),
          actions: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  child: Text('Co'),
                  onPressed: () async {
                    await _handleSignOut();
                    Common.isLogedIn = false;
                    RepositoryImpl.getInstance()
                        .setLogedData(type: "")
                        .then((value) {
                      Navigator.pop(context);
                      goLoading();
                    }).catchError((err) {
                      print(err);
                      print(err);
                    });
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

  Future<void> goLogin() async {
    var data = await Get.to(LoginScreen());
    if (data != null) {
      profile = data["value"];
      Common.isLogedIn = true;
      update();
    }
  }
}
