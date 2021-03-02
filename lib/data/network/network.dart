import 'dart:async';

import 'package:dio/dio.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/data/network/BannerNovelModel.dart';
import 'package:init_app/utils/crypt_utils.dart';

import 'NovalChapterModel.dart';
import 'NovalModel.dart';

abstract class IApi {
  // create method call api here
  Future getData();

  Future demoa();

  Future<String> getDb();

  Future login({email, timestamep});

  Future<List<NovelModel>> getMyBooks({String timestamp});

  Future createMyBooks({String timestamp, data});

  Future readNoval({id});

  Future<List<NovalChapterModel>> chapByNoval({id, limit, page});

  Future addBookIntoMyBooks({idBook});

  Future removeBookFromMyBook({idBook});

  Future<List<BannerNovelModel>> getBanner({language});

  Future<List<NovelModel>> getNovelHotest(
      {language, page, limitPerPage, bool increase = true});

  Future<List<NovelModel>> getNovelNewest(
      {language, page, limitPerPage, bool increase = true});

  Future<NovelModel> getNovelDetail({idBook});

  Future postComment({idBook, contentComment});

  Future getComments({idBook, page, limit, bool increase = true});

  Future historyBuy({page, limit, bool increase = true});

  Future loginWithGoogle({access_token});

  Future loginWithFaceBook({access_token});

  Future getUserProfile();

  Future getSubscription({lang});

  Future buySubscription({idSub});

  Future inviteFriend({idUser});

  Future donateForWrite({idBook, coin});

  Future searchAutoComplete(String data);

  Future search(String data);

  Future getChapterBought({bookId});
}

class ApiImpl implements IApi {
  static final String ROOT_API = "https://api.oneadx.com/novel";

  @override
  Future getData() {
    Completer completer = new Completer();
    Dio().get("http://ip-api.com/json").then((response) {
      completer.complete(response.data);
    }).catchError((err) => {completer.completeError(err)});
    return completer.future;
  }

  @override
  Future<String> getDb() {
    // TODO: implement getDb
    throw UnimplementedError();
  }

  @override
  Future demoa() {
    // TODO: implement demoa
    throw UnimplementedError();
  }

  @override
  Future login({email, timestamep}) {
    Completer completer = Completer();
    String token = CryptUtils.genSha256(
        "/auth/anonymous?email=$email&timestamp=$timestamep");
    print("token${token}");
    Dio()
        .post(
            "$ROOT_API/auth/anonymous?email=$email&timestamp=$timestamep&oneadx_token=$token")
        .then((value) {
      print("value.data${value.data}");
      completer.complete(value.data);
    }).catchError((err) {
      completer.completeError(err);
    });
    return completer.future;
  }

  @override
  Future<List<NovelModel>> getMyBooks({String timestamp}) {
    Completer<List<NovelModel>> completer = Completer();
    String token = CryptUtils.genSha256(
        "${Common.EXTEND_ONEADX_KEY}/racks/me?timestamp=$timestamp");
    Dio()
        .get("$ROOT_API/racks/me?timestamp=$timestamp&oneadx_token=$token",
            options:
                Options(headers: {"Authorization": "Bearer ${Common.token}"}))
        .then((vaule) {
      List<NovelModel> list =
          List<NovelModel>.from(vaule.data["result"].map((element) {
        return NovelModel.fromJson(element);
      }).toList());
      completer.complete(list);
    });
    // CallNativeUtils.invokeMethod(
    //     method: "encrypt",
    //     aguments: {"data": "/racks/me?timestamp=$timestamp"}).then((value) {
    //   Dio()
    //       .get("$ROOT_API/racks/me?timestamp=$timestamp&oneadx_token=$value",
    //           options:
    //               Options(headers: {"Authorization": "Bearer ${Common.token}"}))
    //       .then((vaule) {
    //     List<NovalModel> list =
    //         List<NovalModel>.from(vaule.data["result"].map((element) {
    //       return NovalModel.fromJson(element);
    //     }).toList());
    //     completer.complete(list);
    //   });
    // });
    return completer.future;
  }

