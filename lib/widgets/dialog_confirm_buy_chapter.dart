import 'package:flutter/material.dart';
import 'package:init_app/app_localizations.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/common/constant.dart';
import 'package:init_app/widgets/button_main.dart';

void showDialogConfirmBuyChapter(context, coin, {callback}) {
  showDialog(
      context: context,
      builder: (_) => dialogConfirmBuyChap(_, coin, callback: callback));
}

dialogConfirmBuyChap(context, coin, {callback}) {
  return Dialog(
    child: Container(
      padding: EdgeInsets.fromLTRB(15, 30, 15, 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${AppLocalizations.of(context).translate("Read this chapter with")} $coin",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                Image.asset(
                  Common.pathImg + "ic_coin.png",
                  width: 20.0,
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 15),
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${AppLocalizations.of(context).translate('coin balance')}: ${Common.coin}",
                  style: TextStyle(
                    color: Color(Constant.colorTxtDefault),
                  ),
                ),
                Image.asset(
                  Common.pathImg + "ic_coin.png",
                  width: 20.0,
                )
              ],
            ),
          ),
          Container(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: double.infinity,
                                  child: ButtonMain(
                      name: AppLocalizations.of(context).translate("Unlock Now"),
                      color: Color(Constant.colorTxtSecond),
                      txtSize: 15.0,
                      func: () {
                        Navigator.pop(context);
                        callback(true);
                      }),
                ),
                //    GestureDetector(
                //   onTap: () {
                //     Navigator.pop(context);
                //     callback(true);
                //   },
                //   child: Container(
                //     width: 100,
                //     color: Color(Constant.colorTxtSecond),
                //     height: 40,
                //     alignment: Alignment.center,
                //     child: Text(
                //       AppLocalizations.of(context).translate("Unlock Now"),
                //       style: TextStyle(color: Colors.white),
                //     ),
                //   ),
                // ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    callback(false);
                  },
                  child: Container(
                   width: double.infinity,
                    color: Colors.transparent,
                    height: 40,
                    alignment: Alignment.center,
                    child: Text(AppLocalizations.of(context).translate("No")),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
