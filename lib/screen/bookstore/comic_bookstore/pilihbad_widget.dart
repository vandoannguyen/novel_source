import 'package:flutter/material.dart';

class PilihbadWidget extends StatefulWidget {
  PilihbadWidget({Key key}) : super(key: key);

  @override
  _PilihbadWidgetState createState() => _PilihbadWidgetState();
}

class _PilihbadWidgetState extends State<PilihbadWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Đang cập nhât",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  "Cập nhật đến chương 70",
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
                  return GestureDetector(
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(color: Colors.grey, spreadRadius: 1)
                          ]),
                      child: Center(
                        child: Text("Chap $index", textAlign: TextAlign.center),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
