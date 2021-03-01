import 'package:init_app/base/base_controller.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/data/network/NovalModel.dart';
import 'package:init_app/data/repository.dart';
import 'package:init_app/screen/login/login_screen.dart';
import 'package:init_app/utils/intent_animation.dart';

class BookCaseController extends BaseController {
  List<NovelModel> myBooks;
  var isLoading = false;

  var isLogedIn = false;

  var isManager = false;

  List<NovelModel> listSelected;

  bool isLogedinSuccess = false;

  void getMybook() {
    if (isLogedinSuccess) {
      isLoading = true;
      update();
      // lấy sách tron tủ sách
      RepositoryImpl.getInstance()
          .getMyBooks(
              timestamp:
                  (DateTime.now().millisecondsSinceEpoch / 1000).toString())
          .then((value) {
        // kiểm tra list rỗng hay k
        if (value.length > 0) {
          // nếu có thì thêm thêm sách mới đã thêm vào tủ sách
          // lọc tất cả sách đã thêm nhưng chưa có trong tài khoản login
          List<NovelModel> list = Common.myBooks
              .where((e) =>
                  value.where((element) => e.id != element.id).toList().length >
                  0)
              .toList();
          if (list.length > 0) {
            Common.myBooks = new List();
            Common.myBooks = value + list;
            myBooks = Common.myBooks;
            list.forEach((element) {
              RepositoryImpl.getInstance()
                  .addBookIntoMyBooks(idBook: element.id);
            });
          }
        } else {
          isLoading = false;
          update();
          Common.myBooks = value;
          update();
          // nếu không có thì thêm thêm sách đã thêm vào tủ sách
          for (int i = 0; i < Common.myBooks.length; i++) {
            RepositoryImpl.getInstance()
                .addBookIntoMyBooks(idBook: Common.myBooks[i].id);
          }
        }
      }).catchError((err) {});
    } else {
      myBooks = Common.myBooks;
      update();
    }
  }

  void login() {
    IntentAnimation.intentNomal(context: context, screen: LoginScreen())
        .then((value) {
      if (value == "ok") {
        //   nếu ok thì kiểm tra xem list sách mới có chưa
        // nếu chưa có thì thêm vào
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
        if (value == "ok") {
          print("valueloginSuccess $value");
          Common.isLogedIn = true;
          isLogedIn = Common.isLogedIn;
          getLogedIn();
          getMybook();
          for (int i = 0; i < Common.myBooks.length; i++) {
            RepositoryImpl.getInstance()
                .addBookIntoMyBooks(idBook: Common.myBooks[i].id);
          }
        }
      });
    }
  }

  void setSelected(NovelModel item, isSeleted) {
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

  void testApi() {
    RepositoryImpl.getInstance().searchAutoComplete("data").then((value) {
      print("search success " + value);
    }).catchError((err) {
      print(err);
    });
  }
}
