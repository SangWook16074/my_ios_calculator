import 'package:get/get.dart';

// 생성일 : 2023년 02월 05일 오후 09:52
// 작성자 : 한상욱
// 최종수정일 : 2023년 02월 12일 오후 11:57
// 최종수정자 : 한상욱

// 계산함수로직을 분리하기위한 CalculatorController 클래스임.

// 메소드를 이용해서 계산을 진행함.

class CalculatorController extends GetxController {
  var _firstNumber = ''.obs;
  var _secondNumber = ''.obs;
  var _displayNumber = ''.obs;
  var _result = '0'.obs;
  var _plusClicked = false.obs;
  var _minusClicked = false.obs;
  var _multiplyClicked = false.obs;
  var _divideClicked = false.obs;
  var _isFirst = true;

  RxString get displayNumber => _displayNumber;
  RxString get result => _result;
  RxString get firstNumber => _firstNumber;
  RxString get secondNumber => _secondNumber;

  RxBool get plusClicked => _plusClicked;
  RxBool get minusClicked => _minusClicked;
  RxBool get multiplyClicked => _multiplyClicked;
  RxBool get divideClicked => _divideClicked;

  void initBtn(bool btnStatus) {
    if (btnStatus == false) {
      return;
    }

    btnStatus = !btnStatus;
  }

  void initDisplayNumber() {
    _displayNumber.value = 0.toString();
  }

  // + 버튼 애니메이션 효과
  void plusToggle() {
    initBtn(_plusClicked.value);
    _plusClicked.value = !_plusClicked.value;
    print('작동 !');
  }

  // false -> false -> true -> false -> true

  // - 버튼 애니메이션 효과
  void minusToggle() {
    //initBtn();
    _minusClicked.value = !_minusClicked.value;
  }

  // * 버튼 애니메이션 효과
  void multiplyToggle() {
    //initBtn();
    _multiplyClicked.value = !_multiplyClicked.value;
  }

  // / 버튼 애니메이션 효과
  void divideToggle() {
    //initBtn();
    _divideClicked.value = !_divideClicked.value;
  }

  void pushPlus() {
    plusToggle();
    // _firstNumber.value = _result.value;
  }

  allClear() {
    //initBtn();
    _result.value = '';
  }

  void pushNumberBtn(String number) {
    if (_isFirst == true) {
      _firstNumber.value = number;
      _displayNumber.value += number.toString();

      return;
    }

    print('숫자 버튼 클릭 !');
  }

  plus() {
    // _result.value = _firstNumber.value + _secondNumber.value;
    // return _result;
  }

  minus() {}

  multiply() {}

  divide() {}
}
