
import 'package:get/get.dart';
import 'package:init_app/base/base_controller.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/data/repository.dart';
import 'package:init_app/screen/buy_coin/buy_coin_screen.dart';
import 'package:init_app/screen/come_author/come_author_screen.dart';
import 'package:init_app/screen/detail_transaction/detail_transaction_screen.dart';
import 'package:init_app/screen/feedback/feedback_screen.dart';
import 'package:init_app/screen/frequently_question/frequently_question_screen.dart';
import 'package:init_app/screen/login/login_screen.dart';
import 'package:init_app/screen/setting/setting_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class PersonalController extends BaseController {
  dynamic profile;
  bool isLogin = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProfile();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void click(key) {
    switch (key) {
      case "BUY_COIN":
        Get.to(BuyCoinScreen());
        break;
      case "DETAIL_TRANSACTION":
        Get.to(DetailTransactionScreen());
        // goDetailTransaction();
        break;
      case "SUPPORT":
        _launchInBrowser(Common.fanpageLink);
        break;
      case "COME_AUTHOR":
        Get.to(ComeAuthorScreen());
        break;
      case "QUESTION":
        Get.to(FrequentlyQuestionScreen());
        break;
      case "FEEDBACK":
        goFeedback();
        break;
      case "SETTING":
        Get.to(SettingScreen());
        break;
      default:
    }
  }

  void goFrequentlyQuestion(callBack) async {
    var data = await Get.to(FrequentlyQuestionScreen());
    print("======================== ${data}");
    if (data == 1) {
      callBack;
    }
  }
  void goDetailTransaction() async{
    if (isLogin) {
      Get.to(DetailTransactionScreen());
      update();
    } else {
      goLogin();
    }
  }
  void goFeedback(){
    if (isLogin) {
      Get.to(FeedbackScreen());
      update();
    } else {
      goLogin();
    }
  }
  void goBuyCoin() async {
    if (isLogin) {
      await Get.to(BuyCoinScreen());
      profile["coin"] = Common.coin;
      update();
    } else {
      goLogin();
    }
  }

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        enableJavaScript: true,
        enableDomStorage: true,
        //  headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  void goLogin() async {
    var data = await Get.to(LoginScreen());
    if (data != null) {
      profile = data["value"];
      isLogin = Common.isLogedIn;
      update();
    }
  }

  void getProfile() {
    RepositoryImpl.getInstance().getUserProfile().then((value) {
      profile = value;
      Common.coin = profile["coin"];
      isLogin = Common.isLogedIn;
      Common.coin = profile["coin"];
      update();
    }).catchError((err) {
      profile = null;
      update();
    });
  }

}
