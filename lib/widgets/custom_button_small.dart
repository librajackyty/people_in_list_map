import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/constants.dart';

class CusSButton extends StatefulWidget {
  final String text;
  Widget? icon;
  VoidCallback? onPressed;
  bool maxWidth;

  CusSButton(this.text, this.onPressed,
      {Key? key, this.icon, this.maxWidth = true})
      : super(key: key);

  @override
  _CusSButtonState createState() =>
      _CusSButtonState(text, onPressed, icon, maxWidth);
}

class _CusSButtonState extends State<CusSButton> {
  String text;
  VoidCallback? onPressed;
  Widget? icon;
  bool maxWidth;

  _CusSButtonState(this.text, this.onPressed, this.icon, this.maxWidth);

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
          maxLines: 2,
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
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