  @override
  Future createMyBooks({String timestamp, data}) {
    // TODO: implement createMyBooks
    Completer completer = new Completer();
    String token = CryptUtils.genSha256(
        "/racks/init/${Common.language}?timestamp=$timestamp");
    Dio()
        .post(
            "$ROOT_API/racks/init/${Common.language}?timestamp=$timestamp&oneadx_token=$token",
            options:
                Options(headers: {"Authorization": "Bearer ${Common.token}"}))
        .then((value) {
      completer.complete(value);
    });
    return completer.future;
  }

  @override
  Future readNoval({id}) async {
    // TODO: implement readNoval
    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    String token = CryptUtils.genSha256(
        "${Common.EXTEND_ONEADX_KEY}/sections/read/$id?timestamp=$timestamp");
    Completer completer = new Completer();
    Dio()
        .post(
            "$ROOT_API/sections/read/$id?timestamp=$timestamp&oneadx_token=$token",
            options:
                Options(headers: {"Authorization": "Bearer ${Common.token}"}))
        .then((value) {
      completer.complete(value.data);
    }).catchError((err) {
      completer.completeError(err);
    });
    return completer.future;
  }

  @override
  Future<List<NovalChapterModel>> chapByNoval({id, limit, page}) {
    Completer<List<NovalChapterModel>> completer = new Completer();
    // TODO: implement chapByNoval
    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    String token = CryptUtils.genSha256(
        "${Common.EXTEND_ONEADX_KEY}/sections/book/$id?page=$page&limit=$limit&sort=createdAt&timestamp=$timestamp");
    Dio()
        .get(
            "$ROOT_API/sections/book/$id?page=$page&limit=$limit&sort=createdAt&timestamp=$timestamp&oneadx_token=$token",
            options:
                Options(headers: {"Authorization": "Bearer ${Common.token}"}))
        .then((value) {
      if (value.data["code"] == 1) {
        List<NovalChapterModel> list = (value.data["result"] as List)
            .map((e) => NovalChapterModel.fromJson(e))
            .toList();
        completer.complete(list);
      } else
        completer.complete([]);
    });
    return completer.future;
  }

  @override
  Future addBookIntoMyBooks({idBook}) {
    Completer completer = Completer();
    String timeStamp = _getTimeStamp();
    String token = CryptUtils.genSha256(
        "${Common.EXTEND_ONEADX_KEY}/racks/$idBook?timestamp=${timeStamp}");
    Dio()
        .post(
            "$ROOT_API/racks/$idBook?timestamp=${timeStamp}&oneadx_token=$token",
            options:
                Options(headers: {"Authorization": "Bearer ${Common.token}"}))
        .then((value) {
      if (value.data["code"] == 1)
        completer.complete(value.data["result"]);
      else
        throw ("can not add book");
    }).catchError((err) {
      completer.completeError(err);
    });
    return completer.future;
  }

  @override
  Future removeBookFromMyBook({idBook}) {
    // TODO: implement removeBookFromMyBook
    Completer completer = Completer();
    String timeStamp = _getTimeStamp();
    String token = CryptUtils.genSha256(
        "${Common.EXTEND_ONEADX_KEY}/racks/$idBook?timestamp=${timeStamp}");
    Dio()
        .delete(
            "$ROOT_API/racks/$idBook?timestamp=${timeStamp}&oneadx_token=$token",
            options:
                Options(headers: {"Authorization": "Bearer ${Common.token}"}))
        .then((value) {
      print(value);
      if (value.data["code"] == 1)
        completer.complete(value);
      else
        throw ("can not delete book");
    }).catchError((err) {
      completer.completeError(err);
    });
    return completer.future;
  }

