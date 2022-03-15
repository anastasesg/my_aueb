// ignore_for_file: constant_identifier_names

class ScheduleType {
  final int _value;
  const ScheduleType(this._value);
  const ScheduleType._internal(this._value);

  static const Theory = ScheduleType._internal(1);
  static const Lab = ScheduleType._internal(2);
  static const Exam = ScheduleType._internal(3);
  static const Undefined = ScheduleType._internal(-1);

  Map<String, int> toMap() {
    return {
      'type': _value,
    };
  }

  factory ScheduleType.fromMap(Map<String, int> map) {
    return ScheduleType._internal(map['type'] ?? -1);
  }

  int toInt() {
    return _value;
  }
}
