// Model class representing a subject for GPA calculation.
// Holds the subject's name, credit hours, and grade.

class GpaCalculatorModel {
  final String subjectName;
  final double subjectHours;
  final double subjectGrade;

  GpaCalculatorModel({
    required this.subjectHours,
    required this.subjectName,
    required this.subjectGrade,
  });
}
