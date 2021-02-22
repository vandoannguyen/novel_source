import 'package:init_app/base/base_controller.dart';

class FreeBookstoreController extends BaseController {
  bool checkToday = false;

  FreeBookstoreController();
  // ignore: must_call_super
  onInit() {
    print(" object TaskController");
  }

  void checkInToday() {
    checkToday = true;
    update(); // use update() to update counter variable on UI when increment be called
  }
}
