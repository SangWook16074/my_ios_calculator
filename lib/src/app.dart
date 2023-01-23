import 'package:flutter/cupertino.dart';
import 'package:flutter_ios_calculator/widget/Icon_button.dart';
import 'package:flutter_ios_calculator/widget/etc_button.dart';
import '../widget/number_button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int cnt = 0;
  var _result = '0';
  String _clickedNumbers = '';
  late var _calculateIcon;
  var num1 = 0.0;
  var num2 = 0.0;
  var isPointed = false; // 점이 찍혔는지 안찍혔는지 확인하는 값
  var isCheck = false; //사측연산 기호가 선택되었는지 아닌지 확인하는 값

  Map _calController = ({
    'add': false,
    'minus': false,
    'mult': false,
    'div': false,
  });

  _invert() {
    //부호 바꾸기 함수
    _result = (-double.parse(_result)).toString();
    _convertInt();
    setState(() {});
  }

  _convertToPercent() {
    //확률로 바꾸는 함수
    _result = (double.parse(_result) / 100.0).toString();
    setState(() {});
  }

  void _setInit() {
    //기호버튼 초기화

    setState(() {
      _calController['add'] = false;
      _calController['minus'] = false;
      _calController['mult'] = false;
      _calController['div'] = false;
    });
  }

  void _toggle(String str) {
    //기호버튼 함수
    setState(() {
      _calController[str] = !_calController[str];
    });
    num1 = double.parse(_result);
    _calculateIcon = str;
    isCheck = true;
    _clickedNumbers = '';
  }

  _calculate() {
    //등호 버튼 함수
    if (isCheck == false) {
      return;
    }

    _setInit();

    if (_calculateIcon == 'div' && num2 == 0) {
      setState(() {
        _result = '오류';
      });
      return;
    }
    switch (_calculateIcon) {
      case 'add':
        _result = (num1 + num2).toString();

        break;
      case 'minus':
        _result = (num1 - num2).toString();
        break;
      case 'mult':
        _result = (num1 * num2).toString();
        break;
      case 'div':
        _result = (num1 / num2).toString();
        break;
      default:
        break;
    }
    _convertInt();
    setState(() {});

    print('$num1, $num2, $_result, $isCheck');

    num1 = double.parse(_result);
  }

  _convertInt() {
    //값이 정수면 정수로 출력
    var a = double.parse(_result);
    var b = double.parse(_result).round();
    if ((a - b).abs() == 0) {
      _result = a.toInt().toString();
      return;
    }
  }

  _dot() {
    //점찍는 함수
    setState(() {
      isPointed = true;
    });

    if (_clickedNumbers == '') {
      _clickedNumbers += '0.';
      _result = _clickedNumbers;
      return;
    }

    _clickedNumbers += '.';
    _result = _clickedNumbers;
  }

  _dotCheck() {
    //점이 찍혔나?
    if (isPointed == true) {
      return;
    }

    _dot();
  }

  _numBtnClick(String number) {
    //숫자 버튼 누르는 함수
    if (number == '.') {
      _dotCheck();
      return;
    }

    if (number == '0' && _clickedNumbers == '') {
      return;
    }

    if (isCheck == true) {
      _setInit();

      _clickedNumbers += number;
      _result = _clickedNumbers;
      setState(() {});
      num2 = double.parse(_result);
      print(1);
      return;
    }

    _clickedNumbers += number;
    print('$_result, $_clickedNumbers, $num2');
    setState(() {
      _result = _clickedNumbers;
    });
  }

  _allClear() {
    //클리어 버튼 함수
    _setInit();
    setState(() {
      _result = '0';
      _clickedNumbers = '';
      isCheck = false;
      isPointed = false;
      num1 = 0.0;
      num2 = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildResultBox(),
              _buildButtons(),
            ],
          ),
        ),
        backgroundColor: CupertinoColors.black);
  }

  Widget _buildResultBox() {
    return Container(
      margin: EdgeInsets.all(20.0),
      height: MediaQuery.of(context).size.height / 3 - 40,
      child: Align(
        alignment: Alignment.bottomRight,
        child: Text(
          _result.toString(),
          style: TextStyle(color: CupertinoColors.white, fontSize: 70),
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: CupertinoButton(
                  borderRadius: BorderRadius.circular(100),
                  padding: EdgeInsets.all(16),
                  color: CupertinoColors.systemGrey,
                  child: Text(
                    (_clickedNumbers == '') ? 'AC' : 'C',
                    style:
                        TextStyle(color: CupertinoColors.black, fontSize: 35),
                  ),
                  onPressed: () {
                    _allClear();
                  }),
            ),
            ETCIconButton(
              icon: Icon(
                CupertinoIcons.plus_slash_minus,
                color: CupertinoColors.black,
                size: 35,
              ),
              onPressed: () {
                _invert();
              },
            ),
            ETCIconButton(
              icon: Icon(
                CupertinoIcons.percent,
                color: CupertinoColors.black,
                size: 35,
              ),
              onPressed: () {
                _convertToPercent();
              },
            ),
            CalculateIconButton(
              icon: Icon(
                CupertinoIcons.divide,
                size: 35,
              ),
              activeicon: Icon(
                CupertinoIcons.divide,
                size: 35,
                color: CupertinoColors.activeOrange,
              ),
              isClicked: _calController['div'],
              onPressed: () {
                _setInit();
                _toggle('div');
              },
            )
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NumberButton(
              number: '7',
              onPressed: () {
                _numBtnClick('7');
              },
            ),
            NumberButton(
              number: '8',
              onPressed: () {
                _numBtnClick('8');
              },
            ),
            NumberButton(
              number: '9',
              onPressed: () {
                _numBtnClick('9');
              },
            ),
            CalculateIconButton(
                icon: Icon(
                  CupertinoIcons.multiply,
                  size: 35,
                ),
                activeicon: Icon(
                  CupertinoIcons.multiply,
                  size: 35,
                  color: CupertinoColors.activeOrange,
                ),
                isClicked: _calController['mult'],
                onPressed: () {
                  _setInit();
                  _toggle('mult');
                })
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NumberButton(
              number: '4',
              onPressed: () {
                _numBtnClick('4');
              },
            ),
            NumberButton(
              number: '5',
              onPressed: () {
                _numBtnClick('5');
              },
            ),
            NumberButton(
              number: '6',
              onPressed: () {
                _numBtnClick('6');
              },
            ),
            CalculateIconButton(
                icon: Icon(
                  CupertinoIcons.minus,
                  size: 35,
                ),
                activeicon: Icon(
                  CupertinoIcons.minus,
                  size: 35,
                  color: CupertinoColors.activeOrange,
                ),
                isClicked: _calController['minus'],
                onPressed: () {
                  _setInit();
                  _toggle('minus');
                })
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NumberButton(
              number: '1',
              onPressed: () {
                _numBtnClick('1');
              },
            ),
            NumberButton(
              number: '2',
              onPressed: () {
                _numBtnClick('2');
              },
            ),
            NumberButton(
              number: '3',
              onPressed: () {
                _numBtnClick('3');
              },
            ),
            CalculateIconButton(
                icon: Icon(
                  CupertinoIcons.add,
                  size: 35,
                ),
                activeicon: Icon(
                  CupertinoIcons.add,
                  size: 35,
                  color: CupertinoColors.activeOrange,
                ),
                isClicked: _calController['add'],
                onPressed: () {
                  _setInit();
                  _toggle('add');
                })
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NumberButton(
              number: '0',
              onPressed: () {
                _numBtnClick('0');
              },
            ),
            NumberButton(
              number: '.',
              onPressed: () {
                _numBtnClick('.');
              },
            ),
            SizedBox(
              width: 80,
              height: 80,
              child: CupertinoButton(
                  borderRadius: BorderRadius.circular(100),
                  padding: EdgeInsets.all(16),
                  color: CupertinoColors.activeOrange,
                  child: Icon(CupertinoIcons.equal, size: 35),
                  onPressed: () {
                    _calculate();
                  }),
            )
          ],
        ),
      ],
    );
  }
}
