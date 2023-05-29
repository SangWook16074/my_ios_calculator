import 'package:get/get.dart';

// 생성일 : 2023년 02월 05일 오후 09:52
// 작성자 : 한상욱
// 최종수정일 : 2023년 05월 06일 오전 11:57
// 최종수정자 : 한상욱

// 계산함수로직을 분리하기위한 CalculatorController 클래스임.

// 메소드를 이용해서 계산을 진행함.

enum Calculate { PLUS, MINUS, MULTIPLY, DIVIDE, NONE }

class CalculatorController extends GetxController {
  RxString _result = '0'.obs;
  num num1 = 0;
  num num2 = 0;
  Calculate status = Calculate.NONE;

  bool pushCalculateBtn = false;
  RxBool _initStatus = true.obs;
  RxBool _pushPlus = false.obs;
  RxBool _pushMinus = false.obs;
  RxBool _pushMultiply = false.obs;
  RxBool _pushDivide = false.obs;

  String get result => _result.value;
  bool get init => _initStatus.value;
  bool get plus => _pushPlus.value;
  bool get minus => _pushMinus.value;
  bool get multiply => _pushMultiply.value;
  bool get divide => _pushDivide.value;

  void allClear() {
    initPushCalculateStatus();
    initResultNumber();
    num1 = 0;
    num2 = 0;
    status = Calculate.NONE;
  }

  void initResultNumber() {
    _result.value = '0';
  }

  void initPushCalculateStatus() {
    _pushPlus(false);
    _pushMinus(false);
    _pushMultiply(false);
    _pushDivide(false);
  }

  void pushNumberBtn(String value) {
    if (pushCalculateBtn) {
      initResultNumber();
      initPushCalculateStatus();
      pushCalculateBtn = false;
    }

    if (_result.value[0] == '0' && _result.value.length == 1) {
      _result('');
    }
    _result.value += value;
  }

  void pushCalculateBtnProgress(Calculate type) {
    if (num1 != 0) {
      switch (status) {
        case Calculate.PLUS:
          num1 += num.parse(_result.value);
          break;
        case Calculate.MINUS:
          num1 -= num.parse(_result.value);
          break;
        case Calculate.MULTIPLY:
          num1 *= num.parse(_result.value);
          break;
        case Calculate.DIVIDE:
          num1 /= num.parse(_result.value);

          break;
        default:
          break;
      }
      _result(num1.toString());
    } else {
      num1 = num.parse(_result.value);
    }
    initPushCalculateStatus();

    switch (type) {
      case Calculate.PLUS:
        _pushPlus(true);
        break;
      case Calculate.MINUS:
        _pushMinus(true);
        break;
      case Calculate.MULTIPLY:
        _pushMultiply(true);
        break;
      case Calculate.DIVIDE:
        _pushDivide(true);
        break;
      case Calculate.NONE:
        break;
    }
    pushCalculateBtn = true;
  }

  void pushPlusBtn() {
    status = Calculate.PLUS;
    pushCalculateBtnProgress(status);
    print(status);
    print(_pushPlus);
  }

  void pushMinusBtn() {
    status = Calculate.MINUS;
    pushCalculateBtnProgress(status);
    print(status);
    print(_pushMinus);
  }

  void pushMultiplyBtn() {
    status = Calculate.MULTIPLY;
    pushCalculateBtnProgress(status);
    print(status);
    print(_pushMultiply);
  }

  void pushDivideBtn() {
    status = Calculate.DIVIDE;
    pushCalculateBtnProgress(status);
  }

  void pushDotBtn() {
    if (_result.value.contains('.')) {
      return;
    }
    _result.value += '.';
  }

  void changeToPercent() {
    _result((num.parse(_result.value) / 100).toString());
  }

  doubleToInt(double d) {
    if (d != d.round()) {
      return d;
    }
    return d.toInt();
  }

  void calculate() {
    num2 = num.parse(_result.value);
    initPushCalculateStatus();
    switch (status) {
      case Calculate.PLUS:
        _result(doubleToInt((num1 + num2).toDouble()).toString());
        break;
      case Calculate.MINUS:
        _result(doubleToInt((num1 - num2).toDouble()).toString());

        break;
      case Calculate.MULTIPLY:
        _result(doubleToInt((num1 * num2).toDouble()).toString());

        break;
      case Calculate.DIVIDE:
        if (num2 == 0) {
          _result.value = '오류';
          return;
        }
        _result(doubleToInt((num1 / num2).toDouble()).toString());

        break;
      case Calculate.NONE:
        break;
    }
    print(_result.value);
  }

  void convert() {
    _result((num.parse(_result.value) * -1).toString());
  }
}
