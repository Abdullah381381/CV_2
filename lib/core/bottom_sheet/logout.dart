




// ignore_for_file: deprecated_member_use





import 'package:cv_project/presentation/ui/auth/login.dart';

import '../../presentation/widgets/import_all.dart';

class LogOutSheet extends StatefulWidget {

  const LogOutSheet({super.key,});

  @override
  State<LogOutSheet> createState() => _DiplomasSheet1State();
}

class _DiplomasSheet1State extends State<LogOutSheet> {
  @override
  Widget build(BuildContext context) {
    final brightnessFinal = WidgetsBinding.instance.window.platformBrightness;

    return Container(
        width: MediaQuery.of(context).size.width,
        height: 290+0,
        decoration:  BoxDecoration(
            color:Theme.of(context).cardColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          )
        ),
      child: Column(
        children: [

          Container(
              width: 36,
              height: 5,
              margin: const EdgeInsets.only(top: 8,bottom: 0),
              decoration:  BoxDecoration(
                  borderRadius: const BorderRadius.all(
                      Radius.circular(8)
                  ),
                  color: brightnessFinal==Brightness.dark?Colors.white:const Color(0x4d3c3c43)
              )
          ),

          Container(
            padding: const EdgeInsets.only(right: 17,left: 17),
              width: MediaQuery.of(context).size.width,
              height: 55,
              decoration: const BoxDecoration(
                  // color: brightnessFinal==Brightness.dark?Theme.of(context).cardColor:
                  // scaffoldBackgroundColorForLightTheme,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
              ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [


                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child:const Icon(Icons.close),
                ),


                const TextApp(
                  text: "تسجيل الخروج",
                  textAlign: TextAlign.start,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),

                const SizedBox(),
              ],
            ),
          ),


          Container(
              width: MediaQuery.of(context).size.width,
              height: 1,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: brightnessFinal==Brightness.dark?Colors.white:const Color(0x1f000000),
                      width: 0.800000011920929
                  )
              )
          ),



          Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              margin: const EdgeInsets.only(right: 17,left: 17,top: 17),
              padding: const EdgeInsets.only(left: 13,right: 13,top: 13),
              decoration:  BoxDecoration(
                  borderRadius: const BorderRadius.all(
                      Radius.circular(8)
                  ),
                  color: brightnessFinal==Brightness.dark?Theme.of(context).cardColor:const Color(0xffffffff)
              ),
            child: Column(
              children: [

                const TextApp(
                  text: "هل انت متاكد من تسجيل الخروج  ؟",
                  textAlign: TextAlign.start,
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                  maxLines: 3,
                ),

                const SizedBox(height: 15,),

                Row(
                  children: [
                    Expanded(child:
                    ButtonApps(maxHeight: 45,maxWidth: 150,
                      //MediaQuery.of(context).size.width*.40,
                      colorsButton: primary2Color,
                      textButton: "تاكيد",
                      colorsText: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      ontap: (){
                      Go.toHomeAndRemmoveAllScreen(context: context, page: const Login());
                      },
                    ),
                    ),
                    Expanded(child:
                    ButtonApps(maxHeight: 45,maxWidth:150,
                    // MediaQuery.of(context).size.width*.40,
                      colorsButton: primary2Color.withOpacity(.14),
                      textButton: "اغلاق",
                      colorsText: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      ontap: (){
                      Go.back(context: context);
                      },
                    ),
                    ),
                  ],
                ),

                const SizedBox(height: 15,),

              ],
            ),
          )
        ],
      ),
    );


  }

}
