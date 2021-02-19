import 'package:init_app/base/base_controller.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/data/repository.dart';
import 'package:init_app/utils/crypt_utils.dart';

class ReadNovalController extends BaseController {
  String read = "";

  String chap = "";
  dynamic chaps = [];

  void readNoval(id) {
    RepositoryImpl.getInstance()
        .chapByNoval(id: id, page: 1, limit: 20)
        .then((value) {
      chaps = value;
      changePage(chaps[0]["id"]);
    });
  }

  void changePage(id) {
    print(id);
    read = null;
    RepositoryImpl.getInstance().readNoval(id: id).then((value) {
      String data = CryptUtils.decryptAESCryptoJS(
          value["result"]["content_text"], Common.ONEADX_KEY);
      print(value["result"]);
      chap = value["result"]["title"];
      update();
      read = CryptUtils.decodeBase4(data);
      update();
    });
  }
}
