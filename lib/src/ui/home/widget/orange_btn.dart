// 2023 - 02 - 01 오전 01:31 작성자 : 한상욱
// 사측연산을 하는 오렌지색 버튼 클래스

import 'package:flutter/material.dart';
import 'package:flutter_ios_calculator/src/ui/home/widget/back_ground_btn.dart';
import 'package:flutter_ios_calculator/src/ui/home/widget/basic_btn.dart';
import 'package:flutter_ios_calculator/src/ui/home/widget/btn_color.dart';

class OrangeBtn extends StatelessWidget {
  final Icon icon;
  const OrangeBtn({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackGroundBtn(),
        BasicBtn(color: BtnColor.orange, child: icon),
      ],
    );
  }
}
