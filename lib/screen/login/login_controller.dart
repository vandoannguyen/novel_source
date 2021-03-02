import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:init_app/base/base_controller.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/data/repository.dart';
import 'package:init_app/screen/personal/personal_controller.dart';
import 'package:init_app/widgets/dialog_loading.dart';

class LoginController extends BaseController {
  // bool isLogedIn = false;
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  // void setLogin(isLogin){
  //   isLogedIn = isLogin;
  //   print("setLogin ${isLogedIn}");
  //   update();
  // }
  void loginFacebook() async {
    final FacebookLogin facebookLogin = FacebookLogin();
    final result = await facebookLogin.logIn(['email']);
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        print("result.accessToken.token  ${result.accessToken.token}");
        // _sendTokenToServer(result.accessToken.token);
        // _showLoggedInUI();
        showDialogLoading(context);
        RepositoryImpl.getInstance()
            .loginWithFaceBook(access_token: result.accessToken.token)
            .then((value) {
          Common.isLogedIn = true;
        print("loginFacebook ============ ${value}");
          Navigator.of(context).pop();
          Navigator.of(context).pop("ok");
          //  Navigator.of(context).pop({"code": 1, value: value['user']});
          RepositoryImpl.getInstance()
              .setLogedData(type: "facebook")
              .then((value) {});
        }).catchError((err) {
          print(err);
          showMess("Login failed", TypeMess.WARNING);
          Navigator.of(context).pop();
        });
        break;
      case FacebookLoginStatus.cancelledByUser:
        break;
      case FacebookLoginStatus.error:
        showMess("Login failed", TypeMess.WARNING);
        break;
    }
  }

  void loginGoogle() {
    try {
      _googleSignIn.signIn().then((value) async {
        value.authentication.then((token) {
          showDialogLoading(context);
          print("token google1 ${token.accessToken}");
          RepositoryImpl.getInstance()
              .loginWithGoogle(access_token: token.accessToken)
              .then((value) {
            print("object ${value}");
            Common.token = value["token"];
            Common.isLogedIn = true;
   
  //  print("object Common.isLogedIn Common.isLogedIn ${Common.isLogedIn} ${value["user"]}");
            Navigator.of(context).pop();
            Navigator.of(context).pop({"code": 1, "value": value["user"]});
 
            RepositoryImpl.getInstance()
                .setLogedData(type: "google")
                .then((value) {});
          }).catchError((err) {
            Navigator.of(context).pop();
            showMess("Login failed", TypeMess.WARNING);
          });
        });
      });
    } catch (error) {
      print("errorRRRRR$error");
    }
  }
}
