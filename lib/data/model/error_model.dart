
import '../../domain/entities/error_entity.dart';

class ErrorModel extends ErrorEntity {
  const ErrorModel({
    required super.status,
    required super.code,
    required super.message,
    required super.errors,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
        status: json['status'] == true,
        code: int.tryParse(json['code'].toString()),
        message: (json['msg'] ?? json['message']).toString(),
        errors: json['errors'] != null
            ? (json['errors'] as List<dynamic>)
                .map((e) => e as Map<String, dynamic>)
                .toList()
            : [],
      );
}
