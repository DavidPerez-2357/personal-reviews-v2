import 'package:personal_reviews/shared/errors/error_ui_model.dart';
import 'package:personal_reviews/shared/widgets/app_dialog.dart';
import 'package:personal_reviews/style/theme/app_border.dart';
import 'package:personal_reviews/style/theme/app_colors.dart';
import 'package:flutter/material.dart';

abstract final class AppCriticErrorDialog {
  static Future<void> show(
    BuildContext context,
    ErrorUIModel type,
    String message, {
    Future<void> Function()? onRetry,
  }) async {
    await showGeneralDialog<void>(
      context: context,
      barrierDismissible: false,
      barrierLabel: type.title,
      barrierColor: Colors.black54,
      transitionDuration: AppDialogTransition.duration,
      pageBuilder: (dialogContext, animation, secondaryAnimation) {
        return SafeArea(
          child: Center(
            child: AppDialogSurface(
              backgroundColor: AppColors.surfaceContainer,
              child: _CriticErrorDialogContent(
                type: type,
                message: message,
                onRetry: onRetry,
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return AppDialogTransition.build(animation, child);
      },
    );
  }
}

class _CriticErrorDialogContent extends StatelessWidget {
  const _CriticErrorDialogContent({
    required this.type,
    required this.message,
    this.onRetry,
  });

  final ErrorUIModel type;
  final String message;
  final Future<void> Function()? onRetry;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /* Background icon */
        Positioned(
          right: -50,
          top: -30,
          child: Icon(
            type.icon,
            size: 220,
            color: AppColors.error.withValues(alpha: 0.3),
          ),
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /* Title and message */
              Text(
                type.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.onSurface,
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 16),

              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.onSurface.withValues(alpha: 0.9),
                  fontSize: 15,
                  height: 1.45,
                ),
              ),

              const SizedBox(height: 25),

              /* Retry button (if retryable) */
              if (type.retryable && onRetry != null) ...[
                FilledButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                    await onRetry!.call();
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.onSurface,
                    foregroundColor: AppColors.surface,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: AppRadius.mdBorder,
                    ),
                  ),
                  child: const Text('Volver a intentar'),
                ),
                const SizedBox(height: 2),
              ],

              /* Close button */
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.onSurface,
                  side: const BorderSide(color: AppColors.onSurfaceVariant),
                  shape: RoundedRectangleBorder(
                    borderRadius: AppRadius.mdBorder,
                  ),
                ),
                child: const Text('Entendido'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
