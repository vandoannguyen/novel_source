import 'package:flutter/material.dart';

class ViettelCoinScreen extends StatefulWidget {
  ViettelCoinScreen({Key key}) : super(key: key);

  @override
  _ViettelCoinScreenState createState() => _ViettelCoinScreenState();
}

class _ViettelCoinScreenState extends State<ViettelCoinScreen> {
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
