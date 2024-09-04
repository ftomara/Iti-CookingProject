class Time {
  const Time({required this.hours, required this.min});
  final int hours;
  final int min;

  @override
  String toString() {
    return hours != 0 ? '$hours hrs $min mins' : '$min mins';
  }
}