  @override
  Future<List<BannerNovelModel>> getBanner({language}) {
    print("language$language");
    Completer<List<BannerNovelModel>> completer = new Completer();
    String timestamp = _getTimeStamp();
    String token = CryptUtils.genSha256(
        "${Common.EXTEND_ONEADX_KEY}/banners?language=$language&timestamp=$timestamp");
    Dio()
        .get(
            "$ROOT_API/banners?language=$language&timestamp=$timestamp&oneadx_token=$token",
            options:
                Options(headers: {"Authorization": "Bearer ${Common.token}"}))
        .then((value) {
      print("data $value");
      if (value.data["code"] == 1)
        return value.data["result"];
      else
        return null;
    }).then((value) {
      if (value != null) {
        List<BannerNovelModel> list =
            (value as List).map((e) => BannerNovelModel.fromJson(e)).toList();
        completer.complete(list);
      } else {
        throw ("null err");
      }
    }).catchError((err) {
      print(err);
      completer.completeError(err);
    });
    return completer.future;
  }

  @override
  Future getComments({idBook, page, limit, bool increase = true}) {
    Completer completer = new Completer();
    String timeStamp = _getTimeStamp();
    String token = CryptUtils.genSha256(
        "${Common.EXTEND_ONEADX_KEY}/comments/book/$idBook?"
        "page=$page"
        "&limit=$limit"
        "&sort=${increase ? "createdAt" : "-createdAt"}"
        "&timestamp=$timeStamp");
    Dio()
        .get(
            "$ROOT_API/comments/book/$idBook?"
            "page=$page"
            "&limit=$limit"
            "&sort=${increase ? "createdAt" : "-createdAt"}"
            "&timestamp=$timeStamp"
            "&oneadx_token=$token",
            options:
                Options(headers: {"Authorization": "Bearer ${Common.token}"}))
        .then((value) {
      if (value.data["code"] == 1)
        return value.data["result"];
      else
        throw ("data null");
    }).then((value) {
      print(value);
      completer.complete(value);
    }).catchError((err) {
      completer.completeError(err);
    });
    return completer.future;
  }

  @override
  Future<NovelModel> getNovelDetail({idBook}) {
    print("getBookDetail1");
    Completer<NovelModel> completer = new Completer();
    String timeStamp = _getTimeStamp();
    String token = CryptUtils.genSha256("${Common.EXTEND_ONEADX_KEY}"
        "/books/$idBook"
        "?timestamp=$timeStamp");
    print("${ROOT_API}"
        "/books/$idBook"
        "?timestamp=$timeStamp"
        "&oneadx_token=$token");
    Dio()
        .get(
            "${ROOT_API}"
            "/books/$idBook"
            "?timestamp=$timeStamp"
            "&oneadx_token=$token",
            options:
                Options(headers: {"Authorization": "Bearer ${Common.token}"}))
        .then((value) {
      if (value.data["code"] == 1)
        return value.data["result"];
      else
        throw ("data null");
    }).then((value) {
      completer.complete(NovelModel.fromJson(value));
    }).catchError((err) {
      print(err);
      completer.completeError(err);
    });
    return completer.future;
  }

  @override
  Future<List<NovelModel>> getNovelHotest(
      {language, page, limitPerPage, bool increase = true}) {
    Completer<List<NovelModel>> completer = new Completer();
    String time = _getTimeStamp();
    String token = CryptUtils.genSha256("${Common.EXTEND_ONEADX_KEY}"
        "/books/language/$language"
        "?page=$page"
        "&limit=$limitPerPage"
        "&sort=${increase ? "-booknum" : "booknum"}"
        "&timestamp=$time");
    Dio()
        .get(
            "${ROOT_API}/books/language/$language"
            "?page=$page"
            "&limit=$limitPerPage"
            "&sort=${increase ? "-booknum" : "booknum"}"
            "&timestamp=$time"
            "&oneadx_token=$token",
            options:
                Options(headers: {"Authorization": "Bearer ${Common.token}"}))
        .then((value) {
      if (value.data["code"] == 1) {
        return value.data["result"];
      } else {
        return null;
      }
    }).then((value) {
      if (value == null)
        throw ("null data");
      else {
        List<NovelModel> list =
            (value as List).map((e) => NovelModel.fromJson(e)).toList();
        completer.complete(list);
      }
    }).catchError((err) {
      completer.completeError((err));
    });
    return completer.future;
  }

