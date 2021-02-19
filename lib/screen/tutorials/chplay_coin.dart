import 'package:flutter/material.dart';

class ChPlayCoinScreen extends StatefulWidget {
  ChPlayCoinScreen({Key key}) : super(key: key);

  @override
  _ChPlayCoinScreenState createState() => _ChPlayCoinScreenState();
}

class _ChPlayCoinScreenState extends State<ChPlayCoinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.pop(context)),
        title: Text(
          "HUONG DAN THANH TOAN",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(),
    );
  }
}
