
import 'package:flutter/material.dart';

import '../../core/resources/colors_app.dart';
import 'text_app.dart';

class ButtonApps extends StatelessWidget{

  // final Function? ontap;
  final GestureTapCallback? ontap;
  final String? textButton;
  const ButtonApps({super.key, this.textButton, this.ontap, this.colorsButton, this.colorsText,
    this.fontSize, this.fontWeight, this.maxWidth, this.maxHeight, this.colorBorder});


  final Color? colorsButton;
  final Color? colorBorder;
  final Color? colorsText;
  final double? fontSize;
  final FontWeight? fontWeight;

  final double? maxWidth;
  final double? maxHeight;
  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: ontap,
      // onTap: (){
      //   print("button");
      // },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // width: 147,
            // height: 45,
            constraints: BoxConstraints(
                maxWidth: maxWidth!,
                maxHeight: maxHeight!
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [BoxShadow(
                    color: colorsButton??primary2Color,
                    // color: Color(0xfffdb813),
                    offset: const Offset(0, 3),
                    blurRadius: 3,
                    spreadRadius: 0
                )
                ],
                border: Border.all(
                  color: colorBorder??Colors.transparent
                ),
                color:colorsButton??primary2Color
            ),


            child: Center(
              child: TextApp(
                text: textButton ?? "",
                color: colorsText,
                fontSize: fontSize,
                fontWeight: fontWeight,

              ),
            ),
          )
        ],
      ),
    );
  }
}