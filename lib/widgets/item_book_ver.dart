import 'package:flutter/material.dart';
import '../common/constant.dart';

Widget itemBookVer({item, index, func}) {
  return GestureDetector(
    onTap: func,
    child: Container(
      child: Column(
        children: [
          Expanded(
            child: Container(
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
                ),
              ),
            ),
          ),
          Container(
            height: 45.0,
            alignment: Alignment.center,
            child: Text("name",
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
  );
}

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
