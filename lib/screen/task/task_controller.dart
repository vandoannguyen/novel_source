import 'package:init_app/base/base_controller.dart';

class TaskController extends BaseController {
  bool checkToday = false;
  // ignore: must_call_super
  onInit() {
    print(" object TaskController");
  }

  void checkInToday() {
    checkToday = true;
    update(); // use update() to update counter variable on UI when increment be called
  }

  void funcTask(String key) {
    switch (key) {
      case "ANSWER":
        break;
      case "INVITE":
        break;
      case "COIN_FOR_FRIEND":
        break;
      case "WATCH_ADS":
        break;
      case "READ_BOOK":
        
        break;
      default:
    }
  }
}
