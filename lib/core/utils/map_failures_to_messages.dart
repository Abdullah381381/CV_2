//
//
//
//
// import '../error/failures.dart';
// import 'failure_messages.dart';
//
// mixin MapFailuresToMessages {
//   static String map(Failure failure) {
//     String? validationMessage;
//     if (failure is ValidationFailure) {
//       if (failure.errorEntity.errors.isNotEmpty) {
//         for (final Map<String, dynamic> error in failure.errorEntity.errors) {
//           error.forEach(
//             (key, value) => validationMessage = validationMessage != null
//                 ? '${validationMessage!}\n$value'
//                 : '$value',
//           );
//         }
//       }
//     }
//     switch (failure.runtimeType) {
//       case ServerFailure:
//         return getIt<FailureMessages>().serverExceptionMessage;
//       case ParseFailure:
//         return getIt<FailureMessages>().parsingExceptionMessage;
//       case NoDataFailure:
//         return getIt<FailureMessages>().noDataExceptionMessage;
//       case ValidationFailure:
//         return validationMessage ??
//             ((failure as ValidationFailure).errorEntity.message ?? '');
//       case NotFoundFailure:
//         return getIt<FailureMessages>().notFoundExceptionMessage;
//       case VerificationCodeNotValidFailure:
//         return getIt<FailureMessages>()
//             .verificationCodeNotValidExceptionMessage;
//       case NoInternetConnectionFailure:
//         return getIt<FailureMessages>().noInternetConnectionExceptionMessage;
//       case UnAuthorizedFailure:
//         return getIt<FailureMessages>().unAuthorizedExceptionMessage;
//       case NotVerifiedFailure:
//         return getIt<FailureMessages>().notVerifiedExceptionMessage;
//       case NoMessagesFailure:
//         return getIt<FailureMessages>().noMessagesExceptionMessage;
//       default:
//         return getIt<FailureMessages>().unExpectedExceptionMessage;
//     }
//   }
// }