  @override
  Future<List<NovelModel>> getNovelNewest(
      {language, page, limitPerPage, bool increase = true}) {
    Completer<List<NovelModel>> completer = new Completer();
    String time = _getTimeStamp();
    String token = CryptUtils.genSha256("${Common.EXTEND_ONEADX_KEY}"
        "/books/language/$language?page=$page&limit=$limitPerPage&sort=${increase ? "createdAt" : "-createdAt"}&timestamp=$time");
    // String token = CryptUtils.genSha256(
    //     "${Common.EXTEND_ONEADX_KEY}/books/language/vi?page=1&limit=20&sort=createdAt&timestamp=$time");
    // Dio().get(
    //     "${ROOT_API}/books/language/vi?page=1&limit=10&sort=createdAt&timestamp=$time&oneadx_token=$token",
    //     options: Options(headers: {"Authorization": "Bearer ${Common.token}"}));
    print(
        "${ROOT_API}/books/language/$language?page=$page&limit=$limitPerPage&sort=${increase ? "createdAt" : "-createdAt"}&timestamp=$time"
        "&oneadx_token=$token");
    // print(Common.token);
    Dio()
        .get(
            "${ROOT_API}/books/language/$language?page=$page&limit=$limitPerPage&sort=${increase ? "createdAt" : "-createdAt"}&timestamp=$time"
            "&oneadx_token=$token",
            options:
                Options(headers: {"Authorization": "Bearer ${Common.token}"}))
        .then((value) {
      if (value.data["code"] == 1) {
        return value.data["result"];
      } else
        return null;
    }).then((value) {
      if (value != null) {
        List<NovelModel> list =
            (value as List).map((e) => NovelModel.fromJson(e)).toList();
        completer.complete(list);
      } else
        throw ("data null");
    }).catchError((err) {
      print(err);
      completer.completeError(("getNovelNewest$err"));
    });
    return completer.future;
  }

  @override
  Future getUserProfile() {
    Completer completer = new Completer();
    String time = _getTimeStamp();
    String token = CryptUtils.genSha256("${Common.EXTEND_ONEADX_KEY}/users/me?"
        "timestamp=$time");
    Dio()
        .get(
            "${ROOT_API}/users/me?"
            "timestamp=$time"
            "&oneadx_token=$token",
            options:
                Options(headers: {"Authorization": "Bearer ${Common.token}"}))
        .then((value) {
      if (value.data["code"] == 1) {
        completer.complete(value.data["result"]);
        print("getUserProfile ${value.data["result"]}");
      } else
        throw ("data null");
    }).catchError((err) {
      completer.completeError(err);
    });
    return completer.future;
  }

  @override
  Future historyBuy({page, limit, bool increase = true}) {
    Completer completer = new Completer();
    String time = _getTimeStamp();
    String token =
        CryptUtils.genSha256("${Common.EXTEND_ONEADX_KEY}/payments/me"
            "?page=$page"
            "&limit=$limit"
            "&sort=${increase ? "createdAt" : "-createdAt"}"
            "&timestamp=$time");
    Dio()
        .get(
            "$ROOT_API/payments/me"
            "?page=$page"
            "&limit=$limit"
            "&sort=${increase ? "createdAt" : "-createdAt"}"
            "&timestamp=$time"
            "&oneadx_token=$token",
            options:
                Options(headers: {"Authorization": "Bearer ${Common.token}"}))
        .then((value) {
      print("object");
      if (value.data["code"] == 1) {
        completer.complete(value);
        print("object ${value.data["result"]}");
      } else
        throw ("data null");
    }).catchError((err) {
      completer.completeError(err);
    });
    return completer.future;
  }

