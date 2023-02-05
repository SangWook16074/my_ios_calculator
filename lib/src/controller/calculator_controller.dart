import 'package:get/get.dart';

// 생성일 : 2023년 02월 05일 오후 09:52
// 작성자 : 한상욱
// 최종수정일 :
// 최종수정자 : 한상욱

// 계산함수로직을 분리하기위한 CalculatorController 클래스임.

// 메소드를 이용해서 계산을 진행함.

class CalculatorController extends GetxController {
  var _firstNumber = 0;
  var _secondNumber = 0;
  var _result = 0;
  get result => _result;
  get firstNumber => _firstNumber;
  get secondNumber => _secondNumber;

  plus() {
    _result = _firstNumber + _secondNumber;
    return _result;
  }

  minus() {}

  multiply() {}

  divide() {}
}
