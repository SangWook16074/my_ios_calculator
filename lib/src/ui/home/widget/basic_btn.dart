// 2023 - 02 - 01 오전 1:14 작성자 : 한상욱
// 기본 버튼 클래스
// 모든 버튼들의 기본이 되는 틀 역할
// 중복되는 소스를 방지하면서 클린 아키텍처를 도와줌.
import 'package:flutter/cupertino.dart';

class BasicBtn extends StatefulWidget {
  final Color color;
  final Widget child;
  const BasicBtn({super.key, required this.child, required this.color});

  @override
  State<BasicBtn> createState() => _BasicBtnState();
}

class _BasicBtnState extends State<BasicBtn> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 4 - 20,
      height: MediaQuery.of(context).size.width / 4 - 20,
      child: CupertinoButton(
        color: widget.color,
        padding: const EdgeInsets.all(8.0),
        borderRadius: BorderRadius.circular(100),
        child: widget.child,
        onPressed: () {},
      ),
    );
  }
}
