import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/app_localizations.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/common/constant.dart';
import 'package:init_app/screen/buy_coin/buy_coin_controller.dart';
import 'package:init_app/widgets/appbar_second.dart';

// ignore: must_be_immutable
class BuyCoinScreen extends BaseWidget<BuyCoinController> {
  static const String routeName = '/buy-coin';
  static const String name = 'select a payment method';
  BuildContext dialogContext;

  @override
  Widget build(BuildContext context, {controllerSuper}) {
    super.build(context, controllerSuper: BuyCoinController());
    if (Common.listInapp == null) controller.getSubscription();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            appbarSecond(AppLocalizations.of(context).translate(name), context),
            GetBuilder<BuyCoinController>(
              builder: (_) => Column(
                children: controller.paymentMethods
                    .map((e) => Container(
                          padding: EdgeInsets.fromLTRB(20.0, 10, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                Common.pathImg + e["icon"],
                                width: 30.0,
                                fit: BoxFit.contain,
                              ),
                              Text(
                                e["name"],
                                style: TextStyle(fontSize: 16.0),
                              ),
                              Radio(
                                value: e["value"],
                                groupValue: controller.value["value"],
                                onChanged: (String value) {
                                  controller.selectMethod(e);
                                },
                              ),
                            ],
                          ),
                        ))
                    .toList(),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50.0,
              margin: EdgeInsets.symmetric(horizontal: 35.0, vertical: 30.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                onPressed: () {
                  showCoinPackages(context);
                },
                color: Color(Constant.colorTxtSecond),
                textColor: Colors.white,
                child: Text(
                  "Deposit coins",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showCoinPackages(context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        dialogContext = context;
        return StatefulBuilder(
          builder: (context, setState) {
            return WillPopScope(
              onWillPop: () {
                return Future.value(true);
              },
              child: Material(
                color: Colors.transparent,
                child: Container(
                  color: Colors.transparent,
                  width: double.infinity,
                  height: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Column(
                            children: <Widget>[
                              GridView.count(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                childAspectRatio: 1.5,
                                crossAxisCount: 2,
                                children: List.generate(
                                    controller.coinPackage.length, (index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            Dialog(
                                          // shape: RoundedRectangleBorder(
                                          //     borderRadius:
                                          //         BorderRadius.circular(
                                          //             0.0)), //this right here
                                          child: Container(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: IconButton(
                                                      icon: Icon(
                                                        Icons.close_rounded,
                                                        color: Color(Constant
                                                            .colorTxtDefault),
                                                      ),
                                                      onPressed: () {
                                                        Get.back();
                                                      }),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      10.0, 0.0, 10.0, 15.0),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          "Buy coins",
                                                          style: TextStyle(
                                                              color: Color(Constant
                                                                  .colorTxtDefault),
                                                              fontSize: 16.0),
                                                        ),
                                                      ),
                                                      new RichText(
                                                        text: new TextSpan(
                                                            children: [
                                                              new TextSpan(
                                                                text:
                                                                    '${controller.coinPackage[index]["coin"]}',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        16.0),
                                                              ),
                                                              new TextSpan(
                                                                text:
                                                                    ' + ${controller.coinPackage[index]["coinExtra"]}',
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        Constant
                                                                            .colorTxtSecond),
                                                                    fontSize:
                                                                        16.0),
                                                              ),
                                                            ]),
                                                      ),
                                                      Image.asset(
                                                        Common.pathImg +
                                                            "ic_coin.png",
                                                        width: 20.0,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      10.0, 0.0, 10.0, 15.0),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          "Price",
                                                          style: TextStyle(
                                                              color: Color(Constant
                                                                  .colorTxtDefault),
                                                              fontSize: 16.0),
                                                        ),
                                                      ),
                                                      Text(
                                                        controller.coinPackage[
                                                            index]["moneyVN"],
                                                        style: TextStyle(
                                                            color: Color(Constant
                                                                .colorTxtDefault),
                                                            fontSize: 16.0),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      10.0, 0.0, 10.0, 20.0),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          "International prices",
                                                          style: TextStyle(
                                                              color: Color(Constant
                                                                  .colorTxtDefault),
                                                              fontSize: 16.0),
                                                        ),
                                                      ),
                                                      Text(
                                                        controller.coinPackage[
                                                                index]
                                                            ["moneyForeign"],
                                                        style: TextStyle(
                                                            color: Color(Constant
                                                                .colorTxtSecond),
                                                            fontSize: 16.0),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  height: 50.0,
                                                  child: RaisedButton(
                                                    onPressed: () {
                                                      controller.buyCoin(
                                                          controller
                                                                  .coinPackage[
                                                              index]);
                                                    },
                                                    color: Color(Constant
                                                        .colorTxtSecond),
                                                    textColor: Colors.white,
                                                    child: Text("Thanh toán",
                                                        style: TextStyle(
                                                          fontSize: 16.0,
                                                        )),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          color: controller.coinPackage[index]
                                                  ["sale"]
                                              ? Color(Constant.colorTxtSecond)
                                                  .withOpacity(0.3)
                                              : Colors.white,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            // mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Image.asset(
                                                  Common.pathImg +
                                                      "ic_coin.png",
                                                  width: 30.0,
                                                  fit: BoxFit.contain),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5.0),
                                                child: new RichText(
                                                  text: new TextSpan(children: [
                                                    new TextSpan(
                                                      text:
                                                          '${controller.coinPackage[index]["coin"]}',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.0),
                                                    ),
                                                    new TextSpan(
                                                      text:
                                                          ' + ${controller.coinPackage[index]["coinExtra"]}',
                                                      style: TextStyle(
                                                          color: Color(Constant
                                                              .colorTxtSecond),
                                                          fontSize: 16.0),
                                                    ),
                                                  ]),
                                                ),
                                              ),
                                              Text(
                                                controller.coinPackage[index]
                                                    ["moneyVN"],
                                                style: TextStyle(
                                                  color: Color(
                                                      Constant.colorTxtDefault),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        controller.coinPackage[index]["sale"]
                                            ? Positioned(
                                                top: 0,
                                                right: 0,
                                                child: Image.asset(
                                                  Common.pathImg + "ic_km.png",
                                                  width: 60.0,
                                                  fit: BoxFit.contain,
                                                ),
                                              )
                                            : Container(),
                                      ],
                                    ),
                                  );
                                }),
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.goTutorialBuyCoin();
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15.0),
                                  child: Text(
                                    'How to deposit coins?',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Color(Constant.colorTxtDefault)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 2.0,
                              height: 40.0,
                              color: Colors.white,
                            ),
                            IconButton(
                                padding: EdgeInsets.all(0),
                                icon: Image.asset(
                                  Common.pathImg + "ic_close.png",
                                  width: 45.0,
                                  fit: BoxFit.contain,
                                ),
                                onPressed: () {
                                  Get.back();
                                })
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
