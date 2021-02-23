import 'package:flutter/material.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/screen/tutorial_buy_coin/buy_coin_chplay/buy_coin_chplay_controller.dart';
import 'package:init_app/screen/tutorial_buy_coin/tutorial_buy_coin_screen.dart';

// ignore: must_be_immutable
class BuyCoinChplayScreen extends BaseWidget<BuyCoinChplayController> {
  static const String routeName = '/buy_coin_chplay';
  static const String name = 'Instructions to buy coins by google play';

  @override
  Widget build(BuildContext context, {controllerSuper}) {
    super.build(context, controllerSuper: BuyCoinChplayController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            appbar(name),
            Expanded(
                child: Container(
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),

                           textAlign: TextAlign.center,
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Text(
                          "Method 1: Before using google play, you already have a credit or debit card in google pay.",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),

                    Container(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Text(
                        'Step 1: Open your "Personal", Click "Buy coins" > Choose how much you want to buy',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    Image.asset(Common.pathImg + "img_persional.png"),
                    Image.asset(Common.pathImg + "img_buy_coin1.png"),
                    
                    Container(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Text(
                        'Step 2: Select Google > click "Pay"',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Text(
                        'Step 3: You click "Buy with 1 click" will buy the coin successfully',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                   Image.asset(Common.pathImg + "img_buy_coin2.png"),
                    //Method 2
                    Container(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Text(
                          "Method 2: For the first time using google play, you must prepare a credit or debit card added to google play",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),

                    Container(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Text(
                        'Step 1: Open your "Personal", Click "Buy coins" > Choose how much you want to buy',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                     Image.asset(Common.pathImg + "img_persional.png"),
                    Image.asset(Common.pathImg + "img_buy_coin1.png"),
                    Container(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Text(
                        'Step 2: Select Google > click "Pay"',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Text(
                        'Step 3: Before you do not have a card in google play, you must add a card, your card must be a credit or debit card > choose to add a credit or debit card > click continue',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    Image.asset(Common.pathImg + "img_buy_coin2.png"),
                    Container(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Text(
                        'Step 4: Enter required information, press "Save" > choose to buy with 1 click, you will successfully buy coins.',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    // 2 ảnh
                    Container(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Text(
                        'Thank you for using ${Common.fanpageName}!',
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
