import 'package:flutter/material.dart';


class BackGroundApp extends StatelessWidget {
  const BackGroundApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*1.5,
      height: MediaQuery.of(context).size.height*1.5,
      child: Stack(
        children: [


          Image.asset("assets/images/background.png",
          // SvgPicture.asset("assets/images/background.svg",
            width: MediaQuery.of(context).size.width*1.5,
            height: MediaQuery.of(context).size.height*1.52,
            fit: BoxFit.cover,
          ),



        ],
      ),
    );
  }
}
