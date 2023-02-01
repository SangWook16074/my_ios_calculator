import 'package:flutter/material.dart';
import 'package:flutter_ios_calculator/src/ui/home/widget/grey_botton.dart';
import 'package:flutter_ios_calculator/src/ui/home/widget/icon_data.dart';
import 'package:flutter_ios_calculator/src/ui/home/widget/orange_btn.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          _result(),
          _buttonsRow1(),
          _buttonsRow2(),
          _buttonsRow3(),
          _buttonsRow4(),
          _buttonsRow5(),
        ],
      ),
    );
  }

  // 계산기 화면을 나타내는 위젯
  Widget _result() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 3,
        alignment: Alignment.bottomRight,
        child: Text(
          'result',
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
    return Container();
  }

  // 버튼 세번째 줄
  Widget _buttonsRow3() {
    return Container();
  }

  // 버튼 네번째 줄
  Widget _buttonsRow4() {
    return Container();
  }

  // 버튼 다섯번째 줄
  Widget _buttonsRow5() {
    return Container();
  }
}
