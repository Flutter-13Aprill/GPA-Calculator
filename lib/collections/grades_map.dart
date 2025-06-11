class GradesMap {
  static const Map<String, double> _grades = {
    "A+": 5.0,
    "A": 4.75,
    "B+": 4.5,
    "B": 4.0,
    "C+": 3.5,
    "C": 3.0,
    "D+": 2.5,
    "D": 2.0,
    "F": 1.0,
  };

  Map getGradesMap() {
    return _grades;
  }

  double getGradeScore(String alphaGrade) {
    switch (alphaGrade) {
      case "A+":
        return _grades[alphaGrade]!;

      case "A":
        return _grades[alphaGrade]!;

      case "B+":
        return _grades[alphaGrade]!;

      case "B":
        return _grades[alphaGrade]!;

      case "C+":
        return _grades[alphaGrade]!;

      case "C":
        return _grades[alphaGrade]!;

      case "D+":
        return _grades[alphaGrade]!;

      case "D":
        return _grades[alphaGrade]!;

      case "F":
        return _grades[alphaGrade]!;

      default:
        print(
          "data is wrong at either the controller to get the grade or the switch statemnt",
        );
        return 0;
    }
  }
}
