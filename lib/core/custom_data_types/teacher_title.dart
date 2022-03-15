// ignore_for_file: constant_identifier_names

class TeacherTitle {
  final int _value;
  const TeacherTitle(this._value);
  const TeacherTitle._internal(this._value);

  static const Professor = TeacherTitle._internal(1);
  static const ReplacementProfessor = TeacherTitle._internal(2);
  static const AssistantProfessor = TeacherTitle._internal(3);
  static const PeerProfessor = TeacherTitle._internal(4);
  static const LabProfessor = TeacherTitle._internal(5);
  static const SpecialLabProfessor = TeacherTitle._internal(6);
  static const AcademicFellow = TeacherTitle._internal(7);
  static const PD407ContractTeacher = TeacherTitle._internal(8);
  static const ContractTeacher = TeacherTitle._internal(9);
  static const Undefined = TeacherTitle._internal(-1);

  Map<String, int> toMap() {
    return {
      'type': _value,
    };
  }

  factory TeacherTitle.fromMap(Map<String, int> map) {
    return TeacherTitle._internal(map['type'] ?? -1);
  }

  int toInt() {
    return _value;
  }

  @override
  String toString() {
    switch (_value) {
      case 1:
        return "Καθηγητής";
      case 2:
        return "Αναπληρωτής Καθηγητής";
      case 3:
        return "Επίκουρος Καθηγητής";
      case 4:
        return "Ομότιμος Καθηγητής";
      case 5:
        return "Εργαστηριακό Διδακτικό Προσωπικό";
      case 6:
        return "Ειδικό Τεχνικό Εργαστηριακό Προσωπικό";
      case 7:
        return "Ακαδημαϊκός Υπότροφος";
      case 8:
        return "Διδάσκων Π.Δ. 407/80";
      case 9:
        return "Συμβασιούχοι Διδάσκοντες (ΕΣΠΑ)";
      default:
        return "Απροσδιόριστο";
    }
  }
}
