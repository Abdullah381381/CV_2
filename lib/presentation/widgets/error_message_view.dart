import 'package:cv_project/presentation/widgets/import_all.dart';
import '../../generated/l10n.dart';

class ErrorMessageView extends StatelessWidget {
  final String errorMessage;
  const ErrorMessageView({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
      EdgeInsets.only(top: MediaQuery.of(context).size.height / 6),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: TextApp(
          text:
          errorMessage.toString()=="NotFoundException()"?S.of(context).notFoundExceptionMessage:
          errorMessage.toString()=="VerificationCodeNotValidException()"?S.of(context).verificationCodeNotValidExceptionMessage:
          errorMessage.toString()=="NotVerifiedException()"?S.of(context).notVerifiedExceptionMessage:
          errorMessage.toString()=="NoMessagesException()"?S.of(context).noMessagesExceptionMessage:

          errorMessage.toString()=="UnAuthorizedException()"?S.of(context).unAuthorizedExceptionMessage:
          errorMessage.toString()=="UnAuthorizedFailure()"?S.of(context).unAuthorizedExceptionMessage:

          errorMessage.toString()=="ServerException()"?S.of(context).serverExceptionMsg:
          errorMessage.toString()=="ServerFailure()"?S.of(context).serverExceptionMsg:

          errorMessage.toString()=="ParseException()"?S.of(context).parseExceptionMsg:

          errorMessage.toString()=="ParseException()"?S.of(context).parseExceptionMsg:

          errorMessage.toString()=="NoDataFailure()"?S.of(context).serverExceptionMsg:
          errorMessage.toString()=="ParseFailure()"?S.of(context).serverExceptionMsg:

          errorMessage.toString()=="NoDataException()"?S.of(context).noDataExceptionMsg:
          errorMessage.toString()=="CacheFailure()"?S.of(context).noDataExceptionMsg:
          errorMessage.toString()=="UnExpectedException()"?S.of(context).unExpectedExceptionMsg:
          errorMessage.toString()=="NoInternetConnectionFailure()"?S.of(context).noInternetConnectionExceptionMsg:
          errorMessage
          ,
          color: Colors.black,
          maxLines: 4,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w700,
          fontSize: 18,
        ),
      ),
    );
  }
}
