import 'package:init_app/base/base_controller.dart';
import 'package:init_app/common/common.dart';

class PrivacyPolicyController extends BaseController {
  String url = "https://sites.google.com/view/privacy-policy-book-en/home";
  // int position = 1 ;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // changePolicy();
  }
  //  doneLoading(String A) {
  //     position = 0;
  //     update();
  // }

  // startLoading(String A){
  //     position = 1;
  //   update();
  // }
  void changePolicy() {
    print("changePolicy");
    print("Common.langNow${Common.langNow}");
    switch (Common.langNow) {
      case "en":
        url = "https://sites.google.com/view/privacy-policy-book-en/home";
        break;
      case "vi":
        url = "https://sites.google.com/view/privacy-policy-book-vi/home";
        break;
      case "th":
        url = "https://sites.google.com/view/privacy-policy-book-th/home";
        break;
      case "id":
        url = "https://sites.google.com/view/rahasia-pribadi/home";
        break;
      default:
        break;
    }
    update();
  }
}
