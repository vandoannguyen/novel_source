import 'package:get/get.dart';
import 'package:init_app/base/base_controller.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/data/repository.dart';
import 'package:init_app/screen/bookcase/book_case_cotroller.dart';
import 'package:init_app/screen/bookstore/novel_bookstore/novel_book_controller.dart';
import 'package:init_app/screen/buy_coin/buy_coin_screen.dart';
import 'package:init_app/screen/come_author/come_author_screen.dart';
import 'package:init_app/screen/detail_transaction/detail_transaction_screen.dart';
import 'package:init_app/screen/feedback/feedback_screen.dart';
import 'package:init_app/screen/frequently_question/frequently_question_screen.dart';
import 'package:init_app/screen/login/login_screen.dart';
import 'package:init_app/screen/setting/setting_screen.dart';
import 'package:init_app/utils/intent_animation.dart';
import 'package:url_launcher/url_launcher.dart';

class PersonalController extends BaseController {
  dynamic profile;
  bool isLogin = false;
  dynamic callBack;

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
        Get.to(FeedbackScreen());
        break;
      case "SETTING":
        IntentAnimation.intentNomal(
                context: context,
                screen: SettingScreen(),
                option: IntentAnimationOption.RIGHT_TO_LEFT)
            .then((value) {
          if (value != null && value) {
            callBack("CHANGE_LANGUAGE", "");
            NovelBookController controller = null;
            BookCaseController bookCaseController = null;
            try {
              controller = Get.find();
            } catch (err) {
              controller = null;
            }
            try {
              bookCaseController = Get.find();
            } catch (err) {
              bookCaseController = null;
            }
            print("controller != null${controller != null}");
            if (controller != null) {
              controller.reloadData();
            }
            print("controller != null${bookCaseController != null}");
            if (bookCaseController != null) {
              bookCaseController.reloadData();
            }
          }
        }).catchError((err) {});
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
