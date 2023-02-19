import 'package:get/get.dart';

// 생성일 : 2023년 02월 05일 오후 09:52
// 작성자 : 한상욱
// 최종수정일 : 2023년 02월 14일 오전 11:57
// 최종수정자 : 한상욱

// 계산함수로직을 분리하기위한 CalculatorController 클래스임.

// 메소드를 이용해서 계산을 진행함.

class CalculatorController extends GetxController {
  var _displayNumber = ''.obs; // UI에서 결과로 보여주는 값.
  var _result = 0.0.obs; // num1 과 num2 의 계산결과를 저장하는 값.
  var _plusClicked = false.obs; // + 버튼 애니메이션 컨트롤러
  var _minusClicked = false.obs; // - 버튼 애니메이션 컨트롤러
  var _multiplyClicked = false.obs; // * 버튼 애니메이션 컨트롤러
  var _divideClicked = false.obs; // / 버튼 애니메이션 컨트롤러

  var _lastNumber = '0';
  var _currentNumber = '';

  var _isDot = false;
  var _isBtnClick = false; // 계산기가 num1인지 num2인지 구분하는 척도
  var _currentStatus = '';

  RxString get displayNumber => _displayNumber;
  RxDouble get result => _result;

  RxBool get plusClicked => _plusClicked;
  RxBool get minusClicked => _minusClicked;
  RxBool get multiplyClicked => _multiplyClicked;
  RxBool get divideClicked => _divideClicked;

  currentStatus(String status) {
    switch (status) {
      case '+':
        _currentStatus = '+';
        break;
      case '-':
        _currentStatus = '-';
        break;
      case '*':
        _currentStatus = '*';
        break;
      case '/':
        _currentStatus = '/';
        break;
      default:
        _currentStatus = '';
    }

    print(_currentStatus);
  }

  // + 버튼 애니메이션 효과
  pushPlus() {
    plusToggle();

    if (_currentNumber != '') {
      currentStatus('+');
      calculate();
      _lastNumber = _currentNumber;
      _currentNumber = '';
      _isDot = false;
      return;
    }

    if (_plusClicked.value) {
      currentStatus('+');
      _lastNumber = _currentNumber;
      _currentNumber = '';
      _isDot = false;
      return;
    }

    currentStatus('');

    _lastNumber = _currentNumber;
    _currentNumber = '';
    _isDot = false;
  }

  void plusToggle() {
    _isBtnClick = !_isBtnClick;
    _plusClicked.value = !_plusClicked.value;

    print('작동 !');
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
    _isDot = false;
    _displayNumber.value = '';
    _lastNumber = '0';
    _currentNumber = '';
  }

  pushDotBtn() {
    if (_isDot == true) {
      return;
    }

    if (_currentNumber == '') {
      _currentNumber += '0.';
      _displayNumber.value = _currentNumber;
      return;
    }

    _currentNumber += '.';
    _displayNumber.value = _currentNumber;

    print('$_lastNumber, $_currentNumber');
  }

  void pushNumberBtn(String number) {
    // 숫자 버튼이 눌리면 기호 버튼의 애니메이션은 종료됨.
    calculateBtnInit();

    _currentNumber += number;
    _displayNumber.value = _currentNumber;

    print('$_lastNumber, $_currentNumber');
  }

  plus() {
    _result.value = double.parse(_lastNumber) + double.parse(_currentNumber);
    if (_result.value % 1 == 0) {
      _displayNumber.value = _result.value.toInt().toString();

      return;
    }
    _displayNumber.value = _result.value.toString();
  }

  calculate() {
    if (_currentStatus == '+') {
      plus();
      return;
    }

    if (_currentStatus == '') return;

    _lastNumber = _result.value.toString();
    print("$_lastNumber, $_currentNumber");
    print(_result.value);
  }

  // 백분율 버튼

  changeToPercent() {
    var tmp = (double.parse(_displayNumber.value) / 100);
    if (tmp % 1 == 0) {
      _displayNumber.value = tmp.toInt().toString();
      return;
    }
    print(tmp);
    _displayNumber.value = tmp.toString();
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
