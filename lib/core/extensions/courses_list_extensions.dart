import 'package:my_aueb/data/models/course.dart';

extension CourseCredits on List<Course> {
  double getCredits() {
    return map((e) => e.subject.credits).toList().fold(0, (previous, current) => previous + current);
  }

  double getActualCredits() {
    return 0.0;
  }
}