  @override
  Future loginWithFaceBook({access_token}) {
    Completer completer = new Completer();
    String time = _getTimeStamp();
    String token = CryptUtils.genSha256(
        "${Common.EXTEND_ONEADX_KEY}/auth/facebook?timestamp=$time");
    Dio().post("$ROOT_API/auth/facebook?timestamp=$time&oneadx_token=$token",
        data: {"access_token": access_token}).then((value) {
      print(value.data);
      if (value.data["code"] == 1)
        completer.complete(value.data["result"]);
      else
        throw ("err");
    }).catchError((err) {
      completer.completeError(err);
    });
    return completer.future;
  }

  @override
  Future loginWithGoogle({access_token}) {
    Completer completer = new Completer();
    String time = _getTimeStamp();
    String token = CryptUtils.genSha256(
        "${Common.EXTEND_ONEADX_KEY}/auth/google?timestamp=$time");
    Dio().post("$ROOT_API/auth/google?timestamp=$time&oneadx_token=$token",
        data: {"access_token": access_token}).then((value) {
      print(value);
      if (value.data["code"] == 1) {
        completer.complete(value.data["result"]);
      } else {
        completer.completeError("data null");
      }
    }).catchError((err) {
      completer.completeError(err);
    });
    return completer.future;
  }

  @override
  Future postComment({idBook, contentComment}) {
    Completer completer = new Completer();
    String time = _getTimeStamp();
    String token = CryptUtils.genSha256(
        "${Common.EXTEND_ONEADX_KEY}/comments/book/$idBook?timestamp=$time");
    Dio()
        .post(
            "$ROOT_API/comments/book/$idBook?timestamp=$time&oneadx_token=$token",
            data: {"content": contentComment},
            options:
                Options(headers: {"Authorization": "Bearer ${Common.token}"}))
        .then((value) {
      completer.complete(value);
    }).catchError((err) {
      completer.completeError(err);
    });
    return completer.future;
  }

  _getTimeStamp() {
    int time = (DateTime.now().millisecondsSinceEpoch / 1000).round();
    print(time.round());

    return time.toString();
  }

  @override
  Future getSubscription({lang}) {
    // TODO: implement getSubcryption
    Completer completer = new Completer();
    String time = _getTimeStamp();
    String token = CryptUtils.genSha256(
        "${Common.EXTEND_ONEADX_KEY}/subscriptions?language=$lang&timestamp=$time");
    Dio()
        .get(
            "${ROOT_API}/subscriptions?language=$lang&timestamp=$time&oneadx_token=$token",
            options:
                Options(headers: {"Authorization": "Bearer ${Common.token}"}))
        .then((value) {
      if (value.data["code"] == 1)
        completer.complete((value.data["result"]));
      else
        throw ("data null ");
    }).catchError((err) {
      completer.completeError((err));
    });
    return completer.future;
  }

  @override
  Future buySubscription({idSub}) {
    print("id11111111 $idSub");
    // TODO: implement buySubscription
    Completer completer = Completer();
    String time = _getTimeStamp();
    String token = CryptUtils.genSha256(
        "${Common.EXTEND_ONEADX_KEY}/payments/buy/$idSub?timestamp=$time"); //payments/buy/601fb86359ef2609ecacbc08?timestamp=1612586520
    Dio()
        .post(
            "$ROOT_API}/payments/buy/$idSub?timestamp=$time&oneadx_token=$token",
            options:
                Options(headers: {"Authorization": "Bearer ${Common.token}"}))
        .then((value) {
      if (value.data["code"] == 1)
        completer.complete((value.data));
      else
        throw ("data null ");
    }).catchError((err) {
      completer.completeError(err);
    });
    return completer.future;
  }

