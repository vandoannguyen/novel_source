import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:init_app/base/base_controller.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/data/network/UserModel.dart';
import 'package:init_app/data/repository.dart';
import 'package:init_app/screen/home/home_screen.dart';
import 'package:init_app/utils/call_native_utils.dart';
import 'package:init_app/utils/intent_animation.dart';
import 'package:init_app/widgets/dialog_language.dart';

class LoadController extends BaseController {
  bool isCreateEmail = false;

  bool _isLoginSuccess = false;

  bool _isGetCountrySuccess = false;

  bool isUserProfile = false;

  bool _isGetDataSuccess = false;

  bool isGetReadNovelSuccess = false;

  bool isGetInappSuccess = false;

  LoadController();

  void login(context) async {
    String logedType = await RepositoryImpl.getInstance().getLogedData();
    Common.logedType = logedType;
    print("logedType   $logedType");
    if (logedType == null) {
      print("logedType   $logedType");

      String email = await getRandomEmail();
      String timestamp =
          (DateTime.now().millisecondsSinceEpoch / 1000).round().toString();
      // login
      RepositoryImpl.getInstance()
          .login(email: email, timestamep: timestamp)
          .then((value) {
        int code = value["code"];
        if (code == 1) {
          String token = value["result"]["token"];
          Common.token = token;
          Common.user = UserModel.fromJson(value["result"]["user"]);

          _isLoginSuccess = true;
          _getAccDetail();
          _getData(context);
        } else {
          showMess("Login Failed", TypeMess.WARNING);
        }
      });
    } else {
      print("logedType!= null $logedType");
      if (logedType == "google") {
        loginGoogle();
      }
      if (logedType == "facebook") loginFacebook();
    }
  }

  Future getRandomEmail() async {
    String email = await RepositoryImpl.getInstance().getMail().then((email) {
      print("emailsharepref $email");
      // kiểm tra xem mail tạo chưa
      if (email == null) {
        isCreateEmail = true;
        email = "";
        for (int i = 0; i < 12; i++) {
          email += Random().nextInt(9).toString();
        }
        email += "@gmail.com";
        RepositoryImpl.getInstance().setMail(email);
      }
      print("email1$email");
      return email;
    });
    print("email2$email");
    return email;
  }

  getLaguage(context) {
    RepositoryImpl.getInstance().getLanguage().then((value) {
      print("valuelanguage$value");
      if (value != null) {
        Common.language = value;
        _isGetCountrySuccess = true;
        _getData(context);
      } else
        showDialogLang(context);
    });
  }

  void showDialogLang(context) {
    showDialogLanguage(context, (value) {
      RepositoryImpl.getInstance().setLanguage(value);
      Common.language = value;
      _isGetCountrySuccess = true;
      _getData(context);
    });
  }

  void getMyBookLib() {
    RepositoryImpl.getInstance().getMyBooks(
        timestamp: (DateTime.now().millisecondsSinceEpoch / 1000).toString());
  }

  void _getData(context) {
    if (_isLoginSuccess && _isGetCountrySuccess && isGetReadNovelSuccess) {
      if (isCreateEmail) {
        RepositoryImpl.getInstance()
            .createMyBooks(
                timestamp:
                    (DateTime.now().millisecondsSinceEpoch / 1000).toString())
            .then((value) {
          RepositoryImpl.getInstance()
              .getMyBooks(
                  timestamp:
                      (DateTime.now().millisecondsSinceEpoch / 1000).toString())
              .then((value) {
            Common.myBooks = value;
            _isGetDataSuccess = true;
            intentToHome(context);
          }).catchError((err) {
            print("Get my book failed");
            showMess("Load data null", TypeMess.WARNING);
          });
        }).catchError((err) {
          print("Create my book failed");
          showMess("Load data null", TypeMess.WARNING);
        });
      } else {
        RepositoryImpl.getInstance()
            .getMyBooks(
                timestamp:
                    (DateTime.now().millisecondsSinceEpoch / 1000).toString())
            .then((value) {
          Common.myBooks = value;
          _isGetDataSuccess = true;
          intentToHome(context);
        }).catchError((err) {
          print(("error$err"));
        });
      }
      getInapp();
    }
  }

