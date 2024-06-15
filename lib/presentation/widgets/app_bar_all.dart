
import 'package:cv_project/core/resources/colors_app.dart';
import 'package:cv_project/presentation/widgets/go.dart';
import 'package:flutter/material.dart';
import 'text_app.dart';



class AppBarAll extends StatefulWidget  implements PreferredSizeWidget {
  final String nameAppBar;
  final bool showBack;
  const AppBarAll({super.key,required this.nameAppBar,required this.showBack,});
  @override
  _AppBarAllState createState() => _AppBarAllState();


  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _AppBarAllState extends State<AppBarAll> {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: whiteColor,
      centerTitle: false,
      title: TextApp(
          text: widget.nameAppBar,
          color:  const Color(0xff040415),
          fontWeight: FontWeight.w700,
          fontStyle:  FontStyle.normal,
          fontSize: 21.0
      ),


      leading:
      widget.showBack==false?null:
      InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                Go.back(context: context);
              },
              child: const Icon(Icons.arrow_back_ios,size: 20,color: blackColor,),
            )
          ],
        ),
      ),

    );
  }
}
