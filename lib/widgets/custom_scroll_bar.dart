import 'package:flutter/material.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';

import '../utils/constants.dart';

class CusScrollbar extends StatefulWidget {
  final Widget child;
  final ScrollController? scrollController;
  final bool isAlwaysShown;
  final double thickness;

  CusScrollbar(
      {Key? key,
      required this.child,
      this.scrollController,
      this.isAlwaysShown = false,
      this.thickness = 16.0})
      : super(key: key);

  @override
  _CusScrollbarState createState() => _CusScrollbarState();
}

class _CusScrollbarState extends State<CusScrollbar> {
  _CusScrollbarState();

  @override
  Widget build(BuildContext context) {
    return VsScrollbar(
        controller: widget.scrollController,
        isAlwaysShown: widget.isAlwaysShown, // default false
        style: VsScrollbarStyle(
          hoverThickness: widget.thickness + 2,
          radius: const Radius.circular(cardsBorderRadius),
          thickness: widget.thickness,
        ),
        child: widget.child);
  }
}
