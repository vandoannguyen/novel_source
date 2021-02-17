import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

abstract class ISharePref {
  Future getSharePref();
}

class SharePrefImpl extends ISharePref {
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
}
