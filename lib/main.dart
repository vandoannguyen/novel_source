import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/routes/routes.dart';
import 'package:init_app/screen/bookcase/bookcase_screen.dart';
import 'package:init_app/screen/bookstore/bookstore_screen.dart';
import 'package:init_app/screen/home/home_screen.dart';
import 'package:init_app/screen/personal/personal_screen.dart';
import 'package:init_app/screen/task/task_screen.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Routes.home,
      getPages: [
        GetPage(
          name: Routes.home,
          page: () => HomeScreen(),
        ),
        GetPage(
          name: Routes.bookcase,
          page: () => BookcaseScreen(),
        ),
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
      ],
      // routes: {
      //   Routes.home: (context) => HomeScreen(),
      //   Routes.bookcase: (context) => BookcaseScreen(),
      //   Routes.bookstore: (context) => BookstoreScreen(),
      //   Routes.tasks: (context) => TaskScreen(),
      //   Routes.personal: (context) => PersonalScreen(),
      // },
    );
  }
}
