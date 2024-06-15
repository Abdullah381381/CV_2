
import 'package:cv_project/core/resources/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class EditTextBorder extends StatelessWidget{

  final bool? obscureText;
  final bool? enabled;
  final String? labelText;
  final String? hintText;
  final TextInputType? textInputType;
  final ValueChanged<String>? onChanged;
  // final Function? onChanged;
  final FormFieldValidator<String>? validator;
  // final Function? validator;
  final int? numLine;
  final int? maxLine;
  final int? maxLengthString;
  // final bool? border;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final double? borderRadius;

  const EditTextBorder({super.key, this.obscureText, this.suffixIcon,  this.maxLengthString, this.labelText,
    this.hintText, this.onChanged, this.validator, this.textInputType, this.numLine, this.enabled, this.controller,
    this.maxLine, this.prefixIcon,  this.focusNode, this.borderRadius,});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      enabled: enabled??true,
      minLines: numLine??1 ,
      maxLines: maxLine ?? 200,
      obscureText: obscureText!,
      onChanged: onChanged,
      validator:  validator,
      maxLength: maxLengthString,

      inputFormatters: textInputType==TextInputType.phone||textInputType==TextInputType.number?[
        FilteringTextInputFormatter.allow(RegExp("[0-9]")),
      ]:null,
      controller: controller,
      cursorColor:const Color(0xff212660),
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      keyboardType: textInputType,


      decoration: InputDecoration(
        fillColor:Colors.grey.withOpacity(.12),
        // fillColor: focusNode.hasFocus ?primary2Color.withOpacity(.4):Colors.grey.withOpacity(.12),
        focusColor:Colors.grey.withOpacity(.12),
        hoverColor:Colors.grey.withOpacity(.12),
        filled: true,

        labelText: labelText ?? "",
        hintText: hintText ?? "",
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),

        disabledBorder:
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius??15.0),
          borderSide:  BorderSide(
            color: Colors.grey.withOpacity(.2),
          ),
        ),

        enabledBorder:
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius??15.0),
          borderSide:  BorderSide(
            color:Colors.grey.withOpacity(.12),
          ),
        ),
        focusedBorder:
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius??15.0),
          borderSide: BorderSide(
            color:primary2Color.withOpacity(.4),
          ),
        ),

        border:
        const OutlineInputBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(5),
              topLeft: Radius.circular(5),
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5)
          ),
        ),

        suffixIcon:suffixIcon==null?null: IconButton(
          icon: suffixIcon! ,
          // color:  focusNode?.hasFocus ?primary2Color:Colors.black,
          onPressed: null,
        ),

        prefixIcon:prefixIcon==null?null: IconButton(
          icon: prefixIcon! ,
          onPressed: null,
        ),

        labelStyle:  const TextStyle(
          fontFamily: 'Roboto',
          color: Color(0xffabb4bd),
          fontSize: 13,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        hintStyle: const TextStyle(
          fontFamily: 'Roboto',
          color: Color(0xffabb4bd),
          fontSize: 13,
          fontWeight: FontWeight.w400,
        ),
      ),
      style: const TextStyle(
        fontFamily: 'Roboto',
        color: Colors.black,
        fontSize: 13,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
    );
  }

}