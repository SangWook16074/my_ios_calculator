import 'package:get/get.dart';

// 생성일 : 2023년 02월 05일 오후 10:52
// 작성자 : 한상욱
// 최종 수정일 : 2023년 02월 08일 오전 12:37
// 최종 수정자 : 한상욱

// 사측연산 버튼의 오파시티 애니메이션 효과를 위한 컨트롤러

class ButtonAnimationController extends GetxController {
  bool _plusClicked = false;
  bool _minusClicked = false;
  bool _multiplyClicked = false;
  bool _divideClicked = false;

  bool get plusClicked => _plusClicked;
  bool get minusClicked => _minusClicked;
  bool get multiplyClicked => _multiplyClicked;
  bool get divideClicked => _divideClicked;

  init() {
    _plusClicked = false;
    _minusClicked = false;
    _multiplyClicked = false;
    _divideClicked = false;
    update();
  }

  plusToggle() {
    init();
    print(_plusClicked);
    _plusClicked = !_plusClicked;
    print(_plusClicked);
    update();
  }

  minusToggle() {
    init();
    _minusClicked = !_minusClicked;
    update();
  }

  multiplyToggle() {
    init();
    _multiplyClicked = !_multiplyClicked;
    update();
  }

  divideToggle() {
    init();
    _divideClicked = !_divideClicked;
    update();
  }
}
