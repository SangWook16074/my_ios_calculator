import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum GreyBtnType { ALLCLEAR, PLUSNMINUS, PERCENT }

class greyBtn extends StatefulWidget {
  final GreyBtnType type;
  const greyBtn({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  State<greyBtn> createState() => _greyBtnState();
}

class _greyBtnState extends State<greyBtn> {
  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case GreyBtnType.PLUSNMINUS:
        return _buttonETC(Icon(
          Icons.plus_one,
          color: Colors.black,
        ));

      case GreyBtnType.PERCENT:
        return _buttonETC(Icon(
          Icons.percent,
          color: Colors.black,
        ));
      case GreyBtnType.ALLCLEAR:
        return _buttonAllClear();
    }
  }

  Widget _buttonAllClear() {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 4 - 20,
          height: MediaQuery.of(context).size.width / 4 - 20,
          child: CupertinoButton(
            color: CupertinoColors.systemGrey,
            padding: const EdgeInsets.all(8.0),
            borderRadius: BorderRadius.circular(100),
            child: Text(
              'AC',
              style: TextStyle(
                  fontSize: 30,
                  color: CupertinoColors.black,
                  fontWeight: FontWeight.w500),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Widget _buttonETC(Icon icon) {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 4 - 20,
          height: MediaQuery.of(context).size.width / 4 - 20,
          child: CupertinoButton(
            color: CupertinoColors.systemGrey,
            padding: const EdgeInsets.all(8.0),
            borderRadius: BorderRadius.circular(100),
            child: icon,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
