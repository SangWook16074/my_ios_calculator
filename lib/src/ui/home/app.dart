import 'package:flutter/material.dart';
import 'package:flutter_ios_calculator/src/controller/calculator_controller.dart';
import 'package:flutter_ios_calculator/src/ui/home/widget/black_btn.dart';
import 'package:flutter_ios_calculator/src/ui/home/widget/grey_botton.dart';
import 'package:flutter_ios_calculator/src/ui/home/widget/icon_data.dart';
import 'package:flutter_ios_calculator/src/ui/home/widget/orange_btn.dart';
import 'package:get/get.dart';

// 작성일 : 2023년 01월 29일 오전 12:00 작성자 : 한상욱
// 최종수정일 : 2023년 02월 03일 오전 수정자 : 한상욱

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
        child: Text(
          controller.result.toString(),
          style: TextStyle(color: Colors.white, fontSize: 40),
        ),
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
          OrangeBtn(icon: BtnIconType.divide),
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
          OrangeBtn(icon: BtnIconType.multiply),
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
          OrangeBtn(icon: BtnIconType.minus),
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
          OrangeBtn(icon: BtnIconType.plus),
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
          OrangeBtn(icon: BtnIconType.equal),
        ],
      ),
    );
  }
}
