import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/app_localizations.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/common/constant.dart';
import 'package:init_app/screen/tutorial_buy_coin/tutorial_buy_coin_controller.dart';
import 'package:init_app/widgets/appbar_second.dart';

// ignore: must_be_immutable
class TutorialBuyCoinScreen extends BaseWidget<TutorialBuyCoinController> {
  static const String routeName = '/tutorial-buy-coin';
  static const String name = 'tutorial buy coin';
  @override
  Widget build(BuildContext context, {controllerSuper}) {
    super.build(context, controllerSuper: TutorialBuyCoinController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            appbarSecond(AppLocalizations.of(context).translate(name)),
            Expanded(
              child: ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.tutorials.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        controller.clickItem(index);
                      },
                      child: Container(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "${index + 1}. ${controller.tutorials[index]}",
                              ),
                            ),
                            Icon(
                              Icons.navigate_next_rounded,
                              size: 20.0,
                              color: Color(Constant.colorTxtDefault),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

Widget appbar(name) {
  return Container(
    color: Colors.white,
    child: Row(
      children: [
        IconButton(
          padding: EdgeInsets.all(10.0),
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_rounded),
        ),
        Expanded(
          child: Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 20.0),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}
