import 'dart:io';

import 'package:equatable/equatable.dart';

import '../../domain/entities/error_entity.dart';
import 'exceptions.dart';

abstract class Failure extends Equatable {}

// * ------------------------------------------- Failures --------------------------------------------- * //



dynamic failureHandling({statusCode}) {
// dynamic exceptionHandling(Response response) {
  switch (statusCode) {
    
  // switch (response.statusCode) {
    case UnAuthorizedException:
      throw UnAuthorizedFailure();
    case NoDataException:
      throw NoDataFailure();
    case SocketException:
      throw NoInternetConnectionFailure();
    case ParseException:
      throw ParseFailure();
    case NotFoundException:
      throw NotFoundFailure();
    // case 404:
    //   throw NotFoundException();
    default:
      throw ParseFailure();
  }
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class CacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class UnAuthorizedFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class InvalidInputFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ParseFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class NoDataFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class NoInternetConnectionFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ValidationFailure extends Failure {
  final ErrorEntity errorEntity;
  ValidationFailure({required this.errorEntity});
  @override
  List<Object?> get props => [];
}

class NotFoundFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class NoMessagesFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class NotVerifiedFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class VerificationCodeNotValidFailure extends Failure {
  @override
  List<Object?> get props => [];
}
