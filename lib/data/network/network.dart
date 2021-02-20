import 'dart:async';

import 'package:dio/dio.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/utils/crypt_utils.dart';

import 'NovalModel.dart';

abstract class IApi {
  // create method call api here
  Future getData();

  Future demoa();

  Future<String> getDb();

  Future login({email, timestamep});

  Future<List<NovalModel>> getMyBooks({String timestamp});

  Future createMyBooks({String timestamp, data});

  Future readNoval({id});

  Future chapByNoval({id, limit, page});
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
  Future<List<NovalModel>> getMyBooks({String timestamp}) {
    Completer<List<NovalModel>> completer = Completer();
    String token = CryptUtils.genSha256(
        "${Common.EXTEND_ONEADX_KEY}/racks/me?timestamp=$timestamp");
    Dio()
        .get("$ROOT_API/racks/me?timestamp=$timestamp&oneadx_token=$token",
            options:
                Options(headers: {"Authorization": "Bearer ${Common.token}"}))
        .then((vaule) {
      List<NovalModel> list =
          List<NovalModel>.from(vaule.data["result"].map((element) {
        return NovalModel.fromJson(element);
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
  Future chapByNoval({id, limit, page}) {
    Completer completer = new Completer();
    // TODO: implement chapByNoval
    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    String token = CryptUtils.genSha256(
        "${Common.EXTEND_ONEADX_KEY}/sections/book/$id?page=$page&limit=$limit&sort=createdAt&timestamp=$timestamp");
    print(
        "123456789 $ROOT_API/sections/book/$id?page=$page&limit=$limit&sort=createdAt&timestamp=$timestamp&oneadx_token=$token");
    Dio()
        .get(
            "$ROOT_API/sections/book/$id?page=$page&limit=$limit&sort=createdAt&timestamp=$timestamp&oneadx_token=$token",
            options:
                Options(headers: {"Authorization": "Bearer ${Common.token}"}))
        .then((value) {
      if (value.data["code"] == 1)
        completer.complete(value.data["result"]);
      else
        completer.complete([]);
    });
    // CallNativeUtils.invokeMethod(method: "encrypt", aguments: {
    //   "data":
    //       "/sections/book/6017f25f935d8d2bbeedb8ee?page=1&limit=10&sort=createdAt&timestamp=1612586520"
    // }).then((token) {
    // print(
    //     "$ROOT_API/sections/book/6017f25f935d8d2bbeedb8ee?page=1&limit=10&sort=createdAt&timestamp=1612586520&oneadx_token=$token");
    // print(Common.token);
    // Dio()
    //     .get(
    //         "$ROOT_API/sections/book/6017f25f935d8d2bbeedb8ee?page=1&limit=10&sort=createdAt&timestamp=1612586520&oneadx_token=$token",
    //         options:
    //             Options(headers: {"Authorization": "Bearer ${Common.token}"}))
    //     .then((value) {
    //   print(value.data);
    // });
    // });

    return completer.future;
  }
}
