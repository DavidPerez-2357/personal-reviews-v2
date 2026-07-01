import 'package:flutter/material.dart';

String colorToHex(Color color) {
  final rgb = color.toARGB32() & 0x00FFFFFF;
  return '#${rgb.toRadixString(16).padLeft(6, '0').toUpperCase()}';
}

Color hexStringToColor(String hex) {
  return Color(int.parse(hex.replaceAll('#', '0xFF')));
}
