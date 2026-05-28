import 'package:flutter/material.dart';

class ErrorUIModel {
  final String title;
  final IconData icon;
  final bool retryable;

  const ErrorUIModel({
    required this.title,
    required this.icon,
    required this.retryable,
  });
}
