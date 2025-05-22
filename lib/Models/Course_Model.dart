class Course {
  final String name; // Course name
  final String grade; // Letter grade 
  final int credit; // Credit hours

  Course({
    required this.name,
    required this.grade,
    required this.credit,
  });

  // Converts letter grade to grade point
  double get gradePoint {
    const gradeMap = {
      'A+': 5.0,
      'A': 4.75,
      'B+': 4.5,
      'B': 4.0,
      'C+': 3.5,
      'C': 3.0,
      'D+': 2.5,
      'D': 2.0,
      'F': 1.0,
    };
    return gradeMap[grade] ?? 0.0; // Fallback to 0.0 if grade not found
  }
}
