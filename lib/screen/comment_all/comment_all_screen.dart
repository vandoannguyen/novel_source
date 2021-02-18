import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/screen/comment_all/comment_all_controller.dart';
import '../../common/constant.dart';

// ignore: must_be_immutable
class CommentAllScreen extends BaseWidget<CommentAllController> {
  static const String routeName = '/comment';
  static const String name = 'Bình luận';
  CommentAllController controller = Get.put(CommentAllController());

  @override
  initState({CommentAllController controller}) {
    print("initState");
    return super.initState(controller: controller);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              // padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      CommentAllScreen.name,
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      padding: EdgeInsets.all(10.0),
                      onPressed: () {
                        controller.callBack("BACK", null);
                      },
                      icon: Icon(Icons.arrow_back_ios_rounded),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) {
                    return itemComment(index: index, item: index);
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemComment({index, item}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Color(Constant.colorTxtDefault).withOpacity(0.5),
            width: 0.3,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuT76Pbzn__cofcl3JjQVjrmcyfNJCpM289Q&usqp=CAU",
              width: 50.0,
              height: 50.0,
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "name",
                        style: TextStyle(
                          color: Color(Constant.colorTxtDefault),
                        ),
                      ),
                    ),
                    RatingBarIndicator(
                      rating: 2.75,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Color(Constant.colorStar),
                      ),
                      unratedColor: Colors.grey[200],
                      itemCount: 5,
                      itemSize: 18.0,
                      direction: Axis.horizontal,
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                      "HAI CÔNG NHÂN LÀM Ở Ổ DỊCH CẨM GIÀNG, VỀ QUÊ ĂN TẾT KHAI BÁO LÀM VIỆC TẠI HÀ NỘ"),
                ),
                Text(
                  "17-02-2021 11:55",
                  style: TextStyle(
                      color: Color(Constant.colorTxtDefault), fontSize: 12.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
