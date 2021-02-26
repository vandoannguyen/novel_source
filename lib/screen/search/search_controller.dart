import 'package:flutter/cupertino.dart';
import 'package:init_app/base/base_controller.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/data/network/NovalModel.dart';
import 'package:init_app/data/repository.dart';

class SearchController extends BaseController {
  SearchController();

  TextEditingController textcontroller = new TextEditingController();
  FocusNode searchFocus = FocusNode();
  List<NovelModel> listHotest;
  List<NovelModel> listNewest;
  bool isFocus = false;
  var page = 1;
  bool isLoadAll = false;

  bool isLoading = false;

  bool isLoadMore = false;
  var limitPerpage = 9;

  void onClickSearch() {
    textcontroller.clear();
    FocusScope.of(context).requestFocus(new FocusNode());
    isFocus = false;
    update();
  }

  // void clickItem(index, NovelModel item) {
//     print(item.id);
//     IntentAnimation.intentNomal(
//         context: context,
//         screen: DetailComicBookScreen(idBook: item.id),
//         option: IntentAnimationOption.RIGHT_TO_LEFT,
//         duration: Duration(milliseconds: 800));
//   }
//   void changeCarouselNewest(index, reason) {
//     currentCarouselNewest = index;
//     update();
//   }
  void getNewest() {
    RepositoryImpl.getInstance()
        .getNovelNewest(language: Common.language, page: 1, limitPerPage: 20)
        .then((value) {
      listNewest = value;
      update();
    }).catchError((err) {});
  }

  void getHotest({page = 1}) {
    this.page = page;
    isLoading = true;
    RepositoryImpl.getInstance()
        .getNovelHotest(
            language: Common.language, page: page, limitPerPage: limitPerpage)
        .then((value) {
      isLoading = false;
      if (isLoadMore) {
        isLoadMore = false;
        listHotest.addAll(value);
        update();
        if (value.length < limitPerpage) isLoadAll = true;
      } else {
        listHotest = value;
        update();
      }
    }).catchError((err) {});
  }
}
