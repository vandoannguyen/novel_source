import 'dart:async';

import 'package:dio/dio.dart';

abstract class IApi {
  // create method call api here
  Future getData();
  Future demoa();
  Future<String> getDb();
}

class ApiImpl implements IApi {
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
}
