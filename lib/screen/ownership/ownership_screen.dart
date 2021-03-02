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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              appbarSecond(
                  AppLocalizations.of(context).translate(name), context),
              Container(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                alignment: Alignment.center,
                child: Text(
                  AppLocalizations.of(context).translate(name),
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 30.0),
                child: Text(
                  AppLocalizations.of(context).translate('app') +
                      " ${Common.appName} " +
                      AppLocalizations.of(context)
                          .translate('ownership content'),
                  style: TextStyle(height: 2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
