import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CusNButton extends StatefulWidget {
  final String text;
  Widget? icon;
  VoidCallback? onPressed;
  bool disabled = false;
  bool readOnly = false;

  CusNButton(this.text, this.onPressed,
      {Key? key, this.icon, this.disabled = false, this.readOnly = false})
      : super(key: key);

  @override
  _CusNButtonState createState() =>
      _CusNButtonState(text, onPressed, icon, disabled, readOnly);
}

class _CusNButtonState extends State<CusNButton> {
  String text;
  VoidCallback? onPressed;
  Widget? icon;
  bool disabled;
  bool readOnly;

  _CusNButtonState(
      this.text, this.onPressed, this.icon, this.disabled, this.readOnly);

  @override
  Widget build(BuildContext context) {
    if (widget.icon != null) {
      return ElevatedButton.icon(
        icon: widget.icon!,
        onPressed: disabled
            ? null
            : () {
                if (readOnly) return;
                widget.onPressed?.call();
              },
        label: Text(
          widget.text,
          textAlign: TextAlign.center,
          maxLines: readOnly ? 3 : 2,
          overflow: TextOverflow.ellipsis,
        ),
      );
    }
    return ElevatedButton(
      onPressed: disabled
          ? null
          : () {
              if (readOnly) return;
              widget.onPressed?.call();
            },
      child: AutoSizeText(
        widget.text,
        textAlign: TextAlign.center,
        maxLines: readOnly ? 3 : 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
