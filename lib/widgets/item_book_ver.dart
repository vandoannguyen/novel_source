import 'package:flutter/material.dart';
import 'package:init_app/common/images.dart';
import 'package:init_app/data/network/NovalModel.dart';

import '../common/constant.dart';

class itemBookVer extends StatefulWidget {
  NovalModel item;
  var isManager;
  dynamic func;
  var isSelected = false;

  itemBookVer({NovalModel this.item, this.isManager = false, this.func});

  @override
  _itemBookVerState createState() => _itemBookVerState();
}

class _itemBookVerState extends State<itemBookVer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.isManager) {
          widget.isSelected = !widget.isSelected;
          setState(() {});
          widget.func(widget.isSelected);
        } else {
          widget.func(null);
        }
      },
      child: Stack(
        children: [
          Container(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Color(Constant.colorTxtDefault).withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: FadeInImage.assetNetwork(
                        placeholder: ic_loading,
                        image: widget.item.bpic,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 45.0,
                  alignment: Alignment.center,
                  child: Text(widget.item.name,
                      style: TextStyle(fontSize: 14.0),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis),
                ),
                Text(
                  false ? "Chương 1 đã đọc" : "",
                  style: TextStyle(color: Colors.grey, fontSize: 11.0),
                ),
              ],
            ),
          ),
          widget.isManager
              ? Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: EdgeInsets.only(right: 5, top: 5),
                    width: 30,
                    height: 30,
                    color: Colors.transparent,
                    child: Image.asset(
                        widget.isSelected ? ic_seleted : ic_unselect),
                  ))
              : Container()
        ],
      ),
    );
  }
}

// Widget itemBookVer({NovalModel item, isManager = false, func}) {
//   return
// }

// Widget itemBook(int index) {
//   return Container(
//     child: Column(
//       children: [
//         Expanded(
//           child: Image.network(
//             "https://www.gettyimages.com/gi-resources/images/500px/983794168.jpg",
//             fit: BoxFit.cover,
//           ),
//         ),
//         Container(
//           height: 45.0,
//           alignment: Alignment.center,
//           child: Text("Name Name Name Name Name Name Name Name ",
//               style: TextStyle(fontSize: 14.0),
//               maxLines: 2,
//               textAlign: TextAlign.center,
//               overflow: TextOverflow.ellipsis),
//         ),
//       ],
//     ),
//   );
// }
