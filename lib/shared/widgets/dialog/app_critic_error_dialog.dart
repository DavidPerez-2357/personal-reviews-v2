import 'package:flutter/material.dart';
import 'package:personal_reviews/shared/presentation/errors/error_ui_model.dart';
import 'package:personal_reviews/style/theme/app_border.dart';
import 'package:personal_reviews/style/theme/app_colors.dart';

abstract final class AppCriticErrorDialog {
  static const Duration _transitionDuration = Duration(milliseconds: 320);

  static Future<void> show(
    BuildContext context,
    ErrorUIModel type,
    String message,
  ) async {
    await showGeneralDialog<void>(
      context: context,
      barrierDismissible: false,
      barrierLabel: type.title,
      barrierColor: Colors.black54,
      transitionDuration: _transitionDuration,
      pageBuilder: (dialogContext, animation, secondaryAnimation) {
        return SafeArea(
          child: Center(
            child: _CriticErrorDialogContent(type: type, message: message),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
          reverseCurve: Curves.easeInCubic,
        );

        return FadeTransition(
          opacity: curvedAnimation,
          child: ScaleTransition(
            scale: Tween<double>(
              begin: 0.92,
              end: 1.0,
            ).animate(curvedAnimation),
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 0.06),
                end: Offset.zero,
              ).animate(curvedAnimation),
              child: child,
            ),
          ),
        );
      },
    );
  }
}

class _CriticErrorDialogContent extends StatelessWidget {
  const _CriticErrorDialogContent({required this.type, required this.message});

  final ErrorUIModel type;
  final String message;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Dialog(
        backgroundColor: AppColors.surfaceContainerHigh,
        elevation: 18,
        shadowColor: Colors.black.withValues(alpha: 0.45),
        shape: RoundedRectangleBorder(borderRadius: AppRadius.mdBorder),
        insetPadding: const EdgeInsets.symmetric(horizontal: 24),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.error.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(type.icon, color: AppColors.error, size: 30),
              ),
              const SizedBox(height: 20),
              Text(
                type.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.onSurface,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.onSurfaceVariant,
                  fontSize: 15,
                  height: 1.45,
                ),
              ),
              const SizedBox(height: 24),
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(48),
                  shape: RoundedRectangleBorder(
                    borderRadius: AppRadius.mdBorder,
                  ),
                ),
                child: const Text('Entendido'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
