import 'dart:async';

import 'package:init_app/utils/call_native_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ISharePref {
  Future getSharePref();

  Future<String> getLanguage();

  Future<void> setLanguage(language);

  Future<String> getMail();

  Future<void> setMail(email);

  Future<void> setLogedData({type});

  Future<String> getLogedData();

  Future<void> setCheckin(day);

  Future<String> getCheckin();

  Future<void> setDatetime(date);

  Future<String> getDatetime();

  Future getReadNovel();

  Future setReadNovel(String data);
}

class SharePrefImpl extends ISharePref {
  final String _LANGUAGE = "language";
  final String _CHECKIN = "checkin";
  final String _DATETIME = "datetime";
  final String _EMAIL = "email";

  final _SET_DATA_SHAREPREF = "setDataShare";
  final _GET_DATA_SHAREPREF = "getDataShare";

  final LOGIN_TYPE = "LOGIN_TYPE";

  final String READ_NOVEL = "READ_NOVEL";

  SharePrefImpl() {
    SharedPreferences.setMockInitialValues({});
  }

  @override
  Future getSharePref() {
    Completer completer = new Completer();
    SharedPreferences.getInstance().then((pref) {
      return pref.getString("demo");
    }).then((value) {
      if (value != null) {
        completer.complete(value);
      } else {
        completer.complete("null");
      }
    });
    return completer.future;
  }

  Future<String> getLanguage() {
    Completer<String> completer = new Completer();
    CallNativeUtils.invokeMethod(
        method: _GET_DATA_SHAREPREF,
        aguments: {"key": _LANGUAGE}).then((value) {
      completer.complete(value == "" ? null : value);
    });
    // SharedPreferences.getInstance().then((pref) {
    //   completer.complete(pref.getString(_LANGUAGE));
    // });
    return completer.future;
  }

  Future<void> setLanguage(language) {
    Completer<String> completer = new Completer();
    CallNativeUtils.invokeMethod(
        method: _SET_DATA_SHAREPREF,
        aguments: {"key": _LANGUAGE, "data": language}).then((value) {
      completer.complete();
    });
    // SharedPreferences.getInstance().then((pref) {
    //   pref.setString(_LANGUAGE, language).then((value) {
    //     completer.complete();
    //   });
    // }).then((value) {});
    return completer.future;
  }

  @override
  Future<String> getMail() {
    // TODO: implement getMail
    Completer<String> completer = new Completer();
    CallNativeUtils.invokeMethod(
        method: _GET_DATA_SHAREPREF, aguments: {"key": _EMAIL}).then((value) {
      completer.complete(value == "" ? null : value);
    });
    // SharedPreferences.getInstance().then((pref) {
    //   completer.complete(pref.getString(_EMAIL));
    // });
    return completer.future;
  }

  @override
  Future<void> setMail(email) {
    // TODO: implement setMail
    Completer<String> completer = new Completer();
    CallNativeUtils.invokeMethod(
        method: _SET_DATA_SHAREPREF,
        aguments: {"key": _EMAIL, "data": email}).then((value) {
      completer.complete();
    });
    // SharedPreferences.getInstance().then((pref) {
    //   pref.setString(_EMAIL, email).then((isSaved) {
    //     print("isSavedEmail$isSaved");
    //     completer.complete();
    //   });
    // });
    return completer.future;
  }

  @override
  Future<void> setLogedData({type}) {
    // TODO: implement setLogedData
    Completer completer = new Completer();
    CallNativeUtils.invokeMethod(
        method: _SET_DATA_SHAREPREF,
        aguments: {"key": LOGIN_TYPE, "data": type}).then((value) {
      completer.complete();
    });
    return completer.future;
  }

  @override
  Future<String> getLogedData() {
    Completer<String> completer = new Completer();
    CallNativeUtils.invokeMethod(
        method: _GET_DATA_SHAREPREF,
        aguments: {"key": LOGIN_TYPE}).then((value) {
      completer.complete(value == "" ? null : value);
    }).catchError((err) {
      print(err);
    });
    return completer.future;
  }

  @override
  Future<String> getCheckin() {
    Completer<String> completer = new Completer();
    CallNativeUtils.invokeMethod(
        method: _GET_DATA_SHAREPREF, aguments: {"key": _CHECKIN}).then((value) {
      completer.complete(value == "" ? null : value);
    });
    return completer.future;
  }

  @override
  Future<void> setCheckin(day) {
    Completer<String> completer = new Completer();
    CallNativeUtils.invokeMethod(
        method: _SET_DATA_SHAREPREF,
        aguments: {"key": _CHECKIN, "data": day}).then((value) {
      completer.complete();
    });
    return completer.future;
  }

  @override
  Future<String> getDatetime() {
    Completer<String> completer = new Completer();
    CallNativeUtils.invokeMethod(
        method: _GET_DATA_SHAREPREF,
        aguments: {"key": _DATETIME}).then((value) {
      completer.complete(value == "" ? null : value);
    });
    return completer.future;
  }

  @override
  Future<void> setDatetime(date) {
    Completer<String> completer = new Completer();
    CallNativeUtils.invokeMethod(
        method: _SET_DATA_SHAREPREF,
        aguments: {"key": _DATETIME, "data": date}).then((value) {
      completer.complete();
    });
    return completer.future;
  }

  @override
  Future getReadNovel() {
    Completer completer = new Completer();
    CallNativeUtils.invokeMethod(
        method: _GET_DATA_SHAREPREF,
        aguments: {"key": READ_NOVEL}).then((value) {
      completer.complete(value == null ? "" : value);
    });
    return completer.future;
  }

  @override
  Future setReadNovel(String data) {
    Completer completer = new Completer();
    CallNativeUtils.invokeMethod(
        method: _SET_DATA_SHAREPREF,
        aguments: {"key": READ_NOVEL, "data": data}).then((value) {
      completer.complete();
    });
    return completer.future;
  }
}
