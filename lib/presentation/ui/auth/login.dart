
// ignore_for_file: use_build_context_synchronously

import 'package:cv_project/presentation/ui/auth/forget_password.dart';
import 'package:cv_project/presentation/ui/on_board.dart';
import 'package:cv_project/presentation/widgets/button_app_load.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../widgets/import_all.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {


  TextEditingController phoneController = TextEditingController();//..text="abdullahdarwish786@gamil.com";
  TextEditingController passwordController = TextEditingController();//..text="Oman1122";
  bool isLoading = false;

  final List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
  ];

  @override
  void initState() {
    for (var node in _focusNodes) {
      node.addListener(() {
        setState(() {});
      });
    }
    super.initState();

    checkLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return  HidenKeyBoard(
        widgetScreen:Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 22,right: 22),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top+30),
                  child: const SvgPictureApp(height: 150, width: 150, boxFit: BoxFit.fitWidth,
                      photo: "assets/svg/undraw_hiring_re_yk5n.svg"),
                )
              ],
            ),

            const SizedBox(height: 30,),
            TextApp(
              text:"Login",
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: primary2Color,
            ),
            const SizedBox(height: 60,),

            EditTextBorder(
              controller: phoneController,
              focusNode: _focusNodes[0],
              onChanged: (e){},
              validator: (e){
                return null;
              },
              enabled: true,
              hintText: "Email",
              labelText: "Email",
              prefixIcon: const Icon(Icons.email,color: Colors.black,size: 20,),
              obscureText: false,
            ),


            const SizedBox(height: 30,),

            EditTextBorder(
              controller: passwordController,
              focusNode: _focusNodes[1],
              onChanged: (e){},
              validator: (e){
                return null;
              },
              enabled: true,
              hintText: "Password",
              labelText: "Password",
              prefixIcon: const Icon(Icons.lock,color: Colors.black,size: 20,),
              suffixIcon: const Icon(Icons.remove_red_eye,color: Colors.black,size: 20,),
              obscureText: false,
            ),

            const SizedBox(height: 17,),

           Row(
             crossAxisAlignment: CrossAxisAlignment.end,
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
               InkWell(
                 onTap: (){
                   Go.to(context: context, page: const ForgetPassword());
                 },
                 child:
               TextApp(
                 text:"Forget Password ?",
                 fontWeight: FontWeight.w400,
                 color: primary2Color.withOpacity(.9),
                 fontSize: 17,
               ),
               ),
             ],
           ),

            const SizedBox(height:17,),

            if(isLoading)...[
              ButtonAppsLoad(
                maxHeight: 45,
                colorsButton: primary2Color,
                maxWidth: MediaQuery.of(context).size.width*.78,
              )
            ]else...[
              ButtonApps(
                ontap: (){
                  signInWithEmailAndPassword(context);
                  // Go.to(context: context, page: const OnBoard());
                },
                textButton: "Login",
                colorsButton: primary2Color,
                colorsText: Colors.white,
                fontSize: 17,
                maxHeight: 45,
                maxWidth: MediaQuery.of(context).size.width*.78,
                fontWeight: FontWeight.w400,
              ),
            ],


            const SizedBox(height:42,),

            const Row(
              children: [
                Expanded(child:Divider() ),
                TextApp(text: "  OR  ",),
                Expanded(child:Divider() ),
              ],
            ),
            const SizedBox(height:22,),



            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextApp(
                  text:" Don't have an account?",
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withOpacity(.59),
                  fontSize: 14,
                ),



                Expanded(child:
                TextButton(onPressed: (){
                  Go.to(context: context, page: const SignUp());
                },style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
                    child:  TextApp(
                  text:"Register a new account",
                  fontWeight: FontWeight.w400,
                  color: primary2Color.withOpacity(.9),
                  fontSize: 17,
                      maxLines: 2,
                ), ),),

              ],
            ),


          ],
        ),
        ),
      ),
    );
  }


  Future<void> signInWithEmailAndPassword(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: phoneController.text,
        password: passwordController.text,
      );
      // User signed in successfully
      print('User logged in: ${userCredential.user!.email}');
      if(userCredential.user!.email!=null){
        Go.to(context: context, page: const OnBoard());
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to sign in'),
          ),
        );
      }

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to sign in: $e'),
        ),
      );
    } finally {
      setState(() {
        isLoading = false; // Set loading state to false when sign-in process ends
      });
    }
    }




    // ----
  Future<void> checkLoggedIn() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Go.to(context: context, page: OnBoard());
    }
    });
  }
}
