// ignore_for_file: constant_identifier_names

enum Day {
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
  Friday,
  Saturday,
  Undefined,
}

extension DayExtension on Day {
  int toInt() {
    return 0;
  }

  Day fromInt(int value) {
    switch (value) {
      case 1:
        return Day.Monday;
      case 2:
        return Day.Tuesday;
      case 3:
        return Day.Wednesday;
      case 4:
        return Day.Thursday;
      case 5:
        return Day.Friday;
      case 6:
        return Day.Saturday;
      default:
        return Day.Undefined;
    }
  }

  String getName() {
    switch (this) {
      case Day.Monday:
        return "Δευτέρα";
      case Day.Tuesday:
        return "Τρίτη";
      case Day.Wednesday:
        return "Τετάρτη";
      case Day.Thursday:
        return "Πέμπτη";
      case Day.Friday:
        return "Παρασκευή";
      case Day.Saturday:
        return "Σάββατο";
      default:
        return "Απροσδιόριστο";
    }
  }

  String getByDay() {
    switch (this) {
      case Day.Monday:
        return "MO";
      case Day.Tuesday:
        return "TU";
      case Day.Wednesday:
        return "WE";
      case Day.Thursday:
        return "TH";
      case Day.Friday:
        return "FR";
      default:
        return " ";
    }
  }
}

// class Day {
//   final int _value;
//   const Day(this._value);
//   const Day._internal(this._value);

//   static const Monday = Day._internal(1);
//   static const Tuesday = Day._internal(2);
//   static const Wednesday = Day._internal(3);
//   static const Thursday = Day._internal(4);
//   static const Friday = Day._internal(5);
//   static const Saturday = Day._internal(6);
//   static const Undefined = Day._internal(-1);

//   Map<String, int> toMap() {
//     return {
//       'type': _value,
//     };
//   }

//   factory Day.fromMap(Map<String, int> map) {
//     return Day._internal(map['type'] ?? -1);
//   }

//   int toInt() {
//     return _value;
//   }

//   @override
  // String toString() {
  //   switch (_value) {
  //     case 1:
  //       return "Δευτέρα";
  //     case 2:
  //       return "Τρίτη";
  //     case 3:
  //       return "Τετάρτη";
  //     case 4:
  //       return "Πέμπτη";
  //     case 5:
  //       return "Παρασκευή";
  //     case 6:
  //       return "Σάββατο";
  //     default:
  //       return "Απροσδιόριστο";
  //   }
  // }

  // String toByDay() {
  //   switch (_value) {
  //     case 1:
  //       return "MO";
  //     case 2:
  //       return "TU";
  //     case 3:
  //       return "WE";
  //     case 4:
  //       return "TH";
  //     case 5:
  //       return "FR";
  //     default:
  //       return " ";
  //   }
  // }
// }
