import 'dart:typed_data';

class PersonalDetails {
  int? id;
  int categoryId;
  String name;
  String address;
  String email;
  String phone;
  String notes;
  Uint8List photo; // Store photo as bytes

  PersonalDetails({
    this.id,
    required this.categoryId,
    required this.name,
    required this.notes,
    required this.address,
    required this.email,
    required this.phone,
    required this.photo,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'categoryId': categoryId,
      'name': name,
      'address': address,
      'email': email,
      'phone': phone,
      'notes': notes,
      'photoBytes': photo, // Save photo as bytes
    };
  }
}
