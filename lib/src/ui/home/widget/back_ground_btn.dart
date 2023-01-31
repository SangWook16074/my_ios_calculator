// 2023 - 02 - 01 오전 1:15 작성자 : 한상욱
// 기본 버튼 배경 클래스
// 버튼 클래스의 하얀 클릭 이벤트를 위한 배경

import 'package:flutter/cupertino.dart';

class BackGroundBtn extends StatelessWidget {
  const BackGroundBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 4 - 20,
      height: MediaQuery.of(context).size.width / 4 - 20,
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
