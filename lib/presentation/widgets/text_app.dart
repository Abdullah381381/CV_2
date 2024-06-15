import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class TextApp extends StatelessWidget{

  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? text ;
  final TextAlign? textAlign ;
  final int? maxLines;
  final bool? underLine;
  final FontStyle? fontStyle;

  const TextApp({super.key, this.color, this.fontSize, this.fontWeight, this.text, this.textAlign, this.maxLines, this.underLine, this.fontStyle});

  @override
  Widget build(BuildContext context) {
    return Text(
       text??"",
        maxLines: maxLines?? 1,
        textAlign: textAlign ?? TextAlign.center,
        overflow: TextOverflow.ellipsis,
        textDirection: intl.Intl.defaultLocale=="ar"? TextDirection.rtl:TextDirection.ltr,
        style: TextStyle(
          fontFamily: 'Roboto',
          color:color,
          fontSize: fontSize,
          fontWeight: fontWeight ?? FontWeight.w400,
          fontStyle: fontStyle??FontStyle.normal,
          decoration: underLine!=null? TextDecoration.lineThrough :TextDecoration.none
        ),
    );
  }
}