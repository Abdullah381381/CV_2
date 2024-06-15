import 'package:equatable/equatable.dart';

class ErrorEntity extends Equatable {
  final bool? status;
  final int? code;
  final String? message;
  final List<Map<String, dynamic>> errors;


  const ErrorEntity({
    required this.status,
    required this.code,
    required this.message,
    required this.errors,
  });

  @override
  List<Object?> get props => [status, code, message, errors];
}
