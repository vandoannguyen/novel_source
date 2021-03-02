import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/app_localizations.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/screen/personal/personal_controller.dart';
import 'package:init_app/widgets/button_main.dart';

import '../../common/constant.dart';

// ignore: must_be_immutable
class PersonalScreen extends BaseWidget<PersonalController> {
  PersonalScreen({this.callBack});
  final Function callBack;
  static const String routeName = '/personal';
  static const String name = 'personal';

  @override
  Widget build(BuildContext context, {controllerSuper}) {
    super.build(context, controllerSuper: PersonalController());
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey[200],
      child: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              width: size.width,
              padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
              child: Text(
                AppLocalizations.of(context).translate(name),
                style: TextStyle(
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 15.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    color: Color(Constant.colorTxtDefault).withOpacity(0.5),
                    width: 0.3,
                  ),
                ),
              ),
              child: GetBuilder<PersonalController>(
                builder: (_) => controller.isLogin
                    ? Row(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(10.0, 0, 15.0, 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100.0),
                              child: FadeInImage.assetNetwork(
                                placeholder: Common.pathImg + "ic_us.png",
                                image: controller.profile["picture"],
                                fit: BoxFit.cover,
                                width: 50.0,
                                height: 50.0,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(bottom: 5.0),
                                child: Text(
                                  controller.profile["name"],
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                              Text(
                                controller.profile["code"],
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Color(Constant.colorTxtDefault)),
                              ),
                            ],
                          )
                        ],
                      )
                    : GestureDetector(
                        onTap: () {
                          controller.goLogin();
                        },
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(10.0, 0, 15.0, 0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100.0),
                                child: Image.asset(
                                  Common.pathImg + "ic_us.png",
                                  fit: BoxFit.cover,
                                  width: 50.0,
                                  height: 50.0,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 5.0),
                              child: Text(
                                AppLocalizations.of(context).translate('login'),
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Row(
                      children: [
                        GetBuilder<PersonalController>(
                          builder: (_) => controller.isLogin
                              ? Text(
                                  "${AppLocalizations.of(context).translate('coin balance')}: ${controller.profile["coin"]}")
                              : Text("${AppLocalizations.of(context).translate('coin balance')}: 0.0"),
                        ),
                        Image.asset(
                          Common.pathImg + "ic_coin.png",
                          fit: BoxFit.contain,
                          width: 18.0,
                          height: 18.0,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 30.0,
                    child: ButtonMain(
                        name: AppLocalizations.of(context)
                            .translate("deposit coin"),
                        func: () {
                          controller.goBuyCoin();
                          // controller.click("BUY_COIN");
                        }),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 3.0,
            ),
            // financial-transaction
            item(
                context: context,
                name: "detail transaction",
                icon: "ic_transaction.png",
                func: () {
                  controller.click("DETAIL_TRANSACTION");
                }),
            item(
                context: context,
                name: "support",
                icon: "ic_support.png",
                func: () {
                  controller.click("SUPPORT");
                }),
            item(
                context: context,
                name: "come author",
                icon: "ic_author.png",
                func: () {
                  controller.click("COME_AUTHOR");
                }),
            item(
                context: context,
                name: "frequently question",
                icon: "ic_question.png",
                func: () {
                  controller.goFrequentlyQuestion((){
                    callBack("GOTO_TAB", 2);
                    print("callBack GOTO_TAB");
                  });
                }),
            item(
                context: context,
                name: "feedback",
                icon: "ic_feedback.png",
                func: () {
                  controller.click("FEEDBACK");
                }),
            item(
                context: context,
                name: "settings",
                icon: "ic_setting.png",
                func: () {
                  controller.click("SETTING");
                }),
          ],
        ),
      ),
    );
  }

  Widget item({context, name, icon, func}) {
    return GestureDetector(
      onTap: func,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              color: Color(Constant.colorTxtDefault).withOpacity(0.5),
              width: 0.3,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(15.0),
              child: Image.asset(
                Common.pathImg + icon,
                width: 25.0,
                height: 25.0,
              ),
            ),
            Expanded(
              child: Text(
                AppLocalizations.of(context).translate(name),
              ),
            ),
            Container(
              margin: EdgeInsets.all(5.0),
              child: Icon(
                Icons.navigate_next_rounded,
                color: Color(Constant.colorTxtDefault),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
