import 'package:flutter/material.dart';
import 'package:personal_reviews/style/design_system/app_radius.dart';

abstract final class AppDialogTransition {
  static const Duration duration = Duration(milliseconds: 320);

  static Widget build(
    Animation<double> animation,
    Widget child, {
    Curve curve = Curves.easeOutCubic,
    Curve reverseCurve = Curves.easeInCubic,
    Offset beginOffset = const Offset(0, 0.06),
    double beginScale = 0.92,
  }) {
    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: curve,
      reverseCurve: reverseCurve,
    );

    return FadeTransition(
      opacity: curvedAnimation,
      child: ScaleTransition(
        scale: Tween<double>(
          begin: beginScale,
          end: 1.0,
        ).animate(curvedAnimation),
        child: SlideTransition(
          position: Tween<Offset>(
            begin: beginOffset,
            end: Offset.zero,
          ).animate(curvedAnimation),
          child: child,
        ),
      ),
    );
  }
}

class AppDialogSurface extends StatelessWidget {
  const AppDialogSurface({
    super.key,
    required this.child,
    this.maxWidth = 400,
    this.backgroundColor,
    this.borderRadius = AppRadius.lg,
    this.elevation = 0,
  });

  final Widget child;
  final double maxWidth;
  final Color? backgroundColor;
  final BorderRadius borderRadius;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: Dialog(
        backgroundColor: backgroundColor,
        elevation: elevation,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        child: ClipRRect(borderRadius: borderRadius, child: child),
      ),
    );
  }
}
