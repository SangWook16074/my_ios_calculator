// 2023 - 02 - 01 오전 01:24 작성자 : 한상욱
// 버튼 내부의 아이콘 클래스
// 버튼 내부에서 사용할 아이콘들의 데이터의 프로퍼티까지 관리하는 클래스
// 중복소스 방지용
import 'package:flutter/cupertino.dart';

class BtnIconType {
  static Icon get plusAndMinus => Icon(
        CupertinoIcons.plus_slash_minus,
        size: 35,
        color: CupertinoColors.black,
      );

  static Icon get percent => Icon(
        CupertinoIcons.percent,
        size: 35,
        color: CupertinoColors.black,
      );
  static Icon get plus => Icon(
        CupertinoIcons.plus,
        size: 35,
        color: CupertinoColors.white,
      );
  static Icon get minus => Icon(
        CupertinoIcons.minus,
        size: 35,
        color: CupertinoColors.white,
      );
  static Icon get multiply => Icon(
        CupertinoIcons.multiply,
        size: 35,
        color: CupertinoColors.white,
      );
  static Icon get divide => Icon(
        CupertinoIcons.divide,
        size: 35,
        color: CupertinoColors.white,
      );
  static Icon get equal => Icon(
        CupertinoIcons.plus,
        size: 35,
        color: CupertinoColors.white,
      );
}
