import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CusExSText extends StatefulWidget {
  final String text;
  Color? color;
  TextAlign? textAlign;

  CusExSText(this.text, {Key? key, this.color, this.textAlign})
      : super(key: key);

  @override
  _CusExSTextState createState() => _CusExSTextState();
}

class _CusExSTextState extends State<CusExSText> {
  _CusExSTextState();

  @override
  Widget build(BuildContext context) {
    return Text(widget.text, textAlign: widget.textAlign);
  }
}
