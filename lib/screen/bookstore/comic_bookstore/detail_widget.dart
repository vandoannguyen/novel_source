import 'package:flutter/material.dart';

class DetailWidget extends StatefulWidget {
  DetailWidget({Key key}) : super(key: key);

  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Detail"),
    );
  }
}
