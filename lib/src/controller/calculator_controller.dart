import 'package:flutter/src/gestures/drag_details.dart';
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
  }

  void initResultNumber() {
    _result.value = '0';
  }

  void initPushCalculateStatus() {
    _pushPlus.value = false;
    _pushMinus.value = false;
    _pushMultiply.value = false;
    _pushDivide.value = false;
  }

  void pushNumberBtn(String value) {
    if (pushCalculateBtn) {
      initResultNumber();
      initPushCalculateStatus();
      pushCalculateBtn = false;
    }

    if (_result.value[0] == '0' && _result.value.length == 1) {
      _result.value = '';
    }
    _result.value += value;
  }

  void pushCalculateBtnProgress() {
    num1 = num.parse(_result.value);
    initPushCalculateStatus();
    pushCalculateBtn = true;
    _pushPlus.value = true;
  }

  void pushPlusBtn() {
    pushCalculateBtnProgress();
    status = Calculate.PLUS;
  }

  void pushMinusBtn() {
    pushCalculateBtnProgress();
    status = Calculate.MINUS;
  }

  void pushMultiplyBtn() {
    pushCalculateBtnProgress();
    status = Calculate.MULTIPLY;
  }

  void pushDivideBtn() {
    pushCalculateBtnProgress();
    status = Calculate.DIVIDE;
  }

  void pushDotBtn() {
    if (_result.value.contains('.')) {
      return;
    }
    _result.value += '.';
  }

  void changeToPercent() {
    _result.value = (num.parse(_result.value) / 100).toString();
  }

  void calculate() {
    num2 = num.parse(_result.value);
    switch (status) {
      case Calculate.PLUS:
        _result.value = (num1 + num2).toString();
        break;
      case Calculate.MINUS:
        _result.value = (num1 - num2).toString();
        break;
      case Calculate.MULTIPLY:
        _result.value = (num1 * num2).toString();
        break;
      case Calculate.DIVIDE:
        if (num2 == 0) {
          _result.value = '오류';
          return;
        }
        _result.value = (num1 / num2).toString();
        break;
      case Calculate.NONE:
        break;
    }
    print(_result.value);
  }

  void convert() {
    _result.value = (num.parse(_result.value) * -1).toString();
  }

  void remove(DragUpdateDetails details) {
    print('스와이프');
    if (_result.value.length > 1 && _result.value != '0') {
      _result.value = _result.value.substring(0, _result.value.length - 1);
      return;
    }

    if (_result.value.length == 1 && _result.value != '0') {
      initResultNumber();
      return;
    }
  }
}
