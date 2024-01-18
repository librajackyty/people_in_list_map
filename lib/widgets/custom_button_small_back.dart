import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CusSBackButton extends StatefulWidget {
  final String text;
  Widget? icon;
  VoidCallback? onPressed;
  bool maxWidth;

  CusSBackButton(this.text, this.onPressed,
      {Key? key, this.icon, this.maxWidth = true})
      : super(key: key);

  @override
  _CusSBackButtonState createState() =>
      _CusSBackButtonState(text, onPressed, icon, maxWidth);
}

class _CusSBackButtonState extends State<CusSBackButton> {
  String text;
  VoidCallback? onPressed;
  Widget? icon;
  bool maxWidth;

  _CusSBackButtonState(this.text, this.onPressed, this.icon, this.maxWidth);

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
          textAlign: TextAlign.center,
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
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
