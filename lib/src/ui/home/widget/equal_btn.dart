import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_ios_calculator/src/ui/home/widget/basic_btn.dart';
import 'package:flutter_ios_calculator/src/ui/home/widget/btn_color.dart';
import 'package:flutter_ios_calculator/src/ui/home/widget/icon_data.dart';

//생성일 : 2023년 02월 08일 오후 04:03
//생성자 : 한상욱
//최종 수정일 : Null
//최종 수정자 : Null

class EqualBtn extends StatelessWidget {
  const EqualBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicBtn(child: BtnIconType.equal, color: BtnColor.orange);
  }
}
