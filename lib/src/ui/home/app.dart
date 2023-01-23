import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    return Container(
      child: Text(
        'result',
        style: TextStyle(color: Colors.white, fontSize: 40),
      ),
    );
  }

  // 버튼 첫번째 줄
  Widget _buttonsRow1() {
    return Container();
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
