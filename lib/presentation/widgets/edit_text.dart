
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class EditText extends StatelessWidget{

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
  final Widget? icons;
  final bool? border;
  final TextEditingController? controller;

  const EditText({super.key, this.obscureText, this.icons,  this.maxLengthString, this.labelText,
    this.hintText, this.onChanged, this.validator, this.textInputType, this.numLine, this.enabled, this.controller,
    this.maxLine, this.border,});

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
        labelText: labelText ?? "",
        hintText: hintText ?? "",
        fillColor: const Color(0xffFFFFFF).withOpacity(.133),
        filled: true,

        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        enabledBorder: border==false?InputBorder.none:const UnderlineInputBorder(
          borderSide: BorderSide(color:  Color(0x58abb4bd)),
        ),
        focusedBorder:border==false?InputBorder.none: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xfff7941d)),
        ),

        border: InputBorder.none,

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