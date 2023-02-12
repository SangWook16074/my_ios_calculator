// 작성일 : 2023년 02월 01일 오전 1:14
// 작성자 : 한상욱
// 최종 수정일 : 2023년 02월 12일 오후 11:34
// 최종 수정자 : 한상욱

// 최근 수정 내용 : 기존의 버튼을 제외하고 0을 위한 버튼을 구현하기 위해서
// 새로운 enum 클래스 BtnShape를 생성해서 switch case를 이용해 특정 상황일 경우
// flatButton이 등장하게 코드 수정

// 기본 버튼 클래스
// 모든 버튼들의 기본이 되는 틀 역할
// 중복되는 소스를 방지하면서 클린 아키텍처를 도와줌.
import 'package:flutter/cupertino.dart';
import 'package:flutter_ios_calculator/src/ui/home/widget/btn_size.dart';

enum BtnShape { CIRCLE, FLAT }

class BasicBtn extends StatelessWidget {
  final BtnShape? shape;
  final Color color;
  final Widget child;
  final Function() onPressed;
  const BasicBtn(
      {super.key,
      required this.child,
      required this.color,
      this.shape = BtnShape.CIRCLE,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    switch (shape) {
      case BtnShape.CIRCLE:
        return _btn(BtnSize.btnRound, BtnSize.btnRound);
      case BtnShape.FLAT:
        return _btn(BtnSize.btnRound, BtnSize.btnFlatWidth);
      default:
        return Container();
    }
  }

  // 기존의 body는 높이와 너비를 요구하는 위젯 클래스로 재생성
  Widget _btn(double height, double width) {
    return SizedBox(
      width: width,
      height: height,
      child: CupertinoButton(
        color: color,
        padding: const EdgeInsets.all(8.0),
        borderRadius: BorderRadius.circular(100),
        child: child,
        onPressed: onPressed,
      ),
    );
  }
}
