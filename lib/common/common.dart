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
  static String appName = "ĐỌc SÁCH";
  static String fanpageName = "Hotnovel";
  static String fanpageLink = "https://www.facebook.com/Hotnovel-100817905411136";
  static String email = "vandoannguyenhaui@gmail.com";
  static var config = {};

  static var isLogedIn = false;
static String logedType;
  //checkin
  // static int coin_checkin = 0;
  static int coin = 0;

  // static bool isCheckin = false;
  static int days = 0;
  static int date = 0;

  static String langNow = "en";

  //getList
  static List<AppInfo> apps = [];

//   {
//   "idBook": chapter.bookId,
//   "chapterNum": chapter.num,
//   "read": read
//   }
  static List listReadChapter;

  static List<dynamic> listInapp = [];
}
