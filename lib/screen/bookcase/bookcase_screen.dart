import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/app_localizations.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/common/images.dart';
import 'package:init_app/data/network/NovalModel.dart';
import 'package:init_app/screen/bookcase/book_case_cotroller.dart';
import 'package:init_app/screen/detail_comic_book_screen/detail_comic_book_screen.dart';
import 'package:init_app/utils/intent_animation.dart';
import 'package:init_app/widgets/button_main.dart';
import 'package:init_app/widgets/itemListLoading.dart';
import 'package:init_app/widgets/item_book_ver.dart';

class BookcaseScreen extends BaseWidget<BookCaseController> {
  static const String routeName = '/bookcase';
  static const String name = 'bookcase';
  dynamic callback;

  BookcaseScreen(this.callback);

  void clickItem(context, index, NovelModel item) {
    print("item.id${item.id}");
    IntentAnimation.intentNomal(
        context: context,
        screen: DetailComicBookScreen(idBook: item.id),
        option: IntentAnimationOption.RIGHT_TO_LEFT,
        duration: Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context, {controllerSuper}) {
    super.build(context, controllerSuper: BookCaseController());
    controller.getMybook();
    controller.getLogedIn();
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    AppLocalizations.of(context).translate(name),
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      controller.manager();
                    },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: GetBuilder<BookCaseController>(
                        builder: (_) => _.isManager
                            ? Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      icon: Icon(
                                        Icons.delete_forever_outlined,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {
                                        controller.delete();
                                      }),
                                  IconButton(
                                      icon: Icon(
                                        Icons.cancel_outlined,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {
                                        controller.cancelDelete();
                                      })
                                ],
                              )
                            : Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    Common.pathImg + "ic_edit.png",
                                    width: 20.0,
                                    height: 20.0,
                                  ),
                                  Text(AppLocalizations.of(context)
                                      .translate("manager")),
                                ],
                              ),
                      ),
                    )),
              ],
            ),
          ),
          GetBuilder<BookCaseController>(
            builder: (_) => _.isLogedIn
                ? Container()
                : Container(
                    padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${AppLocalizations.of(context).translate("Login to read more")}!",
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                        ButtonMain(
                          name: AppLocalizations.of(context).translate("login"),
                          func: () {
                            controller.login();
                          },
                          color: Color(0xFFF44336),
                        ),
                      ],
                    ),
                  ),
          ),
          Expanded(
            child: GetBuilder<BookCaseController>(
              builder: (_) => _.myBooks == null || _.isLoading
                  ? ListView.builder(
                      itemBuilder: (ctx, index) => itemListLoading(),
                      itemCount: 6,
                    )
                  : GridView.count(
                      physics: AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      childAspectRatio: 0.6,
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 15.0),
                      children: List.generate((_.myBooks.length + 1), (index) {
                        if (index == _.myBooks.length)
                          return GestureDetector(
                            onTap: () {
                              callback("bookstore");
                            },
                            child: addBook(),
                          );
                        else
                          return itemBookVer(
                              item: _.myBooks[index],
                              isManager: _.isManager,
                              func: (isSeleted) {
                                if (_.isManager) {
                                  controller.setSelected(
                                      _.myBooks[index], isSeleted);
                                } else
                                  clickItem(context, index, _.myBooks[index]);
                              });
                      }),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget addBook() {
    return Container(
      padding: EdgeInsets.all(0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              alignment: Alignment.center,
              child: Image.asset(
                ic_add,
                height: 30,
                width: 30,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            height: 45.0,
          ),
        ],
      ),
    );
  }
}
