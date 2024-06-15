class Reference {
   int? id;
  final String name;
  final String university;
  final String phone;
  final String email;
  final int categoryId;

  Reference({this.id, required this.name, required this.university, required this.phone, required this.email, required this.categoryId});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'university': university,
      'phone': phone,
      'email': email,
      'categoryId': categoryId,
    };
  }
}
