import 'package:flutter/material.dart';
import 'package:init_app/widgets/item_book_hor.dart';

import './detail_comic_bookstore.dart';

class ComicBookstoreScreen extends StatefulWidget {
  static const String routeName = '/ComicBookstore';
  static const String name = 'Books Store';

  ComicBookstoreScreen({Key key}) : super(key: key);

  @override
  _ComicBookstoreState createState() => _ComicBookstoreState();
}

class _ComicBookstoreState extends State<ComicBookstoreScreen> {
  void clickItem(index, item) {
    // print("object  $index");
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DetailComicBook()));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) {
          return itemBookHor(
              item: index,
              index: index,
              func: () {
                clickItem(index, index);
              });
        });
  }
}
