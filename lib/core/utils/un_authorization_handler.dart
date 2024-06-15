import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cv_project/core/utils/dialogs.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../presentation/ui/auth/login.dart';
import '../error/failures.dart';

mixin UnAuthorizationHandler {
  static void handle(BuildContext context, Failure failure) {
    if (failure is UnAuthorizedFailure) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Dialogs.showWarningDialog(context, S.of(context).sessionExpired,
            S.of(context).sessionExpiredDescription, (DismissType? type) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (ctx) => const Login()),
            (route) => false,
          );
        });
      });
    }
  }

  static void handleGuest(
    BuildContext context,
  ) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Dialogs.showLoginWarningDialog(
        context,
        S.of(context).loginToShowDetails,
        S.of(context).loginToShowDetailsDescription,
        () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (ctx) => const Login()),
          );
        },
        (DismissType? type) {},
      );
    });
  }
}
