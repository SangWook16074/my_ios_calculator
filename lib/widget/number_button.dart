import 'package:flutter/cupertino.dart';

class NumberButton extends StatefulWidget {
  final String number;

  const NumberButton({
    Key? key,
    required this.number,
    this.onPressed,
  }) : super(key: key);

  final VoidCallback? onPressed;

  bool get enabled => onPressed != null;

  @override
  State<NumberButton> createState() => _NumberButtonState();
}

class _NumberButtonState extends State<NumberButton> {
  @override
  Widget build(BuildContext context) {
    return (widget.number != '0')
        ? SizedBox(
            width: 80,
            height: 80,
            child: CupertinoButton(
                borderRadius: BorderRadius.circular(100),
                padding: EdgeInsets.all(16),
                color: Color.fromARGB(255, 59, 59, 59),
                child: Text(
                  widget.number,
                  style: TextStyle(color: CupertinoColors.white, fontSize: 35),
                ),
                onPressed: widget.onPressed),
          )
        : SizedBox(
            width: 180,
            height: 80,
            child: CupertinoButton(
                borderRadius: BorderRadius.circular(100),
                padding: EdgeInsets.all(16),
                color: Color.fromARGB(255, 59, 59, 59),
                child: Text(
                  widget.number,
                  style: TextStyle(color: CupertinoColors.white, fontSize: 35),
                ),
                onPressed: widget.onPressed),
          );
  }
}
