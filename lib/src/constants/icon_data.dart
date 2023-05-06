// 생성일 : 2023년 02월 01일 오전 01:24
// 작성자 : 한상욱
// 최종 수정일 : 2023년 02월 05일 오후 10:44
// 최종 수정자 : 한상욱

// 버튼 내부의 아이콘 클래스
// 버튼 내부에서 사용할 아이콘들의 데이터의 프로퍼티까지 관리하는 클래스
// 중복소스 방지용
import 'package:flutter/cupertino.dart';

class BtnIconType {
  static double _iconSize = 35.0;
  static Color _greyBtnColor = CupertinoColors.black;
  static Color _orangeBtnColor = CupertinoColors.white;
  static Color _orangeBtnColorReverse = CupertinoColors.activeOrange;

  static Icon get plusAndMinus => Icon(
        CupertinoIcons.plus_slash_minus,
        size: _iconSize,
        color: _greyBtnColor,
      );

  static Icon get percent => Icon(
        CupertinoIcons.percent,
        size: _iconSize,
        color: _greyBtnColor,
      );
  static Icon get plus => Icon(
        CupertinoIcons.plus,
        size: _iconSize,
        color: _orangeBtnColor,
      );
  static Icon get plusReverse => Icon(
        CupertinoIcons.plus,
        size: _iconSize,
        color: _orangeBtnColorReverse,
      );
  static Icon get minus => Icon(
        CupertinoIcons.minus,
        size: _iconSize,
        color: _orangeBtnColor,
      );
  static Icon get minusReverse => Icon(
        CupertinoIcons.minus,
        size: _iconSize,
        color: _orangeBtnColorReverse,
      );
  static Icon get multiply => Icon(
        CupertinoIcons.multiply,
        size: _iconSize,
        color: _orangeBtnColor,
      );
  static Icon get multplyReverse => Icon(
        CupertinoIcons.multiply,
        size: _iconSize,
        color: _orangeBtnColorReverse,
      );
  static Icon get divide => Icon(
        CupertinoIcons.divide,
        size: _iconSize,
        color: _orangeBtnColor,
      );
  static Icon get divideReverse => Icon(
        CupertinoIcons.divide,
        size: _iconSize,
        color: _orangeBtnColorReverse,
      );
  static Icon get equal => Icon(
        CupertinoIcons.equal,
        size: _iconSize,
        color: _orangeBtnColor,
      );

  static Text get allClear => Text(
        'AC',
        style: TextStyle(fontSize: 30, color: CupertinoColors.black),
      );

  static Text get clear => Text(
        'C',
        style: TextStyle(fontSize: 30, color: CupertinoColors.black),
      );
}
