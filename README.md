# 프로젝트 소개

GetX를 이용해서 제작한 IOS 계산기 앱입니다.

## 프로젝트 UI


## 구현 기능

숫자를 입력한다면 결과값에 오른쪽에 계속해서 더해져야 합니다. 여기서, 처음 숫자를 입력한다면 0이 새로운 숫자로 대체되어야 합니다.

입력받는 숫자를 모두 문자열로 처리해서 문자열 연산으로 처리해서 위 효과를 구현했습니다.

```dart
  void pushNumberBtn(String value) {
        ...
    _result.value += value;
  }
```

위 코드는 결과값에 계속 입력 숫자를 우측에 더해줍니다.

실수형 계산을 위해 점을 찍는다면 숫자와 마찬가지로 오른쪽에 점이 찍힙니다. 하지만, 이미 점이 찍혀있다면 찍히면 안됩니다.

이 기능은 contain함수를 이용해서 구현했습니다.

```dart
  void pushDotBtn() {
    if (_result.value.contains('.')) {
      return;
    }
    _result.value += '.';
  }
```
위 함수에서 .이 이미 포함되어있다면, .을 찍지 않습니다.

![pushNumber](https://github.com/SangWook16074/my_ios_calculator/assets/108314973/62d4ed56-8ef8-4bea-824b-e026f0bdde6e)

----------------

연산버튼을 누르면 버튼이 활성화 됩니다. 이때, 자기자신은 아무리 눌러도 비활성화되지 않고, 다른 연산버튼을 클릭해야 비활성화됩니다.

연산 버튼은 AnimatedOpacity와 Stack, 불리언 타입의 매개변수를 이용해서 활성화/비활성화 효과를 구현했습니다.

```dart
...
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _backBtn(),
        _frontBtn(),
      ],
    );
  }

  Widget _backBtn() {
    return SizedBox(
      width: BtnSize.btnRound,
      height: BtnSize.btnRound,
      child: CupertinoButton(
        color: BtnColor.white,
        padding: const EdgeInsets.all(8.0),
        borderRadius: BorderRadius.circular(100),
        onPressed: onPressed,
        child: iconBack,
      ),
    );
  }

  Widget _frontBtn() {
    return AnimatedOpacity(
      opacity: (isClicked) ? 0.0 : 1.0,
      duration: const Duration(milliseconds: 300),
      child: SizedBox(
        width: BtnSize.btnRound,
        height: BtnSize.btnRound,
        child: CupertinoButton(
          pressedOpacity: null,
          color: BtnColor.orange,
          padding: const EdgeInsets.all(8.0),
          borderRadius: BorderRadius.circular(100),
          child: iconFront,
          onPressed: onPressed,
        ),
      ),
    );
  }
```

위 코드는 오렌지 버튼의 코드 일부입니다. 그리고 불리언 변수는 버튼이 활성화될지 비활성화될지를 결정합니다.

![pushCal](https://github.com/SangWook16074/my_ios_calculator/assets/108314973/75937501-32ef-407f-a700-0c29bddd67bc)

-----------------

= 버튼을 이용해서 각각의 사측연산 결과를 출력받을 수 있습니다. calculate()함수는 계산 결과를 출력하는 함수입니다. 여기서, 계산결과는 실수가 아니라면 모두 정수형으로 출력되야 합니다. doubleToInt()함수는 만약 정수형으로 변환할 수 있다면 정수형으로 변환하는 함수입니다.

![cal](https://github.com/SangWook16074/my_ios_calculator/assets/108314973/094cd9ab-844e-48fd-a222-effc6abad602)

-----------------

+/- 버튼은 현재 표시하고 있는 숫자의 부호를 바꿉니다.

convert()함수를 통해서 부호 전환을 구현했습니다.

![convert](https://github.com/SangWook16074/my_ios_calculator/assets/108314973/d4eeb7a4-c44a-4ee2-8804-a220af81706b)

-----------------

% 버튼은 모든 숫자의 백분율을 나타냅니다. changeToPercent()함수를 통해서 백분율값으로 변환합니다.

![percent](https://github.com/SangWook16074/my_ios_calculator/assets/108314973/3b933693-2d15-447d-9995-ca0f678261c4)

-----------------

0으로 숫자를 나누면 오류가 발생합니다. 따라서 오류를 출력합니다.

![div0](https://github.com/SangWook16074/my_ios_calculator/assets/108314973/4e8b2c99-6369-4c03-b836-1ad8e92f11ae)

-----------------

=버튼을 연속해서 클릭하면 계속해서 동일한 연산을 반복합니다.

![infinity](https://github.com/SangWook16074/my_ios_calculator/assets/108314973/ec0156c4-9fe3-4da8-8b6f-5248e29546b5)

-----------------

All Clear 버튼은 계산기를 초기화합니다.

![allclear](https://github.com/SangWook16074/my_ios_calculator/assets/108314973/7aa0cd62-d9da-46ac-b98e-09695f97ffd5)

