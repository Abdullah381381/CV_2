

import '../../generated/l10n.dart';
import 'navigator_service.dart';

class FailureMessages {
  String get serverExceptionMessage =>
      navigatorKey.currentState?.context != null
          ? S.of(navigatorKey.currentState!.context).serverExceptionMsg
          : 'Error in Fetching Data';
  String get parsingExceptionMessage =>
      navigatorKey.currentState?.context != null
          ? S.of(navigatorKey.currentState!.context).parseExceptionMsg
          : 'Error in Parsing Content';
  String get noDataExceptionMessage =>
      navigatorKey.currentState?.context != null
          ? S.of(navigatorKey.currentState!.context).noDataExceptionMsg
          : 'No Data Found';
  String get noInternetConnectionExceptionMessage =>
      navigatorKey.currentState?.context != null
          ? S
              .of(navigatorKey.currentState!.context)
              .noInternetConnectionExceptionMsg
          : 'No Internet Connection';
  String get unExpectedExceptionMessage =>
      navigatorKey.currentState?.context != null
          ? S.of(navigatorKey.currentState!.context).unExpectedExceptionMsg
          : 'Unexpected Error';

  String get notFoundExceptionMessage =>
      navigatorKey.currentState?.context != null
          ? S.of(navigatorKey.currentState!.context).notFoundExceptionMessage
          : 'Requested Data Not Found';

  String get verificationCodeNotValidExceptionMessage =>
      navigatorKey.currentState?.context != null
          ? S
              .of(navigatorKey.currentState!.context)
              .verificationCodeNotValidExceptionMessage
          : 'Verification Code Not Valid';
  String get unAuthorizedExceptionMessage =>
      navigatorKey.currentState?.context != null
          ? S
              .of(navigatorKey.currentState!.context)
              .unAuthorizedExceptionMessage
          : 'You are not Authorized';



  String get notVerifiedExceptionMessage =>
      navigatorKey.currentState?.context != null
          ? S.of(navigatorKey.currentState!.context).notVerifiedExceptionMessage
          : 'You are not Verified';

  String get noMessagesExceptionMessage =>
      navigatorKey.currentState?.context != null
          ? S.of(navigatorKey.currentState!.context).noMessagesExceptionMessage
          : 'No Messages';
}
