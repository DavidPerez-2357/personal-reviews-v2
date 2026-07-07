import 'package:personal_reviews/core/extensions/theme_context.dart';
import 'package:personal_reviews/shared/errors/error_ui_model.dart';
import 'package:personal_reviews/shared/widgets/app_dialog.dart';
import 'package:personal_reviews/style/design_system/app_radius.dart';
import 'package:personal_reviews/style/design_system/app_spacing.dart';
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
              backgroundColor: context.colors.surfaceContainer,
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
            color: context.colors.error.withValues(alpha: 0.3),
          ),
        ),

        Padding(
          padding: AppInsets.dialogContent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /* Title and message */
              Text(
                type.title,
                textAlign: TextAlign.center,
                style: context.textTheme.titleMedium?.copyWith(
                  color: context.colors.onSurface,
                ),
              ),

              const SizedBox(height: AppSpacing.md),

              Text(
                message,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colors.onSurface.withValues(alpha: 0.9),
                  height: 1.45,
                ),
              ),

              const SizedBox(height: AppSpacing.lg),

              /* Retry button (if retryable) */
              if (type.retryable && onRetry != null) ...[
                FilledButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                    await onRetry!.call();
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: context.colors.onSurface,
                    foregroundColor: context.colors.surface,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: AppRadius.md),
                  ),
                  child: const Text('Volver a intentar'),
                ),
                const SizedBox(height: AppSpacing.xxs),
              ],

              /* Close button */
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: context.colors.onSurface,
                  side: BorderSide(color: context.colors.onSurfaceVariant),
                  shape: RoundedRectangleBorder(borderRadius: AppRadius.md),
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
