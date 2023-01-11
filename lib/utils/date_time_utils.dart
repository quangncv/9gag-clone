class DateTimeUtils {
  String distanceToNow(int from) {
    final currentSecond = DateTime.now().millisecondsSinceEpoch / 1000;
    final distance = currentSecond - from;

    if (distance ~/ 60 < 60) {
      return '${distance ~/ 60}m';
    }

    if (distance ~/ 3600 < 24) {
      return '${distance ~/ 3600}h';
    }

    return '${distance ~/ 86400}d';
  }
}