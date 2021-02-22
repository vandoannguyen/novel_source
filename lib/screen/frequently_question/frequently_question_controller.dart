import 'package:get/get.dart';
import 'package:init_app/base/base_controller.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/screen/tutorial_buy_coin/tutorial_buy_coin_screen.dart';

class FrequentlyQuestionController extends BaseController {
  List<Map<String, dynamic>> questions = [
    {
      "question": "Tôi không biết cách nạp xu phải làm sao?",
      "answer": [
        "a, Phương thước thanh toán trên Google play( google pay có thể sử dụng thẻ tín dụng, thẻ ghi nợ) \nBấm vào lik này sẽ hướng dẫn bạn",
        "b, Phương thức thanh toán trên goole play bằng vettel  \nBấm vào link này sẽ hướng dẫn dạn}"
      ]
    },
    {
      "question": "Làm sao để nhận được nhiều xu hơn?",
      "answer":
          "a, Qua các phương thức thanh toán nạp xu để có thêm xu. \nb, Bấm vào đây làm nhiệm vụ nhận thêm xu."
    },
    {
      "question":
          "Bạn tôi đăng nhập thành công rồi, tại sao còn không được cộng xu?",
      "answer":
          "Mời bạn bè đăng nhập thành công mà tài khoản còn không nhận được xu mời kiểm tra các vấn đề sau: \na, Có phải là một số điện thoại chỉ mời được một lần?\nb, Kiểm tra xem bạn bè có phải thông qua link bạn chia sẻ để cài đặt ứng dựng, nếu như tự tải xuống từ appstore và Ch play thì không được tính mời thành công. \nMời bạn bè kiểm tra xem bạn của bạn có nhập vào ID của người mời khi họ đăng nhập ứng dụng không, nếu không thì không được tính mời thành công.\nd, Mời kiểm tra lại Lịch sử giao dịch của bạn có phải đã sử dụng xu để giải khóa chương truyện rồi hay không."
    },
    {
      "question": "Tôi đã thanh toán tại sao xu còn chưa được cộng vào?",
      "answer":
          "Do lỗi mạng, Xu của bạn có thể chưa kịp được cộng vào. Bạn có thể đợi một lúc hoặc thoát tài khoản app và đăng nhập lại. Nếu như vậy còn chưa được cộng xu liên hệ ngay với FB ${Common.fanpageName} để kịp thời trợ giúp bà giải quyết."
    },
    {
      "question": "Tiểu thuyết/truyện tranh khi nào ra chương mới?",
      "answer": "Thứ 2 đến thứ 6 hằng tuần, mỗi ngày đều ra chương mới"
    },
  ];

  FrequentlyQuestionController();

  onInit() {}

  void goTutorial() {
    Get.to(TutorialBuyCoinScreen());
  }
}
