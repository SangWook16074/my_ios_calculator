import 'package:flutter_ios_calculator/src/controller/calculator_controller.dart';
import 'package:get/get.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CalculatorController(), permanent: true);
  }
}
