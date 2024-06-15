import 'package:cv_project/presentation/ui/auth/splach_screen.dart';
import 'package:flutter/material.dart';

mixin Go {
  static void to({required BuildContext context, required Widget page}) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => page),
    );
  }

  static void toHomeAndRemmoveAllScreen({required BuildContext context, required Widget page}) {
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
        page), (Route<dynamic> route) => false);
  }


  static void back({required BuildContext context}) {
    Navigator.pop(context);
  }

  static void toNamed({required BuildContext context, required String page}) {
    Navigator.pushNamed(
      context,
      page,
    );
  }

  static void toReplacement({
    required BuildContext context,
    required Widget page,
  }) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (ctx) => page),
    );
  }

  static void toWithClearUntilPage({
    required BuildContext context,
    required String page,
  }) {
    Navigator.popUntil(
      context,
      ModalRoute.withName(page),
    );
  }

  static void bottomUpTo({
    required BuildContext context,
    required Widget page,
  }) {

    Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => page),
    );
    // Navigator.push(
    //   context,
    //   BottomToTopRoute(page: page),
    // );
  }



  static void logOut({
    required BuildContext context,
  }) async{
    Go.toHomeAndRemmoveAllScreen(context: context, page: const SplachScreen());
  }
}
