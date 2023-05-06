import 'package:flutter/src/widgets/framework.dart';

import 'basic_btn.dart';
import '../constants/btn_color.dart';
import '../constants/icon_data.dart';

//생성일 : 2023년 02월 08일 오후 04:03
//생성자 : 한상욱
//최종 수정일 : 2023년 02월 12일 오후 11:35
//최종 수정자 : 한상욱

class EqualBtn extends StatelessWidget {
  final Function() onPressed;
  const EqualBtn({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BasicBtn(
      child: BtnIconType.equal,
      color: BtnColor.orange,
      onPressed: onPressed,
    );
  }
}
