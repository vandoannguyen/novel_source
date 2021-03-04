import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:init_app/app_localizations.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/routes/routes.dart';
import 'package:init_app/screen/bookstore/bookstore_screen.dart';
import 'package:init_app/screen/home/home_screen.dart';
import 'package:init_app/screen/load/load_screen.dart';
import 'package:init_app/screen/task/task_screen.dart';
import 'package:init_app/utils/call_native_utils.dart';

import 'app_localizations.dart';

void main() {
  CallNativeUtils.setChannel(Common.CHANNEL);
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    EventChannel eventChannel = new EventChannel("INAPP_EVENT");
    eventChannel.receiveBroadcastStream().listen((event) {});
//     Locale myLocale = Localizations.localeOf(context);
// print("myLocale myLocale myLocale $myLocale");
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', 'US'),
        Locale('vi', 'VN'),
        Locale('id', 'ID'),
        Locale('th', 'TH'),
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            Common.langNow = supportedLocale.languageCode;

            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
// home: HomePage(),
      initialRoute: Routes.load,
      getPages: [
        GetPage(
          name: Routes.home,
          page: () => HomeScreen(),
        ),
        // GetPage(
        //   name: Routes.bookcase,
        //   page: () => BookcaseScreen((_) {}),
        // ),
        GetPage(
          name: Routes.bookstore,
          page: () => BookstoreScreen(),
        ),
        GetPage(
          name: Routes.tasks,
          page: () => TaskScreen(),
        ),

        GetPage(
          name: Routes.load,
          page: () => LoadScreen(),
        ),
      ],
    );
  }
}
