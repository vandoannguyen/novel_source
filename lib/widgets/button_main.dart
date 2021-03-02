import 'package:flutter/material.dart';
import 'package:init_app/app_localizations.dart';

import '../common/constant.dart';

class ButtonMain extends StatefulWidget {
  ButtonMain(
      {Key key,
      this.color,
      @required this.name,
      @required this.func,
      this.txtSize})
      : super(key: key);
  Color color;
  String name;
  Function() func;
  double txtSize;
  @override
  _ButtonMainState createState() => new _ButtonMainState();
}

class _ButtonMainState extends State<ButtonMain> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        onPressed: widget.func,
        color: widget.color != null
            ? widget.color
            : Color(Constant.colorTxtPrimary),
        textColor: Colors.white,
        child: Text(widget.name,
         textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: widget.txtSize != null ? widget.txtSize : 13.0)),
      ),
    );
    throw UnimplementedError();
  }
}
