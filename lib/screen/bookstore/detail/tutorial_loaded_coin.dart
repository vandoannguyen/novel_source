import 'package:flutter/material.dart';

class TutorialLoadedCoin extends StatefulWidget {
  TutorialLoadedCoin({Key key}) : super(key: key);

  @override
  _TutorialLoadedCoinState createState() => _TutorialLoadedCoinState();
}

class _TutorialLoadedCoinState extends State<TutorialLoadedCoin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Huong dan nap xu",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                "1.Nap xu bang Viettel",
                style: TextStyle(color: Colors.black),
              ),
              trailing: Icon(
                Icons.navigate_next_sharp,
                color: Colors.grey,
              ),
            ),
            Divider(
              height: 1,
              color: Colors.grey[400],
            ),
            ListTile(
              title: Text(
                "2.Nap xu bang CH Play",
                style: TextStyle(color: Colors.black),
              ),
              trailing: Icon(
                Icons.navigate_next_sharp,
                color: Colors.grey,
              ),
            ),
            Divider(
              height: 1,
              color: Colors.grey[400],
            ),
            ListTile(
              title: Text(
                "3. Huong dan thanh toan bang Momo",
                style: TextStyle(color: Colors.black),
              ),
              trailing: Icon(
                Icons.navigate_next_sharp,
                color: Colors.grey,
              ),
            ),
            Divider(
              height: 1,
              color: Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }
}
