import 'package:get/get.dart';

// 생성일 : 2023년 02월 05일 오후 09:52
// 작성자 : 한상욱
// 최종수정일 : 2023년 02월 11일 오후 01:57
// 최종수정자 : 한상욱

// 계산함수로직을 분리하기위한 CalculatorController 클래스임.

// 메소드를 이용해서 계산을 진행함.

class CalculatorController extends GetxController {
  var _firstNumber = '0'.obs;
  var _secondNumber = '0'.obs;
  var _result = ''.obs;
  var _plusClicked = false.obs;
  var _minusClicked = false.obs;
  var _multiplyClicked = false.obs;
  var _divideClicked = false.obs;

  RxString get result => _result;
  RxString get firstNumber => _firstNumber;
  RxString get secondNumber => _secondNumber;

  RxBool get plusClicked => _plusClicked;
  RxBool get minusClicked => _minusClicked;
  RxBool get multiplyClicked => _multiplyClicked;
  RxBool get divideClicked => _divideClicked;

  void init() {
    _plusClicked.value = false;
    _minusClicked.value = false;
    _multiplyClicked.value = false;
    _divideClicked.value = false;
  }

  // + 버튼 애니메이션 효과
  void plusToggle() {
    init();
    _plusClicked.value = !_plusClicked.value;
  }

  // - 버튼 애니메이션 효과
  void minusToggle() {
    init();
    _minusClicked.value = !_minusClicked.value;
  }

  // * 버튼 애니메이션 효과
  void multiplyToggle() {
    init();
    _multiplyClicked.value = !_multiplyClicked.value;
  }

  // / 버튼 애니메이션 효과
  void divideToggle() {
    init();
    _divideClicked.value = !_divideClicked.value;
  }

  pushPlus() {
    plusToggle();
    _firstNumber.value = _result.value;
  }

  allClear() {
    init();
    _result.value = '';
  }

  void pushNumberBtn(String number) {
    // if (_result.value != '' && _firstNumber.value != '') {
    //   _result.value == '';
    // }

    //_result.value += number;
    print('1');
  }

  plus() {
    _result.value = _firstNumber.value + _secondNumber.value;
    return _result;
  }

  minus() {}

  multiply() {}

  divide() {}
}
