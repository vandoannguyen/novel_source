import 'package:flutter/material.dart';
import 'package:init_app/app_localizations.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/screen/ownership/ownership_controller.dart';
import 'package:init_app/widgets/appbar_second.dart';

class OwnershipScreen extends BaseWidget<OwnershipController> {
  static const String routeName = '/ownership';
  static const String name = 'ownership';

  @override
  Widget build(BuildContext context, {controllerSuper}) {
    super.build(context, controllerSuper: OwnershipController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            appbarSecond(AppLocalizations.of(context).translate(name)),
            Container(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              alignment: Alignment.center,
              child: Text(
                OwnershipScreen.name,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 30.0),
              child: Text(
                "App ${Common.appName} provides content including but not limited to: work, work summary, image, application, interface design, app layout, logo. All of the above content is owned by the company and protected by domestic intellectual laws and international treaties and copyrights.\n\nCustomers are allowed to use the content as regulated under the benefits given. Customer may only use the content, not modify, copy, reproduce, post, transmit, create works with related content or provide or resell content to third parties in any form. formula whether it's non-profit or profitable.\n\nIf detecting acts contrary to the above terms, our company has the right to prosecute legal liability.",
                style: TextStyle(height: 2),
              ),
            )
          ],
        ),
      ),
    );
  }
}
