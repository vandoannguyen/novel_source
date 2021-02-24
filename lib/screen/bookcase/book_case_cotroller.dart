import 'package:init_app/base/base_controller.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/data/network/NovalModel.dart';
import 'package:init_app/data/repository.dart';
import 'package:init_app/screen/login/login_screen.dart';
import 'package:init_app/utils/intent_animation.dart';

class BookCaseController extends BaseController {
  List<NovalModel> myBooks;
  var isLoading = false;

  var isLogedIn = false;

  var isManager = false;

  List<NovalModel> listSelected;

  void getMybook() {
    isLoading = false;
    update();
    // RepositoryImpl.getInstance()
    //     .getMyBooks(
    //         timestamp:
    //             (DateTime.now().millisecondsSinceEpoch / 1000).toString())
    //     .then((value) {
    //   isLoading = false;
    //   update();
    //   myBooks = value;
    //   update();
    //   Common.myBooks = value;
    // }).catchError((err) {});
    myBooks = Common.myBooks;
    update();
  }

  void login() {
    IntentAnimation.intentNomal(context: context, screen: LoginScreen())
        .then((value) {
      if (value != null) {
        Common.isLogedIn = true;
        isLogedIn = Common.isLogedIn;
        getLogedIn();
        for (int i = 0; i < Common.myBooks.length; i++) {
          RepositoryImpl.getInstance()
              .addBookIntoMyBooks(idBook: Common.myBooks[i].id);
        }
      }
    });
  }

  void getLogedIn() {
    isLogedIn = Common.isLogedIn;
    update();
  }

  void manager() {
    if (Common.isLogedIn) {
      listSelected = new List();
      isManager = true;
      update();
    } else {
      IntentAnimation.intentNomal(context: context, screen: LoginScreen())
          .then((value) {
        if (value != null) {
          print("valueloginSuccess $value");
          Common.isLogedIn = true;
          isLogedIn = Common.isLogedIn;
          getLogedIn();
          for (int i = 0; i < Common.myBooks.length; i++) {
            RepositoryImpl.getInstance()
                .addBookIntoMyBooks(idBook: Common.myBooks[i].id);
          }
        }
      });
    }
  }

  void setSelected(NovalModel item, isSeleted) {
    if (isSeleted) {
      // nếu chưa chọn thì cho vào
      if (listSelected
              .where((element) => element.id == item.id)
              .toList()
              .length ==
          0) {
        listSelected.add(item);
      }
    } else {
      if (listSelected
              .where((element) => element.id == item.id)
              .toList()
              .length >
          0) {
        listSelected.remove(item);
      }
    }
  }

  void delete() {
    Common.myBooks = Common.myBooks
        .where((element) =>
            listSelected.where((e) => e.id == element.id).toList().length == 0)
        .toList();
    myBooks = Common.myBooks;
    update();
    print(Common.myBooks.length);
  }

  void cancelDelete() {
    listSelected = null;
    isManager = false;
    update();
  }
}
