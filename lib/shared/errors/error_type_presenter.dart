import 'package:personal_reviews/shared/errors/error_ui_model.dart';
import 'package:personal_reviews/shared/errors/error_type.dart';
import 'package:flutter/material.dart';

class ErrorTypePresenter {
  const ErrorTypePresenter._();

  static ErrorUIModel of(ErrorType type) {
    switch (type) {
      case ErrorType.validation:
        return const ErrorUIModel(
          title: 'Error de validación',
          icon: Icons.rule,
          retryable: false,
        );

      case ErrorType.network:
        return const ErrorUIModel(
          title: 'Error de conexión',
          icon: Icons.wifi_off,
          retryable: true,
        );

      case ErrorType.storage:
        return const ErrorUIModel(
          title: 'Error de almacenamiento',
          icon: Icons.shopping_bag_rounded,
          retryable: true,
        );

      case ErrorType.database:
        return const ErrorUIModel(
          title: 'Error de base de datos',
          icon: Icons.storage_rounded,
          retryable: true,
        );

      case ErrorType.critical:
        return const ErrorUIModel(
          title: 'Error crítico',
          icon: Icons.error_outline,
          retryable: false,
        );

      case ErrorType.authentication:
        return const ErrorUIModel(
          title: 'Autenticación requerida',
          icon: Icons.lock,
          retryable: false,
        );

      case ErrorType.authorization:
        return const ErrorUIModel(
          title: 'Acceso denegado',
          icon: Icons.no_encryption,
          retryable: false,
        );

      case ErrorType.timeout:
        return const ErrorUIModel(
          title: 'Tiempo de espera agotado',
          icon: Icons.timer_off,
          retryable: true,
        );

      case ErrorType.notFound:
        return const ErrorUIModel(
          title: 'Recurso no encontrado',
          icon: Icons.search_off,
          retryable: false,
        );

      case ErrorType.conflict:
        return const ErrorUIModel(
          title: 'Conflicto de datos',
          icon: Icons.sync_problem,
          retryable: true,
        );

      case ErrorType.rateLimit:
        return const ErrorUIModel(
          title: 'Demasiadas solicitudes',
          icon: Icons.speed,
          retryable: true,
        );

      case ErrorType.parse:
        return const ErrorUIModel(
          title: 'Error de procesamiento de datos',
          icon: Icons.data_array,
          retryable: false,
        );

      case ErrorType.dependency:
        return const ErrorUIModel(
          title: 'Fallo de dependencia externa',
          icon: Icons.extension_off,
          retryable: true,
        );

      case ErrorType.unknown:
        return const ErrorUIModel(
          title: 'Error desconocido',
          icon: Icons.help_outline,
          retryable: false,
        );
    }
  }
}
