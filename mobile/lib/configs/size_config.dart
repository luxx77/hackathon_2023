import 'package:flutter/material.dart';

class SizeConfig {
  static double padTop = 0;

  static void getSizes(BuildContext context) {
    final size = MediaQuery.of(context);
    padTop = size.viewPadding.top;
  }
}
