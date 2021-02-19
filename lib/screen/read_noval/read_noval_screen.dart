import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/data/network/NovalModel.dart';
import 'package:init_app/screen/read_noval/read_noval_controller.dart';
import 'package:page_turn/page_turn.dart';

class ReadNovalScreen extends BaseWidget<ReadNovalController> {
  NovalModel item;

  ReadNovalScreen({@required NovalModel this.item});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    initState(controller: ReadNovalController());
    controller.readNoval(this.item.id);
    return Scaffold(
      // body: SafeArea(
      //     child: Container(
      //   padding: EdgeInsets.all(10),
      //   child: CustomScrollView(
      //     slivers: [
      //       SliverToBoxAdapter(
      //         child: GetBuilder(
      //           init: controller,
      //           builder: (_) => Text(
      //             "${_.chap}",
      //             style: TextStyle(fontSize: 18),
      //           ),
      //         ),
      //       ),
      //       SliverToBoxAdapter(
      //           child: Container(
      //         alignment: Alignment.center,
      //         padding: EdgeInsets.all(10),
      //         child: GetBuilder<ReadNovalController>(
      //           init: controller,
      //           builder: (_) => _.read != null
      //               ? Text(
      //                   _.read,
      //                   style: TextStyle(fontSize: 16),
      //                 )
      //               : CircularProgressIndicator(),
      //         ),
      //       ))
      //     ],
      //   ),
      // )),
      body: Container(
        alignment: Alignment.center,
        child: GetBuilder<ReadNovalController>(
          init: controller,
          builder: (_) => _.read == null
              ? CircularProgressIndicator()
              : PageTurn(
                  backgroundColor: Colors.white,
                  lastPage: Container(
                    child: FadeInImage.assetNetwork(
                        placeholder: "assets/images/bg_btn.jpg",
                        image: "${item.bpic}"),
                  ),
                  initialIndex: 0,
                  children: [
                    AlicePage1(),
                    AlicePage1(),
                    AlicePage1(),
                    AlicePage1(),
                    AlicePage1()
                  ]
                  // listPage(_.read))
                  ,
                ),
        ),

        // body: PageTurn(
        //   backgroundColor: Colors.white,
        //   lastPage: Container(
        //     child: FadeInImage.assetNetwork(
        //         placeholder: "assets/images/bg_btn.jpg", image: "${item.bpic}"),
        //   ),
        //   initialIndex: 0,
        //   children: <Widget>[
        //     Container(
        //       child: FadeInImage.assetNetwork(
        //           placeholder: "assets/images/bg_btn.jpg", image: "${item.bpic}"),
        //     ),
        //     Container(
        //       child: FadeInImage.assetNetwork(
        //           placeholder: "assets/images/bg_btn.jpg", image: "${item.bpic}"),
        //     ),
        //     Container(
        //       child: FadeInImage.assetNetwork(
        //           placeholder: "assets/images/bg_btn.jpg", image: "${item.bpic}"),
        //     ),
        //     Container(
        //       color: Colors.amber,
        //       child: FadeInImage.assetNetwork(
        //           placeholder: "assets/images/bg_btn.jpg", image: "${item.bpic}"),
        //     )
        //   ],
      ),
    );
  }

  listPage(String read) {
    List<Widget> list = new List();
    list.add(AlicePage1());
    list.add(AlicePage1());
    list.add(AlicePage1());
    list.add(AlicePage1());
    list.add(AlicePage1());
  }
}

class AlicePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: TextStyle(fontSize: 16.0),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                "So she was considering in her own mind (as well as she could, for the hot day made her "
                "feel very sleepy and stupid), whether the pleasure of making a daisy-chain would be "
                "worth the trouble of getting up and picking the daisies, when suddenly a White "
                "Rabbit with pink eyes ran close by her."
                "\n"
                "There was nothing so very remarkable in that; nor did Alice think it so very much out "
                "of the way to hear the Rabbit say to itself, `Oh dear! Oh dear! I shall be "
                "late!' (when she thought it over afterwards, it occurred to her that she ought to "
                "have wondered at this, but at the time it all seemed quite natural); but when the "
                "Rabbit actually took a watch out of its waistcoat-pocket, and looked at it, and then "
                "hurried on, Alice started to her feet, for it flashed across her mind that she had "
                "never before seen a rabbit with either a waistcoat-pocket, or a watch to take out "
                "of it, and burning with curiosity, she ran across the field after it, and fortunately "
                "was just in time to see it pop down a large rabbit-hole under the hedge."
                "There was nothing so very remarkable in that; nor did Alice think it so very much out "
                "of the way to hear the Rabbit say to itself, `Oh dear! Oh dear! I shall be "
                "late!' (when she thought it over afterwards, it occurred to her that she ought to "
                "have wondered at this, but at the time it all seemed quite natural); but when the "
                "Rabbit actually took a watch out of its waistcoat-pocket, and looked at it, and then "
                "hurried on, Alice started to her feet, for it flashed across her mind that she had "
                "never before seen a rabbit with either a waistcoat-pocket, or a watch to take out "
                "of it, and burning with curiosity, she ran across the field after it, and fortunately "
                "was just in time to see it pop down a large rabbit-hole under the hedge."
                "There was nothing so very remarkable in that; nor did Alice think it so very much out "
                "of the way to hear the Rabbit say to itself, `Oh dear! Oh dear! I shall be "
                "late!' (when she thought it over afterwards, it occurred to her that she ought to "
                "have wondered at this, but at the time it all seemed quite natural); but when the "
                "Rabbit actually took a watch out of its waistcoat-pocket, and looked at it, and then "
                "hurried on, Alice started to her feet, for it flashed across her mind that she had "
                "never before seen a rabbit with either a waistcoat-pocket, or a watch to take out "
                "of it, and burning with curiosity, she ran across the field after it, and fortunately "
                "was just in time to see it pop down a large rabbit-hole under the hedge."
                "There was nothing so very remarkable in that; nor did Alice think it so very much out "
                "of the way to hear the Rabbit say to itself, `Oh dear! Oh dear! I shall be "
                "late!' (when she thought it over afterwards, it occurred to her that she ought to "
                "have wondered at this, but at the time it all seemed quite natural); but when the "
                "Rabbit actually took a watch out of its waistcoat-pocket, and looked at it, and then "
                "hurried on, Alice started to her feet, for it flashed across her mind that she had "
                "never before seen a rabbit with either a waistcoat-pocket, or a watch to take out "
                "of it, and burning with curiosity, she ran across the field after it, and fortunately "
                "was just in time to see it pop down a large rabbit-hole under the hedge.",
              )
            ],
          ),
        ),
      ),
    );
  }
}
