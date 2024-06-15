




import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cv_project/generated/l10n.dart';
import 'package:cv_project/presentation/widgets/button_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../presentation/ui/auth/login.dart';
import '../../presentation/widgets/go.dart';
import '../../presentation/widgets/text_app.dart';
import '../resources/colors_app.dart';

class DialogLoadApp{

  static load(context){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: Container(
          width: 80.0,
          height: 80.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: CupertinoActivityIndicator(),
          ),
        ),
      ),
    );

  }


  static closeDilog({required bool back,required String text,required BuildContext context,DialogType? dialogType}){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      AwesomeDialog(
        width: 400,
        context: context,
        animType: AnimType.scale,
        dialogType: dialogType??DialogType.error,
        dismissOnTouchOutside: false,
        body:  Center(child: TextApp(
          text:text,
          maxLines: 3,
          textAlign: TextAlign.center,
          color: blackColor,
          fontSize: 17,
          fontWeight: FontWeight.w700,
        ),),
        btnCancelColor: const Color(0xff00adbb),
        btnOkColor:  const Color(0xff00adbb),
        headerAnimationLoop: false,
        btnOkOnPress: () {
          if(back==true){
            Navigator.pop(context);
          }
        },
      ).show();
    });
  }


  static  requestReviewApp(){
    // final InAppReview inAppReview = InAppReview.instance;
    // (<T>(T? o) => o!)(WidgetsBinding.instance).addPostFrameCallback((_) async {
    //   try {
    //     final isAvailable = await inAppReview.isAvailable();
    //
    //     // print(isAvailable);
    //     // print(_inAppReview.requestReview());
    //
    //     if(isAvailable ){
    //       inAppReview.requestReview();
    //     }
    //
    //     // setState(() {
    //     //   // This plugin cannot be tested on Android by installing your app
    //     //   // locally. See https://github.com/britannio/in_app_review#testing for
    //     //   // more information.
    //     //   _availability = isAvailable && !Platform.isAndroid
    //     //       ? Availability.available
    //     //       : Availability.unavailable;
    //     // });
    //   } catch (_) {
    //     // print("------>");
    //     // setState(() => _availability = Availability.unavailable);
    //   }
    // });
  }

  static paymentDilog({
    required bool back,required String text,
    required Function()? btnOkOnPress,
    bool? autoDismiss,
    required BuildContext context,DialogType? dialogType}){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      AwesomeDialog(
        width: 400,
        context: context,
        // autoDismiss: autoDismiss??false,
        animType: AnimType.scale,
        dismissOnTouchOutside: autoDismiss??true,
        dialogType: dialogType??DialogType.error,
        body:  Center(child: TextApp(
          text:text,
          maxLines: 13,
          textAlign: TextAlign.center,
          color: blackColor,
          fontSize: 17,
          fontWeight: FontWeight.w700,
        ),
        ),
        btnCancelColor: const Color(0xff00adbb),
        btnOkColor:  const Color(0xff00adbb),
        headerAnimationLoop: false,
        btnOkOnPress: btnOkOnPress,// () {},
      ).show();
    });
  }


  static exitApp({required bool back,required String text,required BuildContext context}){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      AwesomeDialog(
        width: 400,
        context: context,
        animType: AnimType.scale,
        dialogType: DialogType.error,
        body:  Center(child: TextApp(
          text:text,
          maxLines: 3,
          textAlign: TextAlign.center,
          color: blackColor,
          fontSize: 17,
          fontWeight: FontWeight.w700,
        ),),
        btnCancelColor: Colors.red,
        btnOkColor:  primary2Color,
        headerAnimationLoop: false,
        btnOkOnPress: () {
          Go.to(context: context, page: const Login());
        },
        btnCancelOnPress: (){}
      ).show();
    });
  }

  static exitLogin({required bool back,required BuildContext context}){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      AwesomeDialog(
        width: 400,
        context: context,
        animType: AnimType.scale,
        dialogType: DialogType.noHeader,
        body:  Column(
          children: [
         TextApp(
        text:S.of(context).logout,
          maxLines: 3,
          textAlign: TextAlign.center,
          color: blackColor,
          fontSize: 17,
          fontWeight: FontWeight.w700,
        ),

            const SizedBox(height: 12,),


             TextApp(
              text:S.of(context).logOutText,
              maxLines: 3,
              textAlign: TextAlign.center,
              color: blackColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),

            const SizedBox(height: 12,),

            ButtonApps(
              ontap: (){
                // Go.toHomeAndRemmoveAllScreen(context: context,page: const Login());
                Go.logOut(context: context);
              },
              textButton: S.of(context).logout, maxWidth: 250,
              fontSize: 15,
              colorBorder: Colors.red,
              colorsButton: Colors.red,
            ),

            const SizedBox(height: 12,),

          ],
        ),
        // btnCancelColor: Colors.red,
        // btnOkColor:  primary2Color,
        headerAnimationLoop: false,
        // btnOkOnPress: () {
        //   Go.to(context: context, page: const Login());
        // },
        // btnCancelOnPress: (){}
      ).show();
    });
  }



  static errorPhoto({required text,required BuildContext context}){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      AwesomeDialog(
        width: 400,
        context: context,
        animType: AnimType.scale,
        dialogType: DialogType.error,
        body:  Center(child: TextApp(
          text:text,
          maxLines: 3,
          textAlign: TextAlign.center,
          color: blackColor,
          fontSize: 17,
          fontWeight: FontWeight.w700,
        ),),
        btnCancelColor: Colors.red,
        btnOkColor:  primary2Color,
        headerAnimationLoop: false,
        btnOkOnPress: () {
          // Go.to(context: context, page: const Login());
        },
        btnCancelOnPress: (){}
      ).show();
    });
  }


  static openLocation({required BuildContext context,required lat,required long,required location}){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      AwesomeDialog(
        width: 400,
        context: context,
        animType: AnimType.scale,
        dialogType: DialogType.question,
        body:  Center(child: TextApp(
          text:S.of(context).location_on_the_map,
          maxLines: 3,
          textAlign: TextAlign.center,
          color: blackColor,
          fontSize: 17,
          fontWeight: FontWeight.w700,
        ),),
        btnCancelColor: Colors.red,
        btnOkColor:  primaryColor,
        headerAnimationLoop: false,
        btnOkOnPress: () {
          // Go.launchMaps(
          //     lat.toString().trim(), long.toString().trim(),locations: location);
        },
        btnCancelOnPress: (){}
      ).show();
    });
  }

}