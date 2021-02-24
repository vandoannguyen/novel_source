import 'package:flutter/material.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/common/images.dart';
import 'package:init_app/data/network/NovelModelHotest.dart';

import '../common/constant.dart';

Widget itemBookHor({NovelModelHotest item, index, func}) {
  return GestureDetector(
    onTap: func,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(Constant.colorTxtDefault).withOpacity(0.5),
            width: 0.3,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                  color: Color(Constant.colorTxtDefault).withOpacity(0.5),
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
                image: item.bpic,
                fit: BoxFit.cover,
                width: 80.0,
                height: 100.0,
              ),
              // child: Image.network(
              //   "https://www.gettyimages.com/gi-resources/images/500px/983794168.jpg",
              //   fit: BoxFit.cover,
              //   width: 80.0,
              //   height: 100.0,
              // ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("${item.name}",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                  Container(
                    padding: EdgeInsets.only(top: 8.0, bottom: 5.0),
                    child: Text("${item.desc}",
                        style: TextStyle(
                          fontSize: 13.0,
                          color: Color(Constant.colorTxtDefault),
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${item.writerName}",
                          style: TextStyle(
                              color: Color(Constant.colorTxtPrimary),
                              fontSize: 13.0),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Text(
                                "${item.updateSection}",
                                style: TextStyle(
                                    color: Color(0xFF9c9c9c), fontSize: 12.0),
                              ),
                              Image.asset(
                                Common.pathImg + "ic_coin.png",
                                width: 15.0,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
