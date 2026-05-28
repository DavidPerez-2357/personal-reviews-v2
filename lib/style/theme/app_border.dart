import 'package:flutter/material.dart';

abstract final class AppRadius {
  static const Radius sm = Radius.circular(3);
  static const Radius md = Radius.circular(5);
  static const Radius lg = Radius.circular(10);

  static const BorderRadius smBorder = BorderRadius.all(sm);
  static const BorderRadius mdBorder = BorderRadius.all(md);
  static const BorderRadius lgBorder = BorderRadius.all(lg);
}
