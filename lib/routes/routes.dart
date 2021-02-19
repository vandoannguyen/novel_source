import 'package:init_app/screen/bookcase/bookcase_screen.dart';
import 'package:init_app/screen/bookstore/bookstore_screen.dart';
import 'package:init_app/screen/home/home_screen.dart';
import 'package:init_app/screen/load/load_screen.dart';
import 'package:init_app/screen/personal/personal_screen.dart';
import 'package:init_app/screen/task/task_screen.dart';

class Routes {
  static const String home = HomeScreen.routeName;
  static const String bookcase = BookcaseScreen.routeName;
  static const String bookstore = BookstoreScreen.routeName;
  static const String tasks = TaskScreen.routeName;
  static const String personal = PersonalScreen.routeName;
  static const String load = LoadScreen.routeName;
}
