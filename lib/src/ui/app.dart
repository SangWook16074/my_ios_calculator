import 'package:flutter/material.dart';
import 'package:flutter_ios_calculator/src/controller/calculator_controller.dart';
import 'package:get/get.dart';

import '../components/black_btn.dart';
import '../components/equal_btn.dart';
import '../components/grey_botton.dart';
import '../constants/icon_data.dart';
import '../components/orange_btn.dart';

// 작성일 : 2023년 01월 29일 오전 12:00
// 작성자 : 한상욱
// 최종 수정일 : 2023년 02월 12일 오후 11:06
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
        child: Obx(
          () => Text(
            controller.result,
            style: TextStyle(
                color: Colors.white, fontSize: 80, fontWeight: FontWeight.w200),
          ),
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
          GreyBtn(
            type: GreyBtnType.ALLCLEAR,
            onPressed: controller.allClear,
          ),
          GreyBtn(
            type: GreyBtnType.PLUSNMINUS,
            onPressed: controller.convert,
          ),
          GreyBtn(
            type: GreyBtnType.PERCENT,
            onPressed: controller.changeToPercent,
          ),
          Obx(
            () => OrangeBtn(
              iconFront: BtnIconType.divide,
              iconBack: BtnIconType.divideReverse,
              isClicked: controller.divide,
              onPressed: controller.pushDivideBtn,
            ),
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
          BlackBtn(
            type: BlackBtnType.SEVEN,
            onPressed: () => controller.pushNumberBtn('7'),
          ),
          BlackBtn(
            type: BlackBtnType.EIGHT,
            onPressed: () => controller.pushNumberBtn('8'),
          ),
          BlackBtn(
            type: BlackBtnType.NINE,
            onPressed: () => controller.pushNumberBtn('9'),
          ),
          Obx(
            () => OrangeBtn(
              iconFront: BtnIconType.multiply,
              iconBack: BtnIconType.multplyReverse,
              isClicked: controller.multiply,
              onPressed: controller.pushMultiplyBtn,
            ),
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
          BlackBtn(
            type: BlackBtnType.FOUR,
            onPressed: () => controller.pushNumberBtn('4'),
          ),
          BlackBtn(
            type: BlackBtnType.FIVE,
            onPressed: () => controller.pushNumberBtn('5'),
          ),
          BlackBtn(
            type: BlackBtnType.SIX,
            onPressed: () => controller.pushNumberBtn('6'),
          ),
          Obx(
            () => OrangeBtn(
              iconFront: BtnIconType.minus,
              iconBack: BtnIconType.minusReverse,
              isClicked: controller.minus,
              onPressed: controller.pushMinusBtn,
            ),
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
          BlackBtn(
            type: BlackBtnType.ONE,
            onPressed: () => controller.pushNumberBtn('1'),
          ),
          BlackBtn(
            type: BlackBtnType.TWO,
            onPressed: () => controller.pushNumberBtn('2'),
          ),
          BlackBtn(
            type: BlackBtnType.THREE,
            onPressed: () => controller.pushNumberBtn('3'),
          ),
          Obx(
            () => OrangeBtn(
              iconFront: BtnIconType.plus,
              iconBack: BtnIconType.plusReverse,
              isClicked: controller.plus,
              onPressed: controller.pushPlusBtn,
            ),
          ),
        ],
      ),
    );
  }

  // 버튼 다섯번째 줄
  Widget _buttonsRow5() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlackBtn(
            type: BlackBtnType.ZERO,
            onPressed: () => controller.pushNumberBtn('0'),
          ),
          BlackBtn(
            type: BlackBtnType.DOT,
            onPressed: controller.pushDotBtn,
          ),
          EqualBtn(
            onPressed: controller.calculate,
          ),
        ],
      ),
    );
  }
}
