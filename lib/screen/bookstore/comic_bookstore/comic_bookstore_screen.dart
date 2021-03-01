import 'package:flutter/material.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/screen/bookstore/comic_bookstore/comic_bookstore_controller.dart';
import 'package:init_app/widgets/item_book_hor.dart';

class ComicBookstoreScreen extends BaseWidget<ComicBookstoreController>{
  static const String routeName = '/ComicBookstore';
  static const String name = 'Books Store';
  Widget build(BuildContext context, {controllerSuper}) {
    super.build(context, controllerSuper: ComicBookstoreController());
    return ListView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) {
          return itemBookHor(
              item: null,
              index: index,
              func: () {
                controller.clickItem(index, index);
              });
        });
}

// class ComicBookstoreScreen extends StatefulWidget {
//   static const String routeName = '/ComicBookstore';
//   static const String name = 'Books Store';
//
//   ComicBookstoreScreen({Key key}) : super(key: key);
//
//   @override
//   _ComicBookstoreState createState() => _ComicBookstoreState();
// }
//
// class _ComicBookstoreState extends State<ComicBookstoreScreen> {
//   void clickItem(index, item) {
//     // print("object  $index");
//     Navigator.push(
//         context, MaterialPageRoute(builder: (context) => DetailComicBook()));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         physics: AlwaysScrollableScrollPhysics(),
//         shrinkWrap: true,
//         itemCount: 15,
//         itemBuilder: (BuildContext context, int index) {
//           return itemBookHor(
//               item: null,
//               index: index,
//               func: () {
//                 clickItem(index, index);
//               });
//         });
//   }
 }
