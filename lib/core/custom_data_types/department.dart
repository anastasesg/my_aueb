// ignore_for_file: constant_identifier_names

class Department {
  final int _value;
  const Department(this._value);
  const Department._internal(this._value);

  static const CS = Department._internal(1);
  static const DET = Department._internal(2);
  static const OE = Department._internal(3);
  static const DEOS = Department._internal(4);
  static const ODE = Department._internal(5);
  static const ME = Department._internal(6);
  static const LOXR = Department._internal(7);
  static const STAT = Department._internal(8);
  static const Undefined = Department._internal(-1);

  Map<String, int> toMap() {
    return {
      'type': _value,
    };
  }

  factory Department.fromMap(Map<String, int> map) {
    return Department._internal(map['type'] ?? -1);
  }

  int toInt() {
    return _value;
  }

  @override
  String toString() {
    switch (_value) {
      case 1:
        return "Τμήμα Πληροφορικής";
      case 2:
        return "Τμήμα Διοικητικής Επιστήμης και Τεχνολογίας";
      case 3:
        return "Τμήμα Οικονομικής Επιστήμης";
      case 4:
        return "Τμήμα Διεθνών και Ευρωπαϊκών Οικονομικών Σπουδών";
      case 5:
        return "Τμήμα Οργάνωσης και Διοίκησης Επιχειρήσεων";
      case 6:
        return "Τμήμα Μάρκετινγκ και Επικοινωνίας";
      case 7:
        return "Τμήμα Λογιστικής και Χρηματοοικονομικής";
      case 8:
        return "Τμήμα Στατιστικής";
      default:
        return "Απροσδιόριστο";
    }
  }
}
