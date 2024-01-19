import 'package:flutter/material.dart';

import '../widgets/custom_text_small.dart';
import 'constants.dart';

void showSnackMsg(BuildContext context, String msg) {
  removeCurrentSnavkBar(context);
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: elementActiveColor,
    content: CusSText(msg),
  ));
}

void removeCurrentSnavkBar(BuildContext context) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
}
