// ignore_for_file: avoid_renaming_method_parameters

import 'package:flutter/material.dart';

class BottomToTopRoute extends PageRouteBuilder {
  final Widget? page;
  BottomToTopRoute({required Widget this.page, super.settings})
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
    final Animation<Offset> slideAnimationPage =
        Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero)
            .animate(animation);
    return Stack(
      children: <Widget>[
        SlideTransition(position: slideAnimationPage, child: currentPage),
      ],
    );
  }
}
