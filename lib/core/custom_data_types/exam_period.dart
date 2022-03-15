// ignore_for_file: constant_identifier_names

class ExamPeriod {
  final int _value;
  const ExamPeriod(this._value);
  const ExamPeriod._internal(this._value);

  static const January = ExamPeriod._internal(1);
  static const June = ExamPeriod._internal(2);
  static const September = ExamPeriod._internal(3);
  static const Undefined = ExamPeriod._internal(-1);

  Map<String, int> toMap() {
    return {
      'type': _value,
    };
  }

  factory ExamPeriod.fromMap(Map<String, int> map) {
    return ExamPeriod._internal(map['type'] ?? -1);
  }

  int toInt() {
    return _value;
  }

  @override
  String toString() {
    switch (_value) {
      case 1:
        return "Ιανουρίου";
      case 2:
        return "Ιουνίου";
      case 3:
        return "Σεπτεμβρίου";
      default:
        return "Απροσδιόριστο";
    }
  }
}
