
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:init_app/base/base_controller.dart';
import 'package:init_app/screen/bookstore/detail_comic/detail_comic_bookstore.dart';

class ComicBookstoreController extends BaseController{
  ComicBookstoreController();
    void clickItem(index, item) {
    // print("object  $index");
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DetailComicBook()));
  }
}