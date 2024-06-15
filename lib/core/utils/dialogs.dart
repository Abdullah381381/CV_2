import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../presentation/widgets/text_app.dart';
import '../resources/colors_app.dart';


mixin Dialogs {
  // ? Function to Show Error Dialog
  static void showErrorDialog(
    BuildContext context,
    String title,
    String description,
    Function(DismissType dismissType) cancelCallback,
  ) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.bottomSlide,
      // animType: AnimType.BOTTOMSLIDE,
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: TextApp(
                      text: title,
                      color: Colors.red,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextApp(
                    text: description,
                    color: lightBlackColor,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      btnCancelText: S.of(context).ok,
      btnCancelOnPress: () {},
      // onDissmissCallback: cancelCallback,
    ).show();
  }

  // ? Function to Show Warning Dialog
  static void showWarningDialog(
    BuildContext context,
    String title,
    String description,
    Function(DismissType? dismissType) onDismissCallback,
  ) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.bottomSlide,
      useRootNavigator: true,
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: TextApp(
                      text: title,
                      color: Colors.red,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextApp(
                    text: description,
                    color: lightBlackColor,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      btnCancelText: S.of(context).ok,
      btnCancelOnPress: () {},
      // onDissmissCallback: onDismissCallback,
    ).show();
  }

  // ? Function to Show Login Warning Dialog
  static void showLoginWarningDialog(
    BuildContext context,
    String title,
    String description,
    Function() onLoginCallback,
    Function(DismissType? dismissType) onDismissCallback,
  ) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.bottomSlide,
      useRootNavigator: true,
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: TextApp(
                      text: title,
                      color: Colors.red,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextApp(
                    text: description,
                    color: lightBlackColor,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      btnOkText: S.of(context).login,
      btnOkOnPress: onLoginCallback,
      // onDissmissCallback: onDismissCallback,
    ).show();
  }

  // ? Function to Show Success Dialog
  static void showSuccessDialog(
    BuildContext context,
    String title,
    String description,
    Function(DismissType) onDismiss,
  ) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.bottomSlide,
      useRootNavigator: true,
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: TextApp(
                      text: title,
                      color: Colors.green,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextApp(
                    text: description,
                    color: lightBlackColor,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      btnOkText: S.of(context).ok,
      btnOkOnPress: () {},
      // onDissmissCallback: onDismiss,
    ).show();
  }

  // ? Function to Show Confirmation Dialog
  static void showConfirmationDialog(
    BuildContext context,
    String title,
    String description,
    Function()? okCallBack,
  ) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.question,
      animType: AnimType.bottomSlide,
      useRootNavigator: true,
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: TextApp(
                      text: title,
                      color: Colors.red,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextApp(
                    text: description,
                    color: lightBlackColor,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      btnOkText: S.of(context).yes,
      btnOkOnPress: okCallBack,
      btnCancelText: S.of(context).no,
      btnCancelOnPress: () {},
      // onDissmissCallback: (DismissType type) {},
    ).show();
  }
}
