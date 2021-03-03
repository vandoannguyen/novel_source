import 'package:flutter/material.dart';
import 'package:init_app/app_localizations.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/screen/tutorial_buy_coin/tutorial_buy_coin_controller.dart';
import 'package:init_app/screen/tutorial_buy_coin/tutorial_buy_coin_screen.dart';
import 'package:init_app/widgets/appbar_second.dart';

// ignore: must_be_immutable
class TutorialBuyCoinScreen extends BaseWidget<TutorialBuyCoinController> {
  static const String routeName = '/buy_coin_tutorial';
  static const String name = 'tutorial buy coin';

  @override
  Widget build(BuildContext context, {controllerSuper}) {
    super.build(context, controllerSuper: TutorialBuyCoinController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            appbarSecond(AppLocalizations.of(context).translate("tutorial buy coin"), context),
            Expanded(
                child: Container(
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                                          child: Text(
                        AppLocalizations.of(context).translate("tutorial buy coin"),
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),

                             textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                      child: Text(
                       AppLocalizations.of(context).translate("step1"),
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    Image.asset(Common.pathImg + "img_buy_coin1.png"),
                    Image.asset(Common.pathImg + "img_buy_coin2.jpg"),
                    Image.asset(Common.pathImg + "img_buy_coin3.jpg"),
                    
                    Container(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Text(
                        AppLocalizations.of(context).translate("step2"),
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Text(
                        AppLocalizations.of(context).translate("step3"),
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                   Image.asset(Common.pathImg + "img_buy_coin4.png"),
              
                    Container(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Text(
                        '${AppLocalizations.of(context).translate("Thank you for using")} ${Common.fanpageName}!',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
