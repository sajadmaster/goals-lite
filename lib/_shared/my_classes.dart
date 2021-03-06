extension DateOnlyCompareItem on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  bool isAfterDate(DateTime other) {
    return year >= other.year && month >= other.month && day >= other.day;
  }

  bool isBeforeDate(DateTime other) {
    return year <= other.year && month <= other.month && day <= other.day;
  }
}

String removeDecimalZeroFormat(double n) {
  return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 1);
}
