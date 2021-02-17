import 'package:flutter/material.dart';

import '../common/constant.dart';

class ButtonMain extends StatefulWidget {
  ButtonMain({
    Key key,
    this.color,
    @required this.name,
    @required this.func,
  }) : super(key: key);
  Color color;
  String name;
  Function() func;

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
        child: Text(widget.name, style: TextStyle(fontSize: 13.0)),
      ),
    );
    throw UnimplementedError();
  }
}
