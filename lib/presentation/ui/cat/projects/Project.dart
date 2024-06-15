class Project {
  int? id;
  int categoryId;
  String title;
  String description;

  Project({
    this.id,
    required this.categoryId,
    required this.title,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'categoryId': categoryId,
      'title': title,
      'description': description,
    };
  }
}
