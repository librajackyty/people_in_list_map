import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CusNBackButton extends StatefulWidget {
  final String text;
  Widget? icon;
  VoidCallback? onPressed;

  CusNBackButton(this.text, this.onPressed, {Key? key, this.icon})
      : super(key: key);

  @override
  _CusNBackButtonState createState() =>
      _CusNBackButtonState(text, onPressed, icon);
}

class _CusNBackButtonState extends State<CusNBackButton> {
  String text;
  VoidCallback? onPressed;
  Widget? icon;

  _CusNBackButtonState(this.text, this.onPressed, this.icon);

  @override
  Widget build(BuildContext context) {
    if (widget.icon != null) {
      return ElevatedButton.icon(
        icon: widget.icon!,
        onPressed: () {
          widget.onPressed?.call();
        },
        label: Text(
          widget.text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      );
    }
    return ElevatedButton(
      onPressed: () {
        widget.onPressed?.call();
      },
      child: Text(
        widget.text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
