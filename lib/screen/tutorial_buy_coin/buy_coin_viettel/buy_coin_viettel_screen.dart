import 'package:flutter/material.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/screen/tutorial_buy_coin/buy_coin_viettel/buy_coin_viettel_controller.dart';
import 'package:init_app/screen/tutorial_buy_coin/tutorial_buy_coin_screen.dart';

// ignore: must_be_immutable
class BuyCoinViettelScreen extends BaseWidget<BuyCoinViettelController> {
  static const String routeName = '/buy_coin_viettel';
  static const String name =
      'Instructions for payment on google play by Viettel credit card';

  @override
  Widget build(BuildContext context, {controllerSuper}) {
    super.build(context, controllerSuper: BuyCoinViettelController());
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
                        "Currently, subscribers using SIM Viettel have added a new method to pay on Google Play, other carriers currently do not provide this service. The advantage of this service is that the payment is easy through the current phone number, so there is no need to worry about information insecurity. However, to use the service, it is necessary to satisfy the following requirements:\n\n- For prepaid SIM cards used for payment, consumption in the original account of the previous month must arise from 10 thousand VND or more.",
                        style: TextStyle(color: Colors.blue, height: 1.2),

                      ),
                    ),
                    Text(
                      "How to install and use:",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0, height: 1.2),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Text(
                        "Step 1: How to install\n\n- Open the Google Play app on your phone > press the menu icon in the upper left corner > select account > choose payment method",
                        style: TextStyle(color: Colors.blue, height: 1.2),
                      ),
                    ),
                    Image.asset(Common.pathImg + "img_ch1.png"),
                    Image.asset(Common.pathImg + "img_ch2.png"),
                    
                    Container(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Text(
                        'Step 2: Select "Add Viettel telecom billing" (Note if you do not see this option, you should turn off wifi, turn on 3G, restart the device) to enable this feature. Your phone subscriber will receive a SMS informing successful registration. When the user replaces another SIM to the registered phone, the system will send back the authenticated SMS, the transaction will be performed on the new SIM. So donnt worry about other people using your phone number to make payments.',
                        style: TextStyle(color: Colors.blue, height: 1.2),
                      ),
                    ),
                   Image.asset(Common.pathImg + "img_ch3_1.png"),
                    
                    // Container(
                    //   padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    //   child: Text(
                    //     'Step 3: Click the required information, click "Save". Fill in the address information and postage code with 6-digit code (For example: 100001) in the pop-up box.',
                    //     style: TextStyle(color: Colors.blue, height: 1.2),
                    //   ),
                    // ),
                    // Image.asset(Common.pathImg + "vtel_s1_1.png"),
                    Container(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Text(
                        'Step 3: After verifying the message sent to your phone, the displayed information will change to "Viettel Telecom".',
                        style: TextStyle(color: Colors.blue, height: 1.2),
                      ),
                    ),
                   Image.asset(Common.pathImg + "img_ch4.png"),
                    Container(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Text(
                        'Step 4: Access Google Play on your phone> select the ${Common.fanpageName} app, click "Buy Coin".',
                        style: TextStyle(color: Colors.blue, height: 1.2),
                      ),
                    ),
                    Image.asset(Common.pathImg + "img_persional.png"),
                    Image.asset(Common.pathImg + "img_buy_coin1.png"),
                    Image.asset(Common.pathImg + "img_buy_coin2.png"),
                    Container(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Text(
                        'Step 5: Enter your Google Play password.\nClick confirm => Coin purchase completed.\n\nThe purchase invoice will be sent to your Google Play registration email. Thank you for using ${Common.fanpageName}',
                        style: TextStyle(color: Colors.blue, height: 1.2),
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
