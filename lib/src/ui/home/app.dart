import 'package:flutter/material.dart';
import 'package:flutter_ios_calculator/src/controller/calculator_controller.dart';
import 'package:flutter_ios_calculator/src/ui/home/widget/black_btn.dart';
import 'package:flutter_ios_calculator/src/ui/home/widget/grey_botton.dart';
import 'package:flutter_ios_calculator/src/ui/home/widget/icon_data.dart';
import 'package:flutter_ios_calculator/src/ui/home/widget/orange_btn.dart';
import 'package:get/get.dart';

import 'widget/equal_btn.dart';

// 작성일 : 2023년 01월 29일 오전 12:00
// 작성자 : 한상욱
// 최종 수정일 : 2023년 02월 08일 오전 01:30
// 최종 수정자 : 한상욱

// 앱 화면 UI 클래스

class App extends GetView<CalculatorController> {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          _result(),
          _buttons(),
        ],
      ),
    );
  }

  Widget _buttons() {
    return Column(
      children: [
        _buttonsRow1(),
        _buttonsRow2(),
        _buttonsRow3(),
        _buttonsRow4(),
        _buttonsRow5(),
      ],
    );
  }

  // 계산기 화면을 나타내는 위젯
  Widget _result() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: Get.size.height / 3,
        alignment: Alignment.bottomRight,
        child: GetBuilder<CalculatorController>(builder: (_) {
          return Text(
            _.result.toString(),
            style: TextStyle(
                color: Colors.white, fontSize: 80, fontWeight: FontWeight.w200),
          );
        }),
      ),
    );
  }

  // 버튼 첫번째 줄
  Widget _buttonsRow1() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          greyBtn(
            type: GreyBtnType.ALLCLEAR,
          ),
          greyBtn(type: GreyBtnType.PLUSNMINUS),
          greyBtn(type: GreyBtnType.PERCENT),
          OrangeBtn(
            iconFront: BtnIconType.divide,
            iconBack: BtnIconType.divideReverse,
            btnkey: BtnKey.DIVIDE,
          ),
        ],
      ),
    );
  }

  // 버튼 두번째 줄
  Widget _buttonsRow2() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlackBtn(type: BlackBtnType.SEVEN),
          BlackBtn(type: BlackBtnType.EIGHT),
          BlackBtn(type: BlackBtnType.NINE),
          OrangeBtn(
            iconFront: BtnIconType.multiply,
            iconBack: BtnIconType.multplyReverse,
            btnkey: BtnKey.MULTIPLY,
          ),
        ],
      ),
    );
  }

  // 버튼 세번째 줄
  Widget _buttonsRow3() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlackBtn(type: BlackBtnType.FOUR),
          BlackBtn(type: BlackBtnType.FIVE),
          BlackBtn(type: BlackBtnType.SIX),
          OrangeBtn(
            iconFront: BtnIconType.minus,
            iconBack: BtnIconType.minusReverse,
            btnkey: BtnKey.MINUS,
          ),
        ],
      ),
    );
  }

  // 버튼 네번째 줄
  Widget _buttonsRow4() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlackBtn(type: BlackBtnType.ONE),
          BlackBtn(type: BlackBtnType.TWO),
          BlackBtn(type: BlackBtnType.THREE),
          OrangeBtn(
            iconFront: BtnIconType.plus,
            iconBack: BtnIconType.plusReverse,
            btnkey: BtnKey.PLUS,
          ),
        ],
      ),
    );
    ;
  }

  // 버튼 다섯번째 줄
  Widget _buttonsRow5() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlackBtn(type: BlackBtnType.ZERO),
          BlackBtn(type: BlackBtnType.DOT),
          EqualBtn(),
        ],
      ),
    );
  }
}
