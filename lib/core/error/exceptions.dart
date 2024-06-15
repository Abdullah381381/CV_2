



import '../../domain/entities/error_entity.dart';

dynamic exceptionHandling({required int statusCode}) {
// dynamic exceptionHandling(Response response) {
  switch (statusCode) {
  // switch (response.statusCode) {
    case 400:
      throw BadRequestException();
    case 401:
      throw UnAuthorizedException();
    case 403:
      throw UnAuthorizedException();
    case 500:
      throw ServerException();
    case 404:
      throw NotFoundException();
    default:
      throw ServerException();
  }
}




class BadRequestException implements Exception {
  // BadRequestException({this.msg});
  // String ? msg;
}
// class UnauthorisedException implements Exception {
//   // UnauthorisedException({this.msg});
//   // String ? msg;
// }
//
// class UnauthorisedException implements Exception {}


class ServerException implements Exception {}

class CacheException implements Exception {}

class ParseException implements Exception {}

class NoDataException implements Exception {}

class NoMessagesException implements Exception {}

class UnAuthorizedException implements Exception {}

class ValidationException implements Exception {
  final ErrorEntity errorEntity;
  ValidationException({required this.errorEntity});
}

class NotFoundException implements Exception {}

class NotVerifiedException implements Exception {}

class VerificationCodeNotValidException implements Exception {}

class NoDeepLinkingFoundException implements Exception {}
