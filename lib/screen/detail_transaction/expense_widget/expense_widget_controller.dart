import 'package:init_app/base/base_controller.dart';
import 'package:init_app/data/repository.dart';

class ExpenseWidgetController extends BaseController {
  List<Map<String, dynamic>> expenses = [
    {
      "datetime": "12-02-2020",
      "answer": [
        {
          "expense" : "Tru phi doc truyen",
          "coin": 30,
        },
        {
          "expense" : "Tru phi thuong  ",
          "coin": 50,
        }
      ],
    },
    {
      "datetime": "13-02-2020",
      "answer": [
        {
          "expense" : "Tru phi doc truyen ",
          "coin": 30,
        },
        {
          "expense" : "Tru phi thuong  ",
          "coin": 50,
        }
      ],
    },
    {
      "datetime": "14-02-2020",
      "answer": [
        {
          "expense" : "Tru phi doc truyen ",
          "coin": 30,
        },
        {
          "expense" : "Tru phi thuong  ",
          "coin": 50,
        }
      ],
    },
    {
      "datetime": "15-02-2020",
      "answer": [
        {
          "expense" : "Tru phi doc truyen ",
          "coin": 30,
        },
        {
          "expense" : "Tru phi thuong  ",
          "coin": 50,
        }
      ],
    },
    {
      "datetime": "16-02-2020",
      "answer": [
        {
          "expense" : "Tru phi doc truyen ",
          "coin": 30,
        },
        {
          "expense" : "Tru phi thuong  ",
          "coin": 50,
        }
      ],
    }
  ];
  ExpenseWidgetController();
  onInit() {}
  void getExpenseHistory(){
    RepositoryImpl.getInstance().historyBuy(page: 1, limit: 10).then((value) {
      // history = value;
      print("expenses_history ${value["result"]}");
      // update();
    }).catchError((err) {
      // history = null;
      // update();
    });
  }
}
