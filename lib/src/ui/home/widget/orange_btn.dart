// 생성일 : 2023년 02월 01일 오전 01:31
// 작성자 : 한상욱
// 수정일 : 2023년 02월 08일 오전 01:29
// 수정자 : 한상욱

// 사측연산을 하는 오렌지색 버튼 클래스

import 'package:flutter/cupertino.dart';
import 'package:flutter_ios_calculator/src/controller/button_animation_controller.dart';
import 'package:flutter_ios_calculator/src/ui/home/widget/btn_color.dart';
import 'package:get/get.dart';

enum BtnKey { PLUS, MINUS, MULTIPLY, DIVIDE, EQUAL }

class OrangeBtn extends StatelessWidget {
  final BtnKey btnkey;
  final Icon iconFront;
  final Icon iconBack;
  final double _btnLength = Get.size.width / 4 - 15;
  late bool btnClick;
  OrangeBtn(
      {super.key,
      required this.iconFront,
      required this.iconBack,
      required this.btnkey}) {
    switch (btnkey) {
      case BtnKey.PLUS:
        btnClick = Get.find<ButtonAnimationController>().plusClicked;
        break;
      case BtnKey.MINUS:
        btnClick = Get.find<ButtonAnimationController>().minusClicked;
        break;
      case BtnKey.MULTIPLY:
        btnClick = Get.find<ButtonAnimationController>().multiplyClicked;
        break;
      case BtnKey.DIVIDE:
        btnClick = Get.find<ButtonAnimationController>().divideClicked;
        break;
    }
  }

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
    return GetBuilder<ButtonAnimationController>(
      builder: (_) => SizedBox(
        width: _btnLength,
        height: _btnLength,
        child: CupertinoButton(
          color: BtnColor.white,
          padding: const EdgeInsets.all(8.0),
          borderRadius: BorderRadius.circular(100),
          child: iconBack,
          onPressed: () => Get.find<ButtonAnimationController>().toggle(),
        ),
      ),
    );
  }

  Widget _frontBtn() {
    return GetBuilder<ButtonAnimationController>(
      builder: (_) => AnimatedOpacity(
        opacity: (this.btnkey == false) ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 1000),
        child: SizedBox(
          width: _btnLength,
          height: _btnLength,
          child: CupertinoButton(
            color: BtnColor.orange,
            padding: const EdgeInsets.all(8.0),
            borderRadius: BorderRadius.circular(100),
            child: iconFront,
            onPressed: () => Get.find<ButtonAnimationController>().toggle(),
          ),
        ),
      ),
    );
  }
}
