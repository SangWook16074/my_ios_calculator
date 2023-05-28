import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ios_calculator/src/bindings/init_binding.dart';
import 'package:flutter_ios_calculator/src/ui/app.dart';
import 'package:get/get.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.black,
      ),
      home: const App(),
      initialBinding: InitBinding(),
    );
  }
}
