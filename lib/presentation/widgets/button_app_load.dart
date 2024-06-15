
import 'package:flutter/material.dart';


class ButtonAppsLoad extends StatelessWidget{

  // final Function? ontap;
  final GestureTapCallback? ontap;
  final String? textButton;
  const ButtonAppsLoad({super.key, this.textButton, this.ontap, this.colorsButton, this.colorsText,
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
                borderRadius: BorderRadius.circular(5),
                // boxShadow: const [BoxShadow(
                //     color: Color(0xfffdb813),
                //     offset: Offset(0, 3),
                //     blurRadius: 10,
                //     spreadRadius: 0
                // )
                // ],
                color: colorsButton??const Color(0xfff7941d)
            ),


            child: const Center(
              child:  CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}