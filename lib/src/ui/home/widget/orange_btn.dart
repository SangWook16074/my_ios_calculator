// 생성일 : 2023년 02월 01일 오전 01:31
// 작성자 : 한상욱
// 수정일 : 2023년 02월 05일 오후 10:34
// 수정자 : 한상욱

// 사측연산을 하는 오렌지색 버튼 클래스

import 'package:flutter/material.dart';
import 'package:flutter_ios_calculator/src/ui/home/widget/basic_btn.dart';
import 'package:flutter_ios_calculator/src/ui/home/widget/btn_color.dart';

class OrangeBtn extends StatelessWidget {
  final Icon icon;
  const OrangeBtn({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return BasicBtn(color: BtnColor.orange, child: icon);
  }
}
