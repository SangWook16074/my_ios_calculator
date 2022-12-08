import 'package:flutter/cupertino.dart';

class ETCIconButton extends StatefulWidget {
  final Icon icon;
  const ETCIconButton({Key? key, required this.icon, this.onPressed})
      : super(key: key);
  final VoidCallback? onPressed;

  bool get enabled => onPressed != null;

  @override
  State<ETCIconButton> createState() => _ETCIconButtonState();
}

class _ETCIconButtonState extends State<ETCIconButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
      child: CupertinoButton(
          borderRadius: BorderRadius.circular(100),
          padding: EdgeInsets.all(16),
          color: CupertinoColors.systemGrey,
          child: widget.icon,
          onPressed: widget.onPressed),
    );
  }
}
