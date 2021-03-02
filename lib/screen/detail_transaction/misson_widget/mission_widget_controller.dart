import 'package:get/get.dart';
import 'package:init_app/base/base_controller.dart';

class MissionWidgetController extends BaseController {
  List<Map<String, dynamic>> missions = [
    {
      "datetime": "12-02-2020",
      "answer": [
        {
          "mission" : "Diem danh hang ngay ",
          "coin": "30",
        },
        {
          "mission" : "Xem quang cao nhan thuong ",
          "coin": "50",
        }
      ],
    },
    {
      "datetime": "13-02-2020",
      "answer": [
        {
          "mission" : "Diem danh hang ngay ",
          "coin": "30",
        },
        {
          "mission" : "Xem quang cao nhan thuong ",
          "coin": "50",
        }
      ],
    },
    {
      "datetime": "14-02-2020",
      "answer": [
        {
          "mission" : "Diem danh hang ngay ",
          "coin": "30",
        },
        {
          "mission" : "Xem quang cao nhan thuong ",
          "coin": "50",
        }
      ],
    },
    {
      "datetime": "15-02-2020",
      "answer": [
        {
          "mission" : "Diem danh hang ngay ",
          "coin": "30",
        },
        {
          "mission" : "Xem quang cao nhan thuong ",
          "coin": "50",
        }
      ],
    },
  ];

  MissionWidgetController();

  onInit() {}

}
