class Experience {
  int? id;
  int categoryId;
  String companyName;
  String jobTitle;
  DateTime startDate;
  DateTime endDate;
  String details;

  Experience({
    this.id,
    required this.categoryId,
    required this.companyName,
    required this.jobTitle,
    required this.startDate,
    required this.endDate,
    required this.details,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'categoryId': categoryId,
      'companyName': companyName,
      'jobTitle': jobTitle,
      'startDate': startDate.millisecondsSinceEpoch,
      'endDate': endDate.millisecondsSinceEpoch,
      'details': details,
    };
  }
}