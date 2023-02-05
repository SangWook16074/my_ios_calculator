import 'package:get/get.dart';

// 생성일 : 2023년 02월 05일 오후 10:52
// 작성자 : 한상욱
// 최종 수정일 : 2023년 02월 05일 오후 10:52
// 최종 수정자 : 한상욱

class ButtonController extends GetxController {
  var _isClicked = false;
  get isClicked => _isClicked;

  toggle() {
    _isClicked = !_isClicked;
    update();
  }
}
