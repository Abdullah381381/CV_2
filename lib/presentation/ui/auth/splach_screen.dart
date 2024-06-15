
import 'dart:async';
import 'package:cv_project/presentation/ui/auth/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/import_all.dart';
import '../on_board.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {

  getStringValuesSF() async {
    // await DefaultCacheManager().emptyCache();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool checkValue = prefs.containsKey('jwtToken');
    debugPrint("idUser=> $checkValue");




    Timer(
        const Duration(seconds: 3),
            () async {

              final user = FirebaseAuth.instance.currentUser;

              if (user != null) {
                Go.to(context: context, page: const OnBoard());
              } else {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (
                        BuildContext context) => const Login()));
              }


        });


  }



  @override
  void initState() {
    super.initState();
    getStringValuesSF();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top+30),
                child: Image.asset(
                  "assets/images/cv.jpeg",
                  width: 350,
                  height: 300,
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
