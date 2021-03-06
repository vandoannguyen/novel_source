import 'package:flutter/material.dart';
import 'package:init_app/app_localizations.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/screen/bookstore/free_bookstore/free_bookstore_controller.dart';

import '../../../common/constant.dart';

// ignore: must_be_immutable
class FreeBookstoreScreen extends BaseWidget<FreeBookstoreController> {
  static const String routeName = '/FreeBookstore';
  static const String name = 'Books Store';

  void clickItem(item, index) {
    print("fhsdf  $index");
  }

  @override
  Widget build(BuildContext context,
      {FreeBookstoreController controllerSuper}) {
    super.build(context, controllerSuper: FreeBookstoreController());
    return ListView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) {
          return itemBook(index, index, () {
            clickItem(index, index);
          });
        });
  }

  Widget itemBook(item, index, func) {
    return GestureDetector(
      onTap: func,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
        margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 5.0),
        decoration: BoxDecoration(
            border: Border.all(
          color: Color(Constant.colorTxtDefault).withOpacity(0.5),
          width: 0.3,
        )
            // border: Border(
            //   top: BorderSide(
            //     color: Color(Constant.colorTxtDefault).withOpacity(0.5),
            //     width: 0.3,
            //   ),
            // ),
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
                child: Image.network(
                  "https://www.gettyimages.com/gi-resources/images/500px/983794168.jpg",
                  fit: BoxFit.cover,
                  width: 80.0,
                  height: 100.0,
                ),
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
                    Text("name",
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                    Container(
                      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "tacgia",
                            style: TextStyle(
                                color: Color(Constant.colorTxtPrimary),
                                fontSize: 13.0),
                          ),
                           Container(
                                padding:
                                  EdgeInsets.fromLTRB(20.0, 5.0, 10.0, 5.0),
                            decoration: BoxDecoration(
                              image: new DecorationImage(
                                image: new ExactAssetImage(
                                    'assets/images/ic_comic_book.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                     
                              child: Text(
                                  AppLocalizations.of(controller.context)
                                      .translate("novel"),
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis),
                           
                          ),
                         
                        ],
                      ),
                    ),
                    Text(
                        "TS s??? l?? x?? lu??n 1tr cho t???t c??? ???ng vi??n tr??ng tuy???n join trong th??ng 02 n??y lu??n nh?? ????, quy tr??nh ph???ng v???n tinh g???n ch???  01 v??ng ONLINE qua SKYPE thuiii, ng?????i nh?? ITS d??? x????ng l???m, gia nh???p bi???t ?????i d??? x????ng LU??N H??M NAY, APPLY G???I CV ????? C?? C?? H???I NH???N QU?? NH?? C??C DEV",
                        style: TextStyle(
                          fontSize: 13.0,
                          color: Color(Constant.colorTxtDefault),
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
          margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 5.0),
          decoration: BoxDecoration(
              border: Border.all(
            color: Color(Constant.colorTxtDefault).withOpacity(0.5),
            width: 0.3,
          )),
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
                  child: Image.network(
                    "https://www.gettyimages.com/gi-resources/images/500px/983794168.jpg",
                    fit: BoxFit.cover,
                    width: 80.0,
                    height: 100.0,
                  ),
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
                      Text("name",
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                      Container(
                        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "tacgia",
                              style: TextStyle(
                                  color: Color(Constant.colorTxtPrimary),
                                  fontSize: 13.0),
                            ),
                          ],
                        ),
                      ),
                      Text(
                          "TS s??? l?? x?? lu??n 1tr cho t???t c??? ???ng vi??n tr??ng tuy???n join trong th??ng 02 n??y lu??n nh?? ????, quy tr??nh ph???ng v???n tinh g???n ch???  01 v??ng ONLINE qua SKYPE thuiii, ng?????i nh?? ITS d??? x????ng l???m, gia nh???p bi???t ?????i d??? x????ng LU??N H??M NAY, APPLY G???I CV ????? C?? C?? H???I NH???N QU?? NH?? C??C DEV",
                          style: TextStyle(
                            fontSize: 13.0,
                            color: Color(Constant.colorTxtDefault),
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 5.0,
          top: 40.0,
          child: Image.asset(
            Common.pathImg + "ic_comic_book.png",
            height: 25.0,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
