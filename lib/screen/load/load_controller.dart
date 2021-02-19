import 'dart:math';

import 'package:init_app/base/base_controller.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/data/network/UserModel.dart';
import 'package:init_app/data/repository.dart';
import 'package:init_app/screen/home/home_screen.dart';
import 'package:init_app/utils/intent_animation.dart';
import 'package:init_app/widgets/dialog_language.dart';

class LoadController extends BaseController {
  bool isCreateEmail = false;

  bool _isLoginSuccess = false;

  bool _isGetCountrySuccess = false;

  void login(context) async {
    String email = await getRandomEmail();
    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    print(email);
    RepositoryImpl.getInstance()
        .login(email: email, timestamep: timestamp)
        .then((value) {
      int code = value["code"];
      if (code == 1) {
        String token = value["result"]["token"];
        Common.token = token;
        Common.user = UserModel.fromJson(value["result"]["user"]);
        _isLoginSuccess = true;
        _getData(context);
      } else {
        showMess("Login Failed", TypeMess.WARNING);
      }
    });
  }

  Future getRandomEmail() async {
    String email = await RepositoryImpl.getInstance().getMail();
    if (email == null) {
      isCreateEmail = true;
      email = "";
      for (int i = 0; i < 12; i++) {
        email += Random().nextInt(9).toString();
      }
      email += "@gmail.com";
      RepositoryImpl.getInstance().setMail(email);
    }
    return email;
  }

  getLaguage(context) {
    RepositoryImpl.getInstance().getLanguage().then((value) {
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
      Common.language = value;
      _isGetCountrySuccess = true;
      _getData(context);
      RepositoryImpl.getInstance().setLanguage(value);
    });
  }

  void getMyBookLib() {
    RepositoryImpl.getInstance().getMyBooks(
        timestamp: DateTime.now().millisecondsSinceEpoch.toString());
  }

  void _getData(context) {
    if (_isLoginSuccess && _isGetCountrySuccess) {
      if (isCreateEmail) {
        RepositoryImpl.getInstance()
            .createMyBooks(
                timestamp: DateTime.now().millisecondsSinceEpoch.toString())
            .then((value) {
          RepositoryImpl.getInstance()
              .getMyBooks(
                  timestamp: DateTime.now().millisecondsSinceEpoch.toString())
              .then((value) {
            print("value2222$value");
            Common.myBooks = value;
            intentToHome(context);
          });
        });
      } else {
        RepositoryImpl.getInstance()
            .getMyBooks(
                timestamp: DateTime.now().millisecondsSinceEpoch.toString())
            .then((value) {
          Common.myBooks = value;
          print(value);
          print("okok");
          intentToHome(context);
          print("okok");
        });
      }
    }
  }

  void intentToHome(context) {
    print("okokok");
    IntentAnimation.intentNomal(
        context: context,
        screen: HomeScreen(),
        option: IntentAnimationOption.RIGHT_TO_LEFT,
        duration: Duration(milliseconds: 500));
  }
}
