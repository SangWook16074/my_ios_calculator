// 생성일 : 2023년 02월 02일 오전 01:57
// 작성자 : 한상욱
// 최종 수정일 : 2023년 02월 12일 오후 11:34
// 숫자와 .을 표현하는 검정색 버튼 클래스
// enum 클래스를 통해서 숫자에 따른 모양과 child 프로퍼티 구분

import 'package:flutter/cupertino.dart';

import 'basic_btn.dart';
import '../constants/btn_color.dart';

enum BlackBtnType {
  ONE,
  TWO,
  THREE,
  FOUR,
  FIVE,
  SIX,
  SEVEN,
  EIGHT,
  NINE,
  ZERO,
  DOT
}

class BlackBtn extends StatelessWidget {
  final BlackBtnType type;
  final Function() onPressed;
  const BlackBtn({super.key, required this.type, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case BlackBtnType.ONE:
        return _numberBtn('1');

      case BlackBtnType.TWO:
        return _numberBtn('2');

      case BlackBtnType.THREE:
        return _numberBtn('3');

      case BlackBtnType.FOUR:
        return _numberBtn('4');

      case BlackBtnType.FIVE:
        return _numberBtn('5');

      case BlackBtnType.SIX:
        return _numberBtn('6');

      case BlackBtnType.SEVEN:
        return _numberBtn('7');

      case BlackBtnType.EIGHT:
        return _numberBtn('8');

      case BlackBtnType.NINE:
        return _numberBtn('9');

      case BlackBtnType.ZERO:
        return _zeroBtn('0');

      case BlackBtnType.DOT:
        return _numberBtn('.');
    }
  }

  Widget _numberBtn(String number) {
    return BasicBtn(
      child: _numberText(number),
      color: BtnColor.black,
      onPressed: onPressed,
    );
  }

  Widget _zeroBtn(String number) {
    return BasicBtn(
      color: BtnColor.black,
      child: _numberText(number),
      shape: BtnShape.FLAT,
      onPressed: onPressed,
    );
  }

  Widget _numberText(String number) {
    return Text(
      number,
      style: TextStyle(
        fontSize: 35,
        color: CupertinoColors.white,
      ),
    );
  }
}
