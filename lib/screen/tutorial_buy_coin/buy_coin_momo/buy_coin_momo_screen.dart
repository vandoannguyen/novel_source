import 'package:flutter/material.dart';
import 'package:init_app/app_localizations.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/screen/tutorial_buy_coin/buy_coin_momo/buy_coin_momo_controller.dart';
import 'package:init_app/widgets/appbar_second.dart';

// ignore: must_be_immutable
class BuyCoinMonoScreen extends BaseWidget<BuyCoinMonoController> {
  static const String routeName = '/buy_coin_mono';
  static const String name = 'Payment by momo';

  @override
  Widget build(BuildContext context, {controllerSuper}) {
    super.build(context, controllerSuper: BuyCoinMonoController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            appbarSecond(AppLocalizations.of(context).translate(name), context),
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
                      padding: EdgeInsets.fromLTRB(0, 10.0, 0.0, 10.0),
                      child: Text(
                        "Step 1: Open Google Play",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    Text(
                      "After you click to select the menu bar located in the left corner on Google",
                      style: TextStyle(),
                    ),
                    Image.asset(Common.pathImg + "img_ch1.png"),

                    //   Container(
                    //     padding: EdgeInsets.fromLTRB(0, 10.0, 0.0, 10.0),
                    //     child: Text(
                    //       'Step 2: Select "Account"',
                    //       style: TextStyle(color: Colors.blue),
                    //     ),
                    //   ),
                    //  Image.asset(Common.pathImg + "img_ch2.png"),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10.0, 0.0, 10.0),
                      child: Text(
                        'Step 2: Select "Payment method"',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    Text(
                      "Select the payment method you want to associate with your Google Play account.",
                      style: TextStyle(),
                    ),
                    Image.asset(Common.pathImg + "img_ch2.png"),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10.0, 0.0, 10.0),
                      child: Text(
                        'Step 3: Select "Add Momo E-Wallet"',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    Text(
                      "Select a payment method on Google Play with Momo wallet",
                      style: TextStyle(),
                    ),
                    Image.asset(Common.pathImg + "img_ch3_2.png"),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10.0, 0.0, 10.0),
                      child: Text(
                        'Step 5: Log in to Momo Wallet',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    Text(
                      "Please login to Momo Wallet to proceed with confirming payment method link with Google Play.",
                      style: TextStyle(),
                    ),
                    // Image.asset(Common.pathImg + "momo_s5.png"),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10.0, 0.0, 10.0),
                      child: Text(
                        'Step 6: Select "Confirm"',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    Text(
                      'Please check the licensing permissions for Google Play. And, carefully read the Momo wallet terms and privacy policy before selecting "Confirm".',
                      style: TextStyle(),
                    ),
                    // Image.asset(Common.pathImg + "momo_s6.png"),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10.0, 0.0, 10.0),
                      child: Text(
                        'Step 7: Payment method for Momo Wallet',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    Text(
                      'In your Google Play account, Momo wallet has been successfully added to become your payment method. You need to maintain a minimum balance in your Momo Wallet account of 1\$',
                      style: TextStyle(),
                    ),
                    // Image.asset(Common.pathImg + "momo_s7.png"),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10.0, 0.0, 10.0),
                      child: Text(
                        'Step 8: Go to the ${Common.fanpageName} app, click "Buy coin" then select the Google icon.',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    Image.asset(Common.pathImg + "img_buy_coin1.png"),
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
