import 'package:flutter_ios_calculator/src/controller/widget_size_controller.dart';
import 'package:get/get.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(WidgetSizeController(), permanent: true);
  }
}
