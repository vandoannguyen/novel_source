import 'package:get/get.dart';
import 'package:init_app/base/base_controller.dart';

class ExpenseWidgetController extends BaseController {
  List<Map<String, dynamic>> expenses = [
    {
      "datetime": "12-02-2020",
      "answer": [
        {
          "expense" : "Tru phi doc truyen",
          "coin": "30",
        },
        {
          "expense" : "Tru phi thuong  ",
          "coin": "50",
        }
      ],
    },
    {
      "datetime": "13-02-2020",
      "answer": [
        {
          "expense" : "Tru phi doc truyen ",
          "coin": "30",
        },
        {
          "expense" : "Tru phi thuong  ",
          "coin": "50",
        }
      ],
    },
    {
      "datetime": "14-02-2020",
      "answer": [
        {
          "expense" : "Tru phi doc truyen ",
          "coin": "30",
        },
        {
          "expense" : "Tru phi thuong  ",
          "coin": "50",
        }
      ],
    },
    {
      "datetime": "15-02-2020",
      "answer": [
        {
          "expense" : "Tru phi doc truyen ",
          "coin": "30",
        },
        {
          "expense" : "Tru phi thuong  ",
          "coin": "50",
        }
      ],
    }
  ];

  ExpenseWidgetController();

  onInit() {}

}
