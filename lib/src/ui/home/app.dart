import 'package:flutter/material.dart';
import 'package:flutter_ios_calculator/src/ui/home/widget/grey_botton.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    final double resultHeight = MediaQuery.of(context).size.width;
    final double buttonSize = MediaQuery.of(context).size.width / 4;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _result(),
            _buttonsRow1(),
            _buttonsRow2(),
            _buttonsRow3(),
            _buttonsRow4(),
            _buttonsRow5(),
          ],
        ),
      ),
    );
  }

  // 계산기 화면을 나타내는 위젯
  Widget _result() {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      alignment: Alignment.bottomRight,
      child: Text(
        'result',
        style: TextStyle(color: Colors.white, fontSize: 40),
      ),
    );
  }

  // 버튼 첫번째 줄
  Widget _buttonsRow1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        greyBtn(
          type: GreyBtnType.ALLCLEAR,
        ),
        greyBtn(type: GreyBtnType.PLUSNMINUS),
        greyBtn(type: GreyBtnType.PERCENT),
      ],
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
