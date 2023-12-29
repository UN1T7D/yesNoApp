import 'package:flutter/material.dart';

const Color _customColor = Color(0xFFFF7300);
const List<Color> _colorThemes = [
  _customColor,
  Colors.black,
  Colors.green,
  Colors.yellow,
  Colors.blue,
  Colors.pink,
  Colors.orange,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor <= _colorThemes.length,
            'El color debe ser mayor o igual a 0');

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true, colorSchemeSeed: _colorThemes[selectedColor]);
  }
}
