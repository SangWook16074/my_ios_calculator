// 생성일 : 2023년 02월 01일 오전 01:31
// 작성자 : 한상욱
// 수정일 : 2023년 02월 05일 오후 10:34
// 수정자 : 한상욱

// 사측연산을 하는 오렌지색 버튼 클래스

import 'package:flutter/cupertino.dart';
import 'package:flutter_ios_calculator/src/controller/button_controller.dart';
import 'package:flutter_ios_calculator/src/ui/home/widget/btn_color.dart';
import 'package:get/get.dart';

class OrangeBtn extends GetView<ButtonController> {
  final Icon iconFront;
  final Icon iconBack;
  final double _btnLength = Get.size.width / 4 - 15;
  OrangeBtn({super.key, required this.iconFront, required this.iconBack});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _backBtn(),
        _frontBtn(),
      ],
    );
  }

  Widget _backBtn() {
    return SizedBox(
      width: _btnLength,
      height: _btnLength,
      child: CupertinoButton(
        color: BtnColor.white,
        padding: const EdgeInsets.all(8.0),
        borderRadius: BorderRadius.circular(100),
        child: iconBack,
        onPressed: () => controller.isBtnClose(),
      ),
    );
  }

  Widget _frontBtn() {
    return AnimatedOpacity(
      opacity: (controller.isClicked == false) ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 1000),
      child: SizedBox(
        width: _btnLength,
        height: _btnLength,
        child: CupertinoButton(
          color: BtnColor.orange,
          padding: const EdgeInsets.all(8.0),
          borderRadius: BorderRadius.circular(100),
          child: iconFront,
          onPressed: () => controller.isBtnActive(),
        ),
      ),
    );
  }
}
