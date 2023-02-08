// 생성일 : 2023년 02월 01일 오전 01:31
// 작성자 : 한상욱
// 수정일 : 2023년 02월 08일 오후 08:10
// 수정자 : 한상욱

// 사측연산을 하는 오렌지색 버튼 클래스

import 'package:flutter/cupertino.dart';
import 'package:flutter_ios_calculator/src/controller/button_animation_controller.dart';
import 'package:flutter_ios_calculator/src/ui/home/widget/btn_color.dart';
import 'package:flutter_ios_calculator/src/ui/home/widget/btn_size.dart';
import 'package:get/get.dart';

enum BtnKey { PLUS, MINUS, MULTIPLY, DIVIDE }

class OrangeBtn extends StatelessWidget {
  final Icon iconFront;
  final Icon iconBack;
  final BtnKey btnkey;
  final bool isClicked;
  final Function()? onPressed;
  const OrangeBtn({
    super.key,
    required this.iconFront,
    required this.iconBack,
    required this.btnkey,
    required this.isClicked,
    required this.onPressed,
  });

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
    return GetBuilder<ButtonAnimationController>(builder: (_) {
      return SizedBox(
        width: BtnSize.btnRound,
        height: BtnSize.btnRound,
        child: CupertinoButton(
          color: BtnColor.white,
          padding: const EdgeInsets.all(8.0),
          borderRadius: BorderRadius.circular(100),
          onPressed: onPressed,
          child: iconBack,
        ),
      );
    });
  }

  Widget _frontBtn() {
    return GetBuilder<ButtonAnimationController>(builder: (_) {
      return AnimatedOpacity(
        opacity: (isClicked) ? 0.0 : 1.0,
        duration: const Duration(milliseconds: 300),
        child: SizedBox(
          width: BtnSize.btnRound,
          height: BtnSize.btnRound,
          child: CupertinoButton(
            pressedOpacity: null,
            color: BtnColor.orange,
            padding: const EdgeInsets.all(8.0),
            borderRadius: BorderRadius.circular(100),
            child: iconFront,
            onPressed: onPressed,
          ),
        ),
      );
    });
  }
}
