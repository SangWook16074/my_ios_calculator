import 'package:flutter/cupertino.dart';
import 'package:flutter_ios_calculator/src/ui/home/widget/basic_btn.dart';
import 'package:flutter_ios_calculator/src/ui/home/widget/btn_color.dart';
import 'package:flutter_ios_calculator/src/ui/home/widget/icon_data.dart';

// 생성일 : 2023년 01월 31일 오전 01:30
// 작성자 : 한상욱
// 최종 수정일 : 2023년 02월 05일 오후 09:58
// 최종 수정자 : 한상욱

// 회색 버튼 클래스
// enum GreyBtnType을 통해서 버튼의 종류를 확인하여 알맞은
// Widget funtion을 switch case문으로 반환함.

enum GreyBtnType { ALLCLEAR, PLUSNMINUS, PERCENT }

class greyBtn extends StatefulWidget {
  final GreyBtnType type;
  const greyBtn({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  State<greyBtn> createState() => _greyBtnState();
}

class _greyBtnState extends State<greyBtn> {
  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case GreyBtnType.PLUSNMINUS:
        return _buttonETC(BtnIconType.plusAndMinus);
      case GreyBtnType.PERCENT:
        return _buttonETC(BtnIconType.percent);
      case GreyBtnType.ALLCLEAR:
        return _buttonAllClear();
    }
  }

  Widget _buttonAllClear() {
    return BasicBtn(
      color: BtnColor.silver,
      child: Text(
        'AC',
        style: TextStyle(
            fontSize: 30,
            color: CupertinoColors.black,
            fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buttonETC(Icon icon) {
    return BasicBtn(color: BtnColor.silver, child: icon);
  }
}
