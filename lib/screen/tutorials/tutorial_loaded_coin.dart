import 'package:flutter/material.dart';
import 'package:init_app/screen/tutorials/chplay_coin.dart';
import 'package:init_app/screen/tutorials/momo_coin.dart';
import 'package:init_app/screen/tutorials/viettel_coin.dart';

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
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          "Huong dan nap xu",
          style: TextStyle(color: Colors.black, fontSize: 18.0),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ViettelCoinScreen()));
              },
              title: Text(
                "1. Nap xu bang Viettel",
                style: TextStyle(color: Colors.black,fontSize: 15.0),
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
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ChPlayCoinScreen()));
              },
              title: Text(
                "2. Nap xu bang CH Play",
                style: TextStyle(color: Colors.black, fontSize: 15.0),
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
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MomoCoinScreen()));
              },
              title: Text(
                "3. Huong dan thanh toan bang Momo",
                style: TextStyle(color: Colors.black, fontSize: 15.0),
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
