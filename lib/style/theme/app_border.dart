import 'package:flutter/material.dart';

class AppRadius {
  final sm = Radius.circular(3);
  final md = Radius.circular(5);
  final lg = Radius.circular(10);

  BorderRadius get smBorder => BorderRadius.all(sm);
  BorderRadius get mdBorder => BorderRadius.all(md);
  BorderRadius get lgBorder => BorderRadius.all(lg);
}
