class Skill {
  int? id;
  int categoryId;
  String name;
  int level;

  Skill({this.id, required this.categoryId, required this.name, required this.level});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'categoryId': categoryId,
      'name': name,
      'level': level,
    };
  }
}