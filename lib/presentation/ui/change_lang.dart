// ignore_for_file: use_key_in_widget_constructors, camel_case_types, use_build_context_synchronously



import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/resources/colors_app.dart';
import '../../../core/sharedPref/shared_pref_class.dart';
import '../widgets/go.dart';
import '../widgets/text_app.dart';

class ChangeLangDesign extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return UnChangeLang();
  }
}

class UnChangeLang extends State<ChangeLangDesign> {


  @override
  void initState() {
    super.initState();
    getStringValuesSF();
  }

  String? langApp;
  int? groupValue;

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? lang = prefs.getString('lang');
    setState(() {
      langApp=lang;
      if(langApp=='en'){
        setState(() {
          groupValue=0;
        });
      }else if(langApp=='ar'){
        setState(() {
          groupValue=1;
        });
      }

    });
  }



  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return  Material(
          type: MaterialType.transparency,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  const SizedBox(height: 22,),


                Container(
          height: 466,
          padding: const EdgeInsets.all(22),
          width: MediaQuery.of(context).size.width,
          decoration:  BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              border: Border.all(
                  color: Colors.white,width: 1
              )
          ),
          // color: Color(0xffeeeeee),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [

              Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                          Radius.circular(8)
                      ),
                      border: Border.all(
                          color: const Color(0x1a040415),
                          width: 1
                      )
                  ),
                  child:  InkWell(
                    onTap: (){
                      Go.back(context: context);
                    },

                    child:  const Center(
                      child: Icon(Icons.close, color:Color(0x33000000)),
                    ),

                  )
              ),



              const SizedBox(height: 22,),

              Center(
                child: SvgPicture.asset('assets/svg/language.svg',height: 70,width: 70,),
              ),


              const SizedBox(height: 22,),

              const Center(
                child:TextApp(
                  text:"اختر اللغه ",
                  color:  Color(0xff212121),
                  fontWeight: FontWeight.w700,
                  fontStyle:  FontStyle.normal,
                  fontSize: 14.0,
                ),
              ),



              const SizedBox(height: 22,),

              _myRadioButton(
                title: "english",
                value: 0,
                onChanged: (newValue) => setState(() {
                  groupValue = newValue;
                  debugPrint(groupValue.toString());
                }
                  // ),
                ),
              ),


              const SizedBox(height: 22,),


              _myRadioButton(
                title: "arabic",
                value: 1,
                onChanged: (newValue) => setState(() {
                  groupValue = newValue;
                  debugPrint(groupValue.toString());
                }
                  // ),
                ),
              ),




              const SizedBox(height: 22,),

              InkWell(
                onTap: (){
                  getLang ();
                },
                child: Center(
                  child: Container(
                    width: 286,
                    height: 50,
                    decoration:  BoxDecoration(
                        borderRadius: const BorderRadius.all(
                            Radius.circular(8)
                        ),
                        color: primary2Color
                    ),
                    child:  const Center(
                      child: Text(
                          "done",
                          style: TextStyle(
                              color:  Color(0xffffffff),
                              fontWeight: FontWeight.w500,
                              fontFamily: 'PingAR+LT',
                              fontStyle:  FontStyle.normal,
                              fontSize: 14.0
                          ),
                          textAlign: TextAlign.center
                      ),
                    ),
                  ),
                ),
              )

            ],
          ),
        ),


                ],
              )


      );
    });
  }


  Widget _myRadioButton({String? title, int? value, ValueChanged? onChanged}) {
    return RadioListTile(
      activeColor: primary2Color,
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      title: Text(title!,style: const TextStyle(
        color: Colors.black
      ),),
    );
  }




  // * ----------------------  Lang  ----------------------

  getLang () async {
    Locale temp;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? stringValue = prefs.getString('lang');

    bool checkValue = prefs.containsKey('lang');
    if(checkValue== true){
      // if(groupValue==0){
      //
      //   temp = const Locale('en', 'EG');
      //
      //   MyApp.setLocale(context, temp);
      //   // Navigator.pushReplacementNamed(context, '/');
      //   prefs.setString('lang','en');
      //   if(gettoken()!=null){
      //     chageLage(ctx: ctx,lang: 'en');
      //   }else{
      //     Navigator.pushReplacementNamed(context, '/');
      //   }
      //
      //
      // }else{
      //   temp = const Locale('ar', 'ar');
      //   MyApp.setLocale(context, temp);
      //
      //   prefs.setString('lang','ar');
      //
      //   if(gettoken()!=null){
      //     chageLage(ctx: ctx,lang: 'ar');
      //   }else{
      //     Navigator.pushReplacementNamed(context, '/');
      //   }
      //
      //
      //   // Navigator.pushReplacementNamed(context, '/');
      // }

    }
    if(checkValue== false){
      prefs.setString('lang','ar');
      temp = const Locale('ar', 'ar');
      // MyApp.setLocale(context, temp);

      if(gettoken()!=null){
        // chageLage(ctx: ctx,lang: 'ar');
      }else{
        Navigator.pushReplacementNamed(context, '/');
      }

    }
  }
  // chageLage({lang,ctx}){
  //   BlocProvider.of<AppSettingsBloc>(ctx, listen: false).add(
  //     GetChageLangEvent(requestData: {'locale':lang}),
  //   );
  // }
}