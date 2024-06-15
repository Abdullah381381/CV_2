// ignore_for_file: camel_case_types, must_be_immutable

import 'package:cv_project/presentation/widgets/import_all.dart';


class NotFondError extends StatefulWidget{
  const NotFondError({super.key});

  @override
  State<StatefulWidget> createState() {
    return Ui_NotFondError();
  }

}

class Ui_NotFondError extends State<NotFondError>{
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [


          SizedBox(height: 70,),
          // Image(
          //   image: AssetImage('assets/images/2.jpeg'),
          //   width: 120,
          //   height: 120,
          // ),
          SvgPictureApp(height: 150, width: 150, boxFit: BoxFit.fill, photo: "assets/svg/not_found.svg"),

          SizedBox(height: 50,),

          Text('الصفحة غير متوفرة!',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w700,
              fontSize: 17
            ),
            textDirection: TextDirection.rtl,
          ),

          SizedBox(height: 5,),

          Text('الصفحة التي تبحث عنها غير موجودة حاليا',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Cairo',
                fontSize: 17
            ),
            textDirection: TextDirection.rtl,
          ),



          SizedBox(height: 50,),

        ],
      ),
    );
  }

}