// ignore_for_file: avoid_renaming_method_parameters

import 'package:flutter/material.dart';

class FadeInFadeOutRoute extends PageRouteBuilder {
  final Widget? page;
  FadeInFadeOutRoute({required Widget this.page, super.settings})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
        );

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget currentPage,
  ) {
    final Animation<double> showHideAnimationPage =
        Tween<double>(begin: 0, end: 1).animate(animation);
    return Stack(
      children: <Widget>[
        FadeTransition(
          opacity: showHideAnimationPage,
          child: FadeTransition(
            opacity:
                Tween<double>(begin: 1, end: 0).animate(secondaryAnimation),
            child: currentPage,
          ),
        ),
      ],
    );
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 150);
}
