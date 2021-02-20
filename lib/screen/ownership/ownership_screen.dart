import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/base/base_widget.dart';
import 'package:init_app/common/common.dart';
import 'package:init_app/screen/ownership/ownership_controller.dart';
import 'package:init_app/widgets/appbar_second.dart';

class OwnershipScreen extends BaseWidget<OwnershipController> {
  static const String routeName = '/ownership';
  static const String name = 'Quyền sở hữu';
  OwnershipController controller = Get.put(OwnershipController());
  @override
  initState({OwnershipController controller}) {
    return super.initState(controller: controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            appbarSecond(OwnershipScreen.name),
            Container(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              alignment: Alignment.center,
              child: Text(
                OwnershipScreen.name,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 30.0),
              child: Text(
                  "App ${Common.appName} cung cấp các nội dung bao gồm nhưng không giới hạn: tác phẩm, tóm tắt tác phẩm, hình ảnh, ứng dụng, thiết kế giao diện, bố cục ứng dụng, logo. Tất cả các nội dung trên thuộc quyền sở hữu của công ty và được bảo hộ bởi luật trí tuệ trong nước và các điều ước quốc tế và quyền tác giả.\n\nKhách hàng được sử dụng nội dung theo quy định dưới quyền lợi được trao. Khách hàng chỉ được sử dụng nội dung, không được sửa đổi, sao chép, tái tạo, đăng tải, truyền tải, sáng tạo tác phẩm có nội dung liên quan hay cung cấp hoặc bán lại nội dung cho bên thứ ba dưới mọi hình thức bất kể là phi lợi nhuận hay có lợi nhuận.\n\nNếu phát hiện các hành vi trái với các điều khoản trên, công ty chúng tôi có quyền truy cứu trách nhiệm pháp luật."),
            )
          ],
        ),
      ),
    );
  }
}
