import 'package:init_app/base/base_controller.dart';
import 'package:init_app/data/repository.dart';

class MissionWidgetController extends BaseController {
  List<Map<String, dynamic>> missions = [
    {
      "datetime": "12-02-2020",
      "answer": [
        {
          "mission" : "Diem danh hang ngay ",
          "coin": 30,
        },
        {
          "mission" : "Xem quang cao nhan thuong ",
          "coin": 50,
        }
      ],
    },
    {
      "datetime": "13-02-2020",
      "answer": [
        {
          "mission" : "Diem danh hang ngay ",
          "coin": 30,
        },
        {
          "mission" : "Xem quang cao nhan thuong ",
          "coin": 50,
        }
      ],
    },
    {
      "datetime": "14-02-2020",
      "answer": [
        {
          "mission" : "Diem danh hang ngay ",
          "coin": 30,
        },
        {
          "mission" : "Xem quang cao nhan thuong ",
          "coin": 50,
        }
      ],
    },
    {
      "datetime": "15-02-2020",
      "answer": [
        {
          "mission" : "Diem danh hang ngay ",
          "coin": 30,
        },
        {
          "mission" : "Xem quang cao nhan thuong ",
          "coin": 50,
        }
      ],
    },
    {
      "datetime": "16-02-2020",
      "answer": [
        {
          "mission" : "Diem danh hang ngay ",
          "coin": 30,
        },
        {
          "mission" : "Xem quang cao nhan thuong ",
          "coin": 50,
        }
      ],
    },
  ];
  MissionWidgetController();
  onInit() {}
  void getMissionHistory(){
    RepositoryImpl.getInstance().historyBuy(page: 2, limit: 10).then((value) {
      // history = value;
      print("mission_history ${value}");
      // update();
    }).catchError((err) {
      // history = null;
      // update();
    });
  }
}
