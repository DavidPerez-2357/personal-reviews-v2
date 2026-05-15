
import 'package:flutter/material.dart';


String colorToHexString (Color color) {
  return color.toString().replaceAll('Color(0x', '#').replaceAll(')', '');
}