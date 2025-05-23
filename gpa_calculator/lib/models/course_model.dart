class Course {
  final String name;
  final String grade;
  final int creditHours;

  Course({
    required this.name,
    required this.grade,
    required this.creditHours,
  });

// Converting the letter grade to a numeric value
  double get gradeValue {
    switch (grade) {
      case 'A+':
      return 4.0;
      case 'A':
        return 3.9;
      case 'B+':
        return 3.3;
      case 'B':
        return 3.0;
      case 'C+':
        return 2.3;
      case 'C':
        return 2.0;
      case 'D+':
        return 1.3;
      case 'D':
        return 1.0;
      case 'F':
        return 0.0;
      default:
        return 0.0;
    }
  }
}
