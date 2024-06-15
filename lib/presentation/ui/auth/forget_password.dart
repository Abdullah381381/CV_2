

import 'package:firebase_auth/firebase_auth.dart';

import '../../widgets/button_app_load.dart';
import '../../widgets/import_all.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController phoneController = TextEditingController();//..text="mdiaa7788@gmail.com";
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
  }

  @override
  Widget build(BuildContext context) {
    return  HidenKeyBoard(
        widgetScreen:Scaffold(
          appBar: AppBar(
            title: const TextApp(text: "",),
          ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 22,right: 22),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top+30),
                  child: const SvgPictureApp(height: 200, width: 150, boxFit: BoxFit.fitWidth,
                      photo: "assets/svg/forgot_password2.svg"),
                )
              ],
            ),

            const SizedBox(height: 20,),
            TextApp(
              text:"Forget Password ?",
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

          if(isLoading)...[
          ButtonAppsLoad(
          maxHeight: 45,
          colorsButton: primary2Color,
          maxWidth: MediaQuery.of(context).size.width*.78,
        )
        ]else...[
            ButtonApps(
              ontap: (){
                resetPassword(context);
                // Go.to(context: context, page: const VirfiCode());
              },
              textButton: "Send",
              colorsButton: primary2Color,
              colorsText: Colors.white,
              fontSize: 17,
              maxHeight: 45,
              maxWidth: MediaQuery.of(context).size.width*.78,
              fontWeight: FontWeight.w400,
            )],

            const SizedBox(height:42,),


          ],
        ),
        ),
      ),
    );
  }

  Future<void> resetPassword(BuildContext context) async {
    setState(() {
      isLoading = true; // Set loading state to true when sign-in process starts
    });
    String email = phoneController.text;
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password reset email sent to $email'),
        ),
      );
    } catch (e) {
      print("Error sending reset email: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to send reset email. Please try again later.'),
        ),
      );
    }finally {
      setState(() {
        isLoading = false; // Set loading state to false when sign-in process ends
      });
    }
  }
}
