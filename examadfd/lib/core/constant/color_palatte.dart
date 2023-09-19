import 'package:flutter/material.dart';

class ColorPalette {
  static const Color primaryColor = Color(0xff6155CC);
  static const Color secondColor = Color(0xff8F67E8);
  static const Color yellowColor = Color(0xffFE9C5E);
  static const Color dividerColor = Color(0xffe5e7eb);
  static const Color text1Color = Color(0xff323b4b);
  static const Color subTitleColor = Color(0xff838383);
}

class Gradients{
  static const Gradient defaultGradientBackground = LinearGradient(
    begin: Alignment.topLeft,
      end: Alignment.bottomLeft,
      colors: [
        ColorPalette.secondColor,
        ColorPalette.primaryColor,
      ]
  );
}