  @override
  Future inviteFriend({idUser}) {
    // TODO: implement inviteFriend
    Completer completer = new Completer();
    String time = _getTimeStamp();
    String token = CryptUtils.genSha256(
        "${Common.EXTEND_ONEADX_KEY}/introduces/$idUser?timestamp=$time");
    Dio()
        .post(
            "$ROOT_API/introduces/605C0B?timestamp=1612586520&oneadx_token=$token",
            options:
                Options(headers: {"Authorization": "Bearer ${Common.token}"}))
        .then((value) {
      if (value.data["code"] == 1)
        completer.complete((value.data));
      else
        throw ("data null ");
    }).catchError((err) {
      completer.completeError((err));
    });
    return completer.future;
  }

  @override
  Future donateForWrite({idBook, coin}) {
    Completer completer = new Completer();
    String time = _getTimeStamp();
    String token = CryptUtils.genSha256(
        "${Common.EXTEND_ONEADX_KEY}/books/donate/$idBook?coin=$coin&timestamp=$time");
    Dio()
        .post(
            "$ROOT_API/books/donate/$idBook?coin=$coin&timestamp=$time&oneadx_token=$token",
            options:
                Options(headers: {"Authorization": "Bearer ${Common.token}"}))
        .then((value) {
      if (value.data["code"] == 1)
        completer.complete(value.data);
      else
        throw ("data null");
    }).catchError((err) {
      completer.completeError((err));
    });
    return completer.future;
  }

  @override
  Future search(String data) {
    // TODO: implement search
    data = data.replaceAll(" ", "%20");
    Completer completer = new Completer();
    String time = _getTimeStamp();
    String token = CryptUtils.genSha256(
        "${Common.EXTEND_ONEADX_KEY}/books/complete/search?q=$data&timestamp=$time");
    Dio()
        .get(
            "${ROOT_API}/books/complete/search?q=$data&timestamp=$time&oneadx_token=$token",
            options:
                Options(headers: {"Authorization": "Bearer ${Common.token}"}))
        .then((value) {
      if (value.data["code"] == 1) {
        completer.complete(value.data["result"]);
      } else
        throw ("data null");
    }).catchError((err) {
      completer.completeError(err);
    });
    return completer.future;
  }

  @override
  Future searchAutoComplete(String data) {
    Completer completer = new Completer();
    String time = _getTimeStamp();
    String token = CryptUtils.genSha256(
        "${Common.EXTEND_ONEADX_KEY}/books/composer/autocomplete?q=$data&timestamp=$time");
    Dio()
        .get(
            "${ROOT_API}/books/composer/autocomplete?q=$data&timestamp=$time&oneadx_token=$token",
            options:
                Options(headers: {"Authorization": "Bearer ${Common.token}"}))
        .then((value) {
      if (value.data["code"] == 1)
        completer.complete(value.data["result"]);
      else
        throw ("data null");
    }).catchError((err) {
      completer.completeError(err);
    });
    return completer.future;
  }

  @override
  Future getChapterBought({bookId}) {
    Completer completer = new Completer();
    String time = _getTimeStamp();
    String token = CryptUtils.genSha256(
        "${Common.EXTEND_ONEADX_KEY}/sections/purchased/$bookId?timestamp=$time");
    Dio()
        .get(
            "$ROOT_API/sections/purchased/$bookId?timestamp=$time&oneadx_token=$token",
            options:
                Options(headers: {"Authorization": "Bearer ${Common.token}"}))
        .then((value) {
      if (value.data["code"] == 1) {
        print("getSearchComplete $value");
        completer.complete(value.data["result"]);
      } else
        throw ("data null");
    }).catchError((err) {
      completer.completeError(err);
    });
    return completer.future;
  }
}
