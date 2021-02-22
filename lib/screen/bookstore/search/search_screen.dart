import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:init_app/common/common.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Center(
                      child: IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          iconSize: 22,
                          color: Colors.grey[800],
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ),
                  ),
                  Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width * 0.72,
                    margin: EdgeInsets.only(top: 6, bottom: 6),
                    //margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                    //padding: EdgeInsets.symmetric(vertical: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    ),
                    child: Center(
                      child: TextField(
                        controller: _controller,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 3),
                          fillColor: Colors.grey[400],
                          hintText: "Search book, author",
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 12,
                          ),
                          border: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        _controller.clear();
                        FocusScope.of(context).requestFocus(new FocusNode());
                      });
                    },
                    child: Container(
                        margin: EdgeInsets.all(10),
                        child: Center(
                            child: Text(
                          "No",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12),
                        ))),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.ac_unit,
                    color: Colors.red,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5.0),
                    child: Text(
                      "HOTTEST",
                      style: TextStyle(color: Colors.pink),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 100,
              child: GridView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 8),
                  ),
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    int ind = index + 1;
                    return GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              color: Colors.red,
                              child: Center(
                                child: Text("$ind", style: TextStyle(color: Colors.white)),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5.0),
                              child: Center(
                                child: Text(
                                  "Truyen hay so ${ind}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.grey[800]),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.ac_unit,
                    color: Colors.red,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5.0),
                    child: Text(
                      "Sach hot ban chay",
                      style: TextStyle(color: Colors.pink),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                  // physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.75,
                    // childAspectRatio: MediaQuery.of(context).size.width /
                    //     (MediaQuery.of(context).size.height),
                  ),
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    int ind = index + 1;
                    return GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              Common.pathImg + "bg_checkin.jpg",
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5.0),
                              child: Center(
                                child: Text(
                                  "Truyen hay so ${ind} 12345",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.grey[800]),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
