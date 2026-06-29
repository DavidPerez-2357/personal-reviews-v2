import 'package:flutter/material.dart';

String colorToHex(Color color) {
  return '#${color.toARGB32().toRadixString(16).padLeft(8, '0').toUpperCase()}';
}

Color hexStringToColor(String hex) {
  return Color(int.parse(hex.replaceAll('#', '0xFF')));
}
