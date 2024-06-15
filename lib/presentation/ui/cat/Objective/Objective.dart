class Objective {
  int? id;
  int categoryId;
  String objective;

  Objective({
    this.id,
    required this.categoryId,
    required this.objective,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'categoryId': categoryId,
      'objective': objective,
    };
  }
}