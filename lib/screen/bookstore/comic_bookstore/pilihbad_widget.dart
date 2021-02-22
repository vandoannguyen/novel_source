import 'package:flutter/material.dart';

class PilihbadWidget extends StatefulWidget {
  PilihbadWidget({Key key}) : super(key: key);

  @override
  _PilihbadWidgetState createState() => _PilihbadWidgetState();
}

class _PilihbadWidgetState extends State<PilihbadWidget> {
  bool isLock = false;
  void _onClickItem(int index){

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            margin: EdgeInsets.only(top: 10, bottom: 5.0),
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Updating",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  "Update to chapter 70",
                  style: TextStyle(fontSize: 12, color: Colors.pink),
                ),
              ],
            ),
          ),
          new Expanded(
            child: GridView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 2.5),
                ),
                itemCount: 70,
                itemBuilder: (BuildContext context, int index) {
                  int ind = index + 1;
                  return GestureDetector(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              left: 10, right: 10, top: 5, bottom: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(color: Colors.grey, spreadRadius: 1)
                              ]),
                          child: Center(
                            child: Text("Chap $ind",
                                textAlign: TextAlign.center),
                          ),
                        ),
                        index > 12
                            ? Container(
                                margin: EdgeInsets.only(top: 5, left: 60),
                                child: Icon(
                                  Icons.lock,
                                  color: Colors.grey,
                                  size: 13,
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