  void intentToHome(context) {
    if (_isGetDataSuccess && _isGetCountrySuccess && isGetInappSuccess)
      IntentAnimation.intentPushReplacement(
          context: context,
          screen: HomeScreen(),
          option: IntentAnimationOption.RIGHT_TO_LEFT,
          duration: Duration(milliseconds: 500));
  }

  void loginGoogle() {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    _googleSignIn.signIn().then((value) async {
      value.authentication.then((token) {
        RepositoryImpl.getInstance()
            .loginWithGoogle(access_token: token.accessToken)
            .then((value) {
          Common.token = value["token"];
          Common.user = UserModel.fromJson(value["user"]);
          Common.isLogedIn = true;
          RepositoryImpl.getInstance()
              .setLogedData(type: "google")
              .then((value) {});
          _isLoginSuccess = true;
          _getAccDetail();
          _getData(context);
        }).catchError((err) {
          Navigator.of(context).pop();
          showMess("Login failed", TypeMess.WARNING);
        });
      });
    });
  }

  Future<void> loginFacebook() async {
    final FacebookLogin facebookLogin = FacebookLogin();
    final result = await facebookLogin.logIn(['email']);
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        RepositoryImpl.getInstance()
            .loginWithFaceBook(access_token: result.accessToken.token)
            .then((value) {
          Common.token = value["token"];
          Common.user = UserModel.fromJson(value["user"]);
          Common.isLogedIn = true;
          RepositoryImpl.getInstance().setLogedData(type: "facebook");
          _isLoginSuccess = true;
          _getAccDetail();
          _getData(context);
        }).catchError((err) {
          print("error$err");
          showMess("Login failed", TypeMess.WARNING);
          Navigator.of(context).pop();
        });
        break;
      case FacebookLoginStatus.cancelledByUser:
        break;
      case FacebookLoginStatus.error:
        {
          showMess("Login failed", TypeMess.WARNING);
          print("login failed");
        }
        break;
    }
  }

  void _getAccDetail() {
    isUserProfile = false;
    RepositoryImpl.getInstance().getUserProfile().then((value) {
      isUserProfile = true;
      Common.coin = value["coin"];
      Common.user = UserModel.fromJson(value);
    }).catchError((err) {
      showMess("Load data null", TypeMess.WARNING);
    });
  }

  void getReadChapter() {
    RepositoryImpl.getInstance().getReadNovel().then((value) {
      if (value != "") {
        Common.listReadChapter = jsonDecode(value);
      } else
        Common.listReadChapter = [];
      isGetReadNovelSuccess = true;
      _getData(context);
    }).catchError((err) {
      Common.listReadChapter = [];
      isGetReadNovelSuccess = true;
      _getData(context);
    });
  }

  void getInapp() {
    RepositoryImpl.getInstance()
        .getSubscription(lang: Common.language)
        .then((value) {
      Common.listInapp = value;
      var list = (Common.listInapp as List)
          .map((element) => element["google_inapp_id"])
          .toList();
      print("listinapp $list");
      CallNativeUtils.invokeMethod(
          method: "initInapp",
          aguments: {"data": jsonEncode(list)}).then((value) {
        value = jsonDecode(value);
        Common.listInapp = Common.listInapp
            .where((e) =>
                (value as List)
                    .where((element) => element == e["google_inapp_id"])
                    .toList()
                    .length >
                0)
            .toList();
        print("Common.listInapp    ${Common.listInapp}");
        isGetInappSuccess = true;
        intentToHome(context);
      }).catchError((err) {
        print(err);
        print("notokok");
      });
    }).catchError((err) {
      print(err);
    });
  }
}
