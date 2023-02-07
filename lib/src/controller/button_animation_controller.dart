import 'package:get/get.dart';

// 생성일 : 2023년 02월 05일 오후 10:52
// 작성자 : 한상욱
// 최종 수정일 : 2023년 02월 08일 오전 12:37
// 최종 수정자 : 한상욱

// 사측연산 버튼의 오파시티 애니메이션 효과를 위한 컨트롤러

class ButtonAnimationController extends GetxController {
  bool _isClicked = false;
  bool get isClicked => _isClicked;

  toggle() {
    _isClicked = !_isClicked;
    update();
  }
}
