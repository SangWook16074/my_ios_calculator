import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class WidgetSizeController extends GetxController {
  final _appBackGroundColor = CupertinoColors.black;
  final _resultHeight = Get.size.height / 3;
  Color get appBackGroundColor => _appBackGroundColor;
  double get resultHeight => _resultHeight;
}
