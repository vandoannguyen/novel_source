import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:init_app/common/common.dart';

class MyFriendWidget extends StatefulWidget {
  MyFriendWidget({Key key}) : super(key: key);

  @override
  _MyFriendWidgetState createState() => _MyFriendWidgetState();
}

class _MyFriendWidgetState extends State<MyFriendWidget> {
  bool isFriend = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: isFriend? Center(child: ListView.builder(
          itemCount: 10,
            itemBuilder: (BuildContext context, int index){
              int ind = index + 1;
          return Container(
            child: Column(
              children: [
                ListTile(
                  onTap: (){
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => LoadedCoin()));
                    Fluttertoast.showToast(msg: "My friend ${ind}", gravity: ToastGravity.CENTER, fontSize: 15, toastLength: Toast.LENGTH_SHORT, backgroundColor: Colors.grey, textColor: Colors.white);
                  },
                  title: Text("My friend ${ind}"),
                  trailing: Icon(Icons.navigate_next, color: Colors.grey[600],
                  ),
                ),
                Divider(
                  height: 1,
                  color: Colors.grey[400],
                ),
              ],
            ),
          );
        }),) : Center(child: Image.asset(Common.pathImg + "ic_user.png", height: 150, width: 150)),
      ),
    );
  }
}
