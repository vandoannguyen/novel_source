import 'package:flutter/material.dart';

class MomoCoinScreen extends StatefulWidget {
  MomoCoinScreen({Key key}) : super(key: key);

  @override
  _MomoCoinScreenState createState() => _MomoCoinScreenState();
}

class _MomoCoinScreenState extends State<MomoCoinScreen> {
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
