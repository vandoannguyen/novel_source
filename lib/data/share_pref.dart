import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

abstract class ISharePref {
  Future getSharePref();

  Future<String> getLanguage();

  Future<void> setLanguage(language);

  Future<String> getMail();
  Future<void> setMail(email);
}

class SharePrefImpl extends ISharePref {
  final String _LANGUAGE = "language";

  final String _EMAIL = "email";

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
    SharedPreferences.getInstance().then((pref) {
      return pref.getString(_LANGUAGE);
    }).then((value) {
      completer.complete(value);
    });
    return completer.future;
  }

  Future<void> setLanguage(language) {
    Completer<String> completer = new Completer();
    SharedPreferences.getInstance().then((pref) {
      return pref.setString(_LANGUAGE, language);
    }).then((value) {});
    return completer.future;
  }

  @override
  Future<String> getMail() {
    // TODO: implement getMail
    Completer<String> completer = new Completer();
    SharedPreferences.getInstance().then((pref) {
      return pref.getString(_EMAIL);
    }).then((value) {
      completer.complete(value);
    });
    return completer.future;
  }

  @override
  Future<void> setMail(email) {
    // TODO: implement setMail
    Completer<String> completer = new Completer();
    SharedPreferences.getInstance().then((pref) {
      return pref.setString(_EMAIL, email);
    }).then((value) {});
    return completer.future;
  }
}
