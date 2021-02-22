import 'package:get/get.dart';
import 'package:init_app/base/base_controller.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/data/network/BannerNovelModel.dart';
import 'package:init_app/data/network/NovelModelHotest.dart';
import 'package:init_app/data/repository.dart';
import 'package:init_app/screen/detail_comic_book_screen/detail_comic_book_screen.dart';
import 'package:init_app/utils/intent_animation.dart';

class NovelBookController extends BaseController {
  int currentCarousel = 0;
  int currentCarouselNewest = 1;
  final List<String> images = [
    'https://images.unsplash.com/photo-1586882829491-b81178aa622e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586871608370-4adee64d1794?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2862&q=80',
    'https://images.unsplash.com/photo-1586901533048-0e856dff2c0d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    'https://images.unsplash.com/photo-1586902279476-3244d8d18285?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586943101559-4cdcf86a6f87?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
    'https://images.unsplash.com/photo-1586951144438-26d4e072b891?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    'https://images.unsplash.com/photo-1586953983027-d7508a64f4bb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
  ];
  List<BannerNovelModel> listBanner;

  List<NovelModelHotest> listHotest;

  List<NovelModelHotest> listNewest;

  NovelBookController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   images.forEach((imageUrl) {
    //     precacheImage(NetworkImage(imageUrl));
    //   });
    // });
  }

  void changeCarousel(index, reason) {
    currentCarousel = index;
    update();
  }

  void changeCarouselNewest(index, reason) {
    currentCarouselNewest = index;
    update();
  }

  void clickItem(index, NovelModelHotest item) {
    print(item.id);
    IntentAnimation.intentNomal(
        context: context,
        screen: DetailComicBookScreen(idBook: item.id),
        option: IntentAnimationOption.RIGHT_TO_LEFT,
        duration: Duration(milliseconds: 800));
  }

  void callBack(key, value) {
    switch (key) {
      case "BACK":
        Get.back();
        break;
      case "SHARE":
        break;
      default:
    }
  }

  void getBanner() {
    RepositoryImpl.getInstance()
        .getBanner(language: Common.language)
        .then((value) {
      listBanner = new List();
      listBanner.addAll(value);
      update();
    }).catchError((err) {
      listBanner = null;
      update();
    });
  }

  void getNewest() {
    RepositoryImpl.getInstance()
        .getNovelNewest(language: Common.language, page: 1, limitPerPage: 10)
        .then((value) {
      listNewest = value;
      update();
    }).catchError((err) {});
  }

  void getHotest() {
    RepositoryImpl.getInstance()
        .getNovelHotest(language: Common.language, page: 1, limitPerPage: 10)
        .then((value) {
      listHotest = value;
      update();
    }).catchError((err) {});
  }
}
