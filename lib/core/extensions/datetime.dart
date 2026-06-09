enum TimeAgoFormat { long, short }

extension DateTimeTimeAgoExtension on DateTime {
  String timeAgo({TimeAgoFormat format = TimeAgoFormat.long}) {
    final difference = DateTime.now().difference(this);

    if (difference.inSeconds < 60) {
      return format == TimeAgoFormat.short ? 'Ahora' : 'Justo ahora';
    }

    if (difference.inMinutes < 60) {
      return _format(
        value: difference.inMinutes,
        singular: 'minuto',
        plural: 'minutos',
        short: 'min',
        format: format,
      );
    }

    if (difference.inHours < 24) {
      return _format(
        value: difference.inHours,
        singular: 'hora',
        plural: 'horas',
        short: 'h',
        format: format,
      );
    }

    if (difference.inDays < 30) {
      return _format(
        value: difference.inDays,
        singular: 'día',
        plural: 'días',
        short: 'd',
        format: format,
      );
    }

    if (difference.inDays < 365) {
      return _format(
        value: difference.inDays ~/ 30,
        singular: 'mes',
        plural: 'meses',
        short: 'm',
        format: format,
      );
    }

    return _format(
      value: difference.inDays ~/ 365,
      singular: 'año',
      plural: 'años',
      short: 'a',
      format: format,
    );
  }

  String _format({
    required int value,
    required String singular,
    required String plural,
    required String short,
    required TimeAgoFormat format,
  }) {
    if (format == TimeAgoFormat.short) {
      return '$value $short';
    }

    return value == 1 ? 'Hace 1 $singular' : 'Hace $value $plural';
  }
}
