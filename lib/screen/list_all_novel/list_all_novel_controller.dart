import 'package:init_app/base/base_controller.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/data/network/NovalModel.dart';
import 'package:init_app/data/repository.dart';
import 'package:init_app/screen/detail_comic_book_screen/detail_comic_book_screen.dart';
import 'package:init_app/screen/list_all_novel/list_all_novel.dart';
import 'package:init_app/utils/intent_animation.dart';

class ListAllNovelController extends BaseController {
  List<NovelModel> list;

  bool isLoading = false;

  var page = 1;

  var limit = 20;
  var isLoadMore = false;
  bool isLoadAll = false;

  String type = "";

  void clickItem(int index, NovelModel item) {
    IntentAnimation.intentNomal(
        context: context,
        screen: DetailComicBookScreen(idBook: item.id),
        option: IntentAnimationOption.RIGHT_TO_LEFT,
        duration: Duration(milliseconds: 800));
  }

  void getList(String type) {
    this.type = type;
    if (type == ListAllNovel.HOT) {
      loadHotest(page);
    }
    if (type == ListAllNovel.NEW) {
      loadNewest(page);
    }
  }

  void loadHotest(int page) {
    isLoading = true;
    update();
    RepositoryImpl.getInstance()
        .getNovelHotest(
            language: Common.language, page: page, limitPerPage: limit)
        .then((value) {
      if (isLoadMore) {
        list.addAll(value);
        isLoadMore = false;
        update();
        if (value.length < limit) isLoadAll = true;
      } else {
        list = value;
        update();
      }
      isLoading = false;
      update();
    }).catchError((err) {
      if (isLoadMore) isLoadMore = false;
      isLoading = false;
      update();
    });
  }

  void loadNewest(int page) {
    isLoading = true;
    update();
    RepositoryImpl.getInstance()
        .getNovelNewest(
            language: Common.language, page: page, limitPerPage: limit)
        .then((value) {
      if (isLoadMore) {
        list.addAll(value);
        isLoadMore = false;
        update();
        if (value.length < limit) isLoadAll = true;
      } else {
        list = value;
        update();
      }
      isLoading = false;
      update();
    }).catchError((err) {
      if (isLoadMore) isLoadMore = false;
      isLoading = false;
      update();
    });
  }

  void loadMore() {
    if (!isLoadAll) {
      isLoadMore = true;
      page++;
      getList(type);
    }
  }
}
