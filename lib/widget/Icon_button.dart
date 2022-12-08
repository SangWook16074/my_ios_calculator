import 'package:flutter/cupertino.dart';

class CalculateIconButton extends StatefulWidget {
  final Icon icon;
  final Icon activeicon;

  var isClicked;
  CalculateIconButton({
    Key? key,
    required this.icon,
    required this.activeicon,
    this.onPressed,
    this.isClicked = false,
  }) : super(key: key);
  final VoidCallback? onPressed;

  bool get enabled => onPressed != null;
  @override
  State<CalculateIconButton> createState() => _CalculateIconButtonState();
}

class _CalculateIconButtonState extends State<CalculateIconButton> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 80,
          height: 80,
          child: CupertinoButton(
              borderRadius: BorderRadius.circular(100),
              padding: EdgeInsets.all(16),
              color: CupertinoColors.white,
              child: widget.activeicon,
              onPressed: widget.onPressed),
        ),
        AnimatedOpacity(
          opacity: (widget.isClicked == false) ? 1.0 : 0.0,
          duration: Duration(milliseconds: 300),
          child: SizedBox(
            width: 80,
            height: 80,
            child: CupertinoButton(
                pressedOpacity: null,
                borderRadius: BorderRadius.circular(100),
                padding: EdgeInsets.all(16),
                color: CupertinoColors.activeOrange,
                child: widget.icon,
                onPressed: widget.onPressed),
          ),
        ),
      ],
    );
  }
}
