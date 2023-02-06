import 'package:get/get.dart';

// 생성일 : 2023년 02월 05일 오후 10:52
// 작성자 : 한상욱
// 최종 수정일 : 2023년 02월 07일 오전 02:13
// 최종 수정자 : 한상욱

class ButtonController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var _isClicked = false;
  get isClicked => _isClicked;

  @override
  void onInit() {
    Duration _duration = Duration(milliseconds: 500);
    super.onInit();
  }

  isBtnActive() {
    _isClicked = true;
    update();
  }

  isBtnClose() {
    _isClicked = false;
    update();
  }
}
