import 'package:flutter/material.dart';
import 'package:flutter_ios_calculator/src/binding/init_binding.dart';
import 'package:flutter_ios_calculator/src/ui/home/app.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const App(),
      initialBinding: InitBinding(),
    );
  }
}
