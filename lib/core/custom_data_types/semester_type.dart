// ignore_for_file: constant_identifier_names

class SemesterType {
  final int _value;
  const SemesterType(this._value);
  const SemesterType._internal(this._value);

  static const Winter = SemesterType._internal(1);
  static const Spring = SemesterType._internal(2);
  static const Undefined = SemesterType._internal(-1);

  Map<String, int> toMap() {
    return {
      'type': _value,
    };
  }

  factory SemesterType.fromMap(Map<String, int> map) {
    return SemesterType._internal(map['type'] ?? -1);
  }

  int toInt() {
    return _value;
  }

  @override
  String toString() {
    switch (_value) {
      case 1:
        return "Χειμερινό";
      case 2:
        return "Εαρινό";
      default:
        return "Απροσδιόριστο";
    }
  }
}
