import 'package:flutter/cupertino.dart';
import 'package:init_app/base/base_controller.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/data/network/NovalModel.dart';
import 'package:init_app/data/repository.dart';
import 'package:init_app/screen/detail_comic_book_screen/detail_comic_book_screen.dart';
import 'package:init_app/utils/intent_animation.dart';

class SearchController extends BaseController {
  SearchController();

  TextEditingController textcontroller = new TextEditingController();
  FocusNode searchFocus = FocusNode();
  List<NovelModel> listHotest;
  List<NovelModel> listNewest;
  List<NovelModel> listSearch;

  bool isFocus = false;
  var page = 1;
  bool isLoadAll = false;
  bool isLoading = false;
  bool isLoadMore = false;
  bool isSearch = false;
  var limitPerpage = 20;

  void onClickSearch() {
    textcontroller.clear();
    FocusScope.of(context).requestFocus(new FocusNode());
    isFocus = !isFocus;
    update();
  }

  void clickItem(index, NovelModel item) {
    print(item.id);
    IntentAnimation.intentNomal(
        context: context,
        screen: DetailComicBookScreen(idBook: item.id),
        option: IntentAnimationOption.RIGHT_TO_LEFT,
        duration: Duration(milliseconds: 800));
  }

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

  void getSearch(String data) {
    RepositoryImpl.getInstance().search(data).then((value) {
      listSearch =
          (value as List).map((element) => NovelModel.fromJson(element)).toList();
      if(listSearch.toString() == "[]"){
        isSearch = true;
        print("isSearch1 $value");
        print("isSearch2 $listSearch");
      }else{
        isSearch = false;
      }
      update();
    }).catchError((err) {
      print(err);
    });
  }
// void getSearchComplete(String data){
//   RepositoryImpl.getInstance().searchAutoComplete(data).then((value) {
//     listSearch = value;
//     update();
//     print("getSearchComplete $value");
//   }).catchError((err){print(err);});
// }

}
