import 'package:flutter/material.dart';

class HidenKeyBoard extends StatefulWidget {
  final Widget widgetScreen;
  const HidenKeyBoard({super.key, required this.widgetScreen});

  @override
  State<HidenKeyBoard> createState() => _HidenKeyBoardState();
}

class _HidenKeyBoardState extends State<HidenKeyBoard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
      FocusManager.instance.primaryFocus?.unfocus();
    },
    child:widget.widgetScreen
    );
  }
}
