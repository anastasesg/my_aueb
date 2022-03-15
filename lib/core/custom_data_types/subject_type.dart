// ignore_for_file: constant_identifier_names

class SubjectType {
  final int _value;
  const SubjectType(this._value);
  const SubjectType._internal(this._value);

  static const Required = SubjectType._internal(1);
  static const Freechoice = SubjectType._internal(2);
  static const Undefined = SubjectType._internal(-1);

  Map<String, int> toMap() {
    return {
      'type': _value,
    };
  }

  factory SubjectType.fromMap(Map<String, int> map) {
    return SubjectType._internal(map['type'] ?? -1);
  }

  int toInt() {
    return _value;
  }

  @override
  String toString() {
    switch (_value) {
      case 1:
        return "Υποχρεωτικό";
      case 2:
        return "Επιλογής";
      default:
        return "Απροσδιόριστο";
    }
  }
}
