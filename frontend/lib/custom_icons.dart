import 'package:flutter/widgets.dart';

class MyCustomIcons {
  MyCustomIcons._(); // Private constructor to prevent instantiation

  static const String _kFontFam = 'customFont';
  // static const String? _kFontPkg = null;

  static const IconData home = IconData(0xe800, fontFamily: _kFontFam);
  static const IconData gemini_svg = IconData(0xe801, fontFamily: _kFontFam);
}
