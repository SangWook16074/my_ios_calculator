import 'package:get/get.dart';

// 생성일 : 2023년 02월 05일 오후 09:52
// 작성자 : 한상욱
// 최종수정일 : 2023년 02월 14일 오전 11:57
// 최종수정자 : 한상욱

// 계산함수로직을 분리하기위한 CalculatorController 클래스임.

// 메소드를 이용해서 계산을 진행함.

class CalculatorController extends GetxController {
  var _currentValue = ''.obs; // UI에서 결과로 보여주는 값.
  var _plusClicked = false.obs; // + 버튼 애니메이션 컨트롤러
  var _minusClicked = false.obs; // - 버튼 애니메이션 컨트롤러
  var _multiplyClicked = false.obs; // * 버튼 애니메이션 컨트롤러
  var _divideClicked = false.obs; // / 버튼 애니메이션 컨트롤러

  RxString get displayNumber => _currentValue;

  RxBool get plusClicked => _plusClicked;
  RxBool get minusClicked => _minusClicked;
  RxBool get multiplyClicked => _multiplyClicked;
  RxBool get divideClicked => _divideClicked;

  // + 버튼 애니메이션 효과
  pushPlus() {
    initClick();
    plusToggle();
  }

  void initClick() {
    _plusClicked.value = false;
    _minusClicked.value = false;
    _multiplyClicked.value = false;
    _divideClicked.value = false;
  }

  void plusToggle() {
    _plusClicked.value = true;
  }

  void calculateBtnInit() {
    plusInit();
  }

  void plusInit() {
    _plusClicked.value = false;
  }

  void reverse() {}

  void allClear() {
    calculateBtnInit();

    _currentValue.value = '';
  }

  void pushDotBtn() {
    if (_currentValue.value.contains('.')) {
      return;
    }

    if (_currentValue.value == '') {
      _currentValue.value += '0.';
      return;
    }

    _currentValue.value += '.';
  }

  void pushNumberBtn(String number) {
    // 숫자 버튼이 눌리면 기호 버튼의 애니메이션은 종료됨.
    calculateBtnInit();
    if (_currentValue.value == '') {
      _currentValue.value = number;
      return;
    }

    _currentValue.value += number;
  }

  plus() {}

  calculate() {}

  // 백분율 버튼

  num convertToInt(double number) {
    if (number % 1 == 0) {
      return number.toInt();
    } else {
      return number;
    }
  }

  changeToPercent() {
    if (_currentValue.value == '') {
      _currentValue.value = '0';
    }
    var tmp = (num.parse(_currentValue.value) / 100);
    _currentValue.value = convertToInt(tmp).toString();
  }

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
}
