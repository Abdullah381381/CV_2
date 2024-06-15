class Education {
  int? id;
  int categoryId;
  String courseOrDegree;
  String schoolOrUniversity;
  String grade;
  DateTime year;

  Education({
    this.id,
    required this.categoryId,
    required this.courseOrDegree,
    required this.schoolOrUniversity,
    required this.grade,
    required this.year,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'categoryId': categoryId,
      'courseOrDegree': courseOrDegree,
      'schoolOrUniversity': schoolOrUniversity,
      'grade': grade,
      'year': year.millisecondsSinceEpoch,
    };
  }
}