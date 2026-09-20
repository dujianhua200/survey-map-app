extension StringExtension on String {
  String truncate(int maxLength, {String suffix = '...'}) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength)}$suffix';
  }
}

extension DoubleExtension on double {
  double roundTo(int decimalPlaces) {
    final mod = 10.0 * decimalPlaces;
    return ((this * mod).roundToDouble() / mod);
  }
}
