import 'package:get/get.dart';

// 생성일 : 2023년 02월 05일 오후 09:52
// 작성자 : 한상욱
// 최종수정일 : 2023년 02월 14일 오전 11:57
// 최종수정자 : 한상욱

// 계산함수로직을 분리하기위한 CalculatorController 클래스임.

// 메소드를 이용해서 계산을 진행함.

class CalculatorController extends GetxController {
  var _firstNumber = ''.obs; // 계산기의 num1 값.
  var _secondNumber = ''.obs; // 계산기의 num2 값.
  var _displayNumber = ''.obs; // UI에서 결과로 보여주는 값.
  var _result = '0'.obs; // num1 과 num2 의 계산결과를 저장하는 값.
  var _plusClicked = false.obs; // + 버튼 애니메이션 컨트롤러
  var _minusClicked = false.obs; // - 버튼 애니메이션 컨트롤러
  var _multiplyClicked = false.obs; // * 버튼 애니메이션 컨트롤러
  var _divideClicked = false.obs; // / 버튼 애니메이션 컨트롤러

  var _isBtnClick = false; // 계산기가 num1인지 num2인지 구분하는 척도
  var _currentStatus = '';

  RxString get displayNumber => _displayNumber;
  RxString get result => _result;
  RxString get firstNumber => _firstNumber;
  RxString get secondNumber => _secondNumber;

  RxBool get plusClicked => _plusClicked;
  RxBool get minusClicked => _minusClicked;
  RxBool get multiplyClicked => _multiplyClicked;
  RxBool get divideClicked => _divideClicked;

  void initBtn(bool btnStatus) {
    // 버튼 초기화 함수
    if (btnStatus == false) {
      // 이미 초기화가 되어있으면 실행안함.
      return;
    }

    btnStatus = !btnStatus;
  }

  void initAllBtn() {
    initBtn(_plusClicked.value);
    initBtn(_minusClicked.value);
    initBtn(_multiplyClicked.value);
    initBtn(_divideClicked.value);
  }

  // + 버튼 애니메이션 효과
  void pushPlus() {
    plusToggle();
    if (_plusClicked.value == true)
      currentStatus('+');
    else
      currentStatus('');
    // _firstNumber.value = _result.value;
  }

  void plusToggle() {
    initAllBtn();
    _isBtnClick = !_isBtnClick;
    _plusClicked.value = !_plusClicked.value;

    print('작동 !');
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

  void allClear() {
    //initBtn();
    _result.value = '';
    _displayNumber.value = '';
    currentStatus('');
    initAllBtn();
  }

  void pushNumberBtn(String number) {
    // 숫자 버튼이 눌리면 기호 버튼의 애니메이션은 종료됨.

    initAllBtn();

    if (!_isBtnClick) {
      _firstNumber.value += number;
      _displayNumber.value = _firstNumber.value;
      // return;
    } else {
      initAllBtn();
      _secondNumber.value += number;
      _displayNumber.value = _secondNumber.value;
    }

    print('num1 : ${_firstNumber.value}, num2 : ${_secondNumber.value}');

    print('숫자 버튼 클릭 !');
  }

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

  plus() {
    var num1 = int.parse(_firstNumber.value);
    var num2 = int.parse(_secondNumber.value);
    _result.value = (num1 + num2).toString();
    _displayNumber.value = _result.value;
  }

  minus() {}

  multiply() {}

  divide() {}

  calculate() {
    if (_currentStatus == '+') {
      plus();
      return;
    }

    if (_currentStatus == '') return;
  }
}
