import 'package:flutter/material.dart';

String colorToHex(Color color) {
  return color.toString().replaceAll('Color(0x', '#').replaceAll(')', '');
}

Color hexStringToColor(String hex) {
  return Color(int.parse(hex.replaceAll('#', '0xFF')));
}
