import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:init_app/app_localizations.dart';
import 'package:init_app/common/Common.dart';
import 'package:init_app/routes/routes.dart';
import 'package:init_app/screen/bookcase/bookcase_screen.dart';
import 'package:init_app/screen/bookstore/bookstore_screen.dart';
import 'package:init_app/screen/home/home_screen.dart';
import 'package:init_app/screen/load/load_screen.dart';
import 'package:init_app/screen/personal/personal_screen.dart';
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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
         Locale('vi', 'VN'),
    Locale('en', 'US'),
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
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
          name: Routes.personal,
          page: () => PersonalScreen(),
        ),
        GetPage(
          name: Routes.load,
          page: () => LoadScreen(),
        ),
      ],
    );
  }
}
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter demo app'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
           AppLocalizations.of(context).translate('coin balance'),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.0,
            ),
          ),
          Text(
            'Chào mừng bạn đến với Flutter',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
            ),
          )
        ],
      ),
    );
  }
}