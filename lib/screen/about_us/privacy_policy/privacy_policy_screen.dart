// import 'dart:io';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/app_localizations.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/screen/about_us/privacy_policy/privacy_policy_controller.dart';
import 'package:init_app/widgets/appbar_second.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPolicyScreen extends BaseWidget<PrivacyPolicyController> {
  static const String routeName = '/privacy-policy';
  static const String name = 'privacy policy';
  final key = UniqueKey();
  // if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();

  @override
  Widget build(BuildContext context, {controllerSuper}) {
    super.build(context, controllerSuper: PrivacyPolicyController());
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            appbarSecond(AppLocalizations.of(context).translate(name)),
            Expanded(
              child: GetBuilder(builder: (_)=> 
                WebView(
                   key: key ,
                  initialUrl: controller.url,
                  javascriptMode: JavascriptMode.unrestricted,

                  // onWebViewCreated: (WebViewController webViewController) {
                  // },
                  // javascriptChannels: <JavascriptChannel>[

                  // ].toSet(),

                  // onPageFinished: controller.doneLoading,
                  // onPageStarted: controller.startLoading,

                  // gestureNavigationEnabled: true,
                ),
                // Center(
                //   child: CircularProgressIndicator(),
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget policyVi() {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
        alignment: Alignment.center,
        child: Text(
          PrivacyPolicyScreen.name,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
      ),
      Text(
          '${Common.appName} (sau đây còn được gọi là “chúng tôi”) vô cùng chú trọng đến việc bảo vệ thông tin cá nhân của người dùng. Người dùng (sau đây gọi là “bạn”) khi sử dụng sản phẩm và dịch vụ của chúng tôi, sẽ cung cấp hoặc tự động tạo thông tin có liên quan cho nền tảng. Để đảm bảo chắc chắn rằng bạn đã hoàn toàn hiểu rõ cách sử dụng, phương thức bảo vệ thông tin cá nhân, cũng như đưa ra lựa chọn trước khi sử dụng nền tảng ${Common.appName} và các chức năng khác (sau đây gọi tắt là nền tảng ${Common.appName}), hãy đọc kỹ chính sách thông tin cá nhân này. Các điều khoản quan trọng có liên quan đến chính sách thông tin cá nhân này chúng tôi đã viết to, gạch chân để nhắc nhở bạn chú ý. Khi bạn sử dụng nền tảng ${Common.appName} hoặc các chức năng có liên quan, điều này đồng nghĩa với việc bạn đã đồng ý với các nội dung của chính sách thông tin cá nhân này (bao gồm nội dung cập nhật, chỉnh sửa), đồng ý cho chúng tôi thu thập, sử dụng, lưu trữ các thông tin liên quan của bạn theo chính sách thông tin cá nhân này, cũng như hiểu rõ các rủi ro khi sử dụng, chia sẻ thông tin cá nhân của bạn.'),
      Container(
        child: Text(
          "I, MỤC ĐÍCH THU THẬP THÔNG TIN CÁ NHÂN".toUpperCase(),
        ),
      ),
      Text(
          "Thông tin cá nhân là các loại thông tin có thể đứng độc lập hoặc kết hợp với các loại thông tin khác để phân biệt thân phận riêng hoặc phản ánh tình trạng hoạt động đặc biệt của cá nhân đó bằng các ghi chép điện tử hoặc bằng các phương thức khác. Thông tin cá nhân được đề cập đến trong “chính sách thông tin cá nhân” này là những thông tin có liên quan đến bạn mà chúng tôi có thể thu thập, lưu trữ và sử dụng khi bạn sử dụng nền tảng ${Common.appName}. Nếu bạn không cung cấp các thông tin có liên quan, rất có thể bạn sẽ không thể đăng ký để trở thành thành viên của chúng tôi, hoặc không thể sử dụng hết toàn bộ hoặc một phần chức năng của sản phẩm và dịch vụ mà chúng tôi đã cung cấp."),
      Container(
        child: Text(
          "CHÚNG TÔI CÓ LẼ THU THẬP CÁC THÔNG TIN CỦA BẠN TRONG CÁC TRƯỜNG HỢP SAU ĐÂY"
              .toUpperCase(),
        ),
      ),
      Text(
          "1. Các thông tin bên thứ ba tiết lộ cho chúng tôi khi bạn sử dụng tài khoản của bên thứ ba để đăng nhập.\n2. Các thông tin mà bạn đăng tải lên khi sử dụng sản phẩm và dịch vụ của chúng tôi.\n3. Các thông tin mà bạn đưa ra thông qua tư vấn chăm sóc khách hàng hoặc tham gia hoạt động mà chúng tôi tổ chức và các thông tin chúng tôi nhận được khi bạn sử dụng dịch vụ của chúng tôi (ví dụ: thiết bị, phần mềm, địa chỉ IP, vị trí, nhật ký dịch vụ, nhật ký thông tin...)\n4. Các thông tin cá nhân nhạy cảm, gồm có: Thông tin tài sản (bao gồm các tài sản ảo như tài khoản ngân hàng đã liên kết, lịch sử nạp tiền, lịch sử giao dịch, lịch sử mua sách và số dư, phiếu ưu đãi...), thông tin thanh toán (thông tin tài khoản ngân hàng và các công cụ thanh toán khác), thông tin cá nhân (bao gồm chứng minh thư/thẻ căn cước, thẻ sỹ quan, hộ chiếu, giấy phép lái xe, hộ khẩu...), các thông tin nhạy cảm khác (số IMEI trên điện thoại di động, số điện cá nhân, tin nhắn...).\n5. Các thông tin chia sẻ mà bạn chủ động lựa chọn cung cấp cho bên khác thông qua nền tảng ${Common.appName} hoặc các chức năng khác, cũng như các thông tin mà bạn đang lưu trữ.\n6. Toàn bộ các hành vi được lưu trên hệ thống và các thông tin mang tính hệ thống khác khi bạn sử dụng ${Common.appName}, như thời gian đăng nhập, lịch sử đọc... (hay còn được gọi là hệ thống thông tin)."),
      Container(
        child: Text(
          "II, XEM VÀ SỬA ĐỔI THÔNG TIN NGƯỜI DÙNG".toUpperCase(),
        ),
      ),
      Text(
          'Trong quá trình sử dụng dịch vụ của chúng tôi, bạn có thể xem, sửa đổi và xóa thông tin cá nhân mà bạn đã cung cấp (nhưng không thể sửa thông tin hệ thống), hoặc có thể thông báo, chỉ dẫn, liên hệ với chúng tôi trên chuyên mục “hỗ trợ”. Dưới sự giúp đỡ của hệ thống, bạn có thể lựa chọn hiển thị hoặc không hiển thị 1 phần thông tin. Bạn cũng có thể xem phần thông tin cá nhân được hiển thị của những người dùng khác, tuy nhiên nếu không được sự cho phép, bạn không thể tiết lộ hoặc công khai các thông tin có liên quan bằng cách sao chép hoặc bằng các hình thức khác, cũng không thể thay đổi thông tin cá nhân của người khác bằng bất kỳ phương thức nào. Nếu không, bạn hoàn toàn chịu trách nhiệm và hậu quả theo các bộ luật có liên quan, đồng thời chúng tôi có quyền áp dụng các biện pháp cần thiết để giới hạn hành vi của bạn.'),
    ],
  );
}
