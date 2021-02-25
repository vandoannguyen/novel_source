import 'package:init_app/data/network/NovalModel.dart';
import 'package:init_app/data/network/UserModel.dart';
import 'package:installed_apps/app_info.dart';

class Common {
  static final String CHANNEL = "com.example.init_app";
  static final String EXTEND_ONEADX_KEY = "";
  static final String ONEADX_KEY = "gmBUYwLTV2VDu5Y8Dg5S9WpuaNDZvRaZ";
  static String pathImg = "assets/images/";
  static String language = null;
  static String token = "";
  static UserModel user = null;
  static List<NovelModel> myBooks = null;
  static String appName = "ĐỌC SÁCH";
  static String fanpageName = "SÁCH";
  static String fanpageLink = "https://www.facebook.com/";
  static String email = "tahanh.aib@gmail.com";
  static var config = {};

  static var isLogedIn = false;
  //checkin
  static int coin_checkin = 0;
  static int coin = 0;
  // static bool isCheckin = false;
  //static bool isCheckin = false;
  static int days = 0;
  static int date = 0;
  //getList
  static List<AppInfo> apps = [];
}
