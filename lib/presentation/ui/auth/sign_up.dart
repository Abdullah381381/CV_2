// ignore_for_file: use_build_context_synchronously


import 'package:firebase_auth/firebase_auth.dart';

import '../../widgets/button_app_load.dart';
import '../../widgets/import_all.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController()..text="";

  final _formKey = GlobalKey<FormState>();

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

  String _chosenValue="ذكر";

  @override
  Widget build(BuildContext context) {
    return  HidenKeyBoard(
        widgetScreen:Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 22,right: 22),
        child:  Form(
    key: _formKey,
    child:Column(
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
              text:"Register a new account",
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: primary2Color,
            ),
            const SizedBox(height: 30,),

            EditTextBorder(
              controller: emailController,
              focusNode: _focusNodes[0],
              onChanged: (e){},
              validator: (value) =>
              !RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(value!)
              // !RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!)
                  ? 'Enter Valid Email like  info@gmail.com '
                  : null,
              enabled: true,
              hintText: "Email",
              labelText: "Email",
              prefixIcon: Image.asset("assets/images/mail.png",height: 20,width: 20,),
              // prefixIcon: const Icon(Icons.email,color: Colors.black,size: 20,),
              obscureText: false,
            ),


            const SizedBox(height: 15,),

            EditTextBorder(
              controller: phoneController,
              focusNode: _focusNodes[0],
              onChanged: (e){},
              validator: (e) {
                if (e!.isEmpty || e.length < 7) {
                  return "phoneNumber";
                }
                return null;
              },
              enabled: true,
              hintText: "Phone",
              labelText: "Phone",
              prefixIcon: Image.asset("assets/images/phone-call.png",height: 20,width: 20,),
              // prefixIcon: const Icon(Icons.email,color: Colors.black,size: 20,),
              obscureText: false,
            ),


            const SizedBox(height: 15,),
            //
            //
            // EditTextBorder(
            //   controller: nameController,
            //   focusNode: _focusNodes[1],
            //   onChanged: (e){},
            //   validator: (e) {
            //     if (e!.isEmpty || e.length < 3) {
            //       return "name";
            //     }
            //     return null;
            //   },
            //   enabled: true,
            //   hintText: "name",
            //   labelText: "name",
            //   prefixIcon: Image.asset("assets/images/user.png",height: 20,width: 20,),
            //   obscureText: false,
            // ),
            //
            //
            // const SizedBox(height: 15,),
            //
            EditTextBorder(
              controller: passwordController,
              focusNode: _focusNodes[1],
              onChanged: (e){},
              validator: (e) {
                if (e!.isEmpty || e.length < 6) {
                  return "Password";
                }
                return null;
              },
              enabled: true,
              hintText: "Password",
              labelText: "Password",
              prefixIcon: const Icon(Icons.lock,color: Colors.black,size: 20,),
              suffixIcon: const Icon(Icons.remove_red_eye,color: Colors.black,size: 20,),
              obscureText: false,
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
                  if (_formKey.currentState!.validate()) {
                    signUpF(context);
                  }
              },
              textButton: "Register",
              colorsButton: primary2Color,
              colorsText: Colors.white,
              fontSize: 17,
              maxHeight: 45,
              maxWidth: MediaQuery.of(context).size.width*.78,
              fontWeight: FontWeight.w400,
            ),
            ],

            const SizedBox(height:32,),

            const Row(
              children: [
                Expanded(child:Divider() ),
                TextApp(text: "  OR  ",),
                Expanded(child:Divider() ),
              ],
            ),
            const SizedBox(height:18,),




            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextApp(
                  text:" do you have an account ?",
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withOpacity(.59),
                  fontSize: 17,
                ),



                TextButton(onPressed: (){Go.back(context: context);},style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
                    child:  TextApp(
                  text:"Login ",
                  fontWeight: FontWeight.w400,
                  color: primary2Color.withOpacity(.9),
                  fontSize: 17,
                ), ),

              ],
            ),

            SizedBox(height: MediaQuery.of(context).padding.bottom+20,)


          ],
        ),
        ),
      ),
      ),
    );
  }

  // Future<void> signUpF(BuildContext context) async {
  //   setState(() {
  //     isLoading = true; // Set loading state to true when sign-in process starts
  //   });
  //   String email = emailController.text;
  //   String password = passwordController.text;
  //   // String name = nameController.text;
  //
  //   try {
  //     UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //
  //     // After successful sign-up, save additional user data to Realtime Database
  //
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Sign up successful!'),
  //         duration: Duration(seconds: 3), // Adjust the duration as needed
  //       ),
  //     );
  //     // Optionally, you can do something after successful sign-up, like navigating to another screen.
  //     // For example:
  //     // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
  //   } catch (e) {
  //     print("Error signing up: $e");
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Error signing up: ${e.toString().co}".'),
  //         // content: Text('Failed to sign up. Please try again later.'),
  //       ),
  //     );
  //   }finally {
  //     setState(() {
  //       isLoading = false; // Set loading state to false when sign-in process ends
  //     });
  //   }
  // }

  Future<void> signUpF(BuildContext context) async {
    setState(() {
      isLoading = true; // Set loading state to true when sign-in process starts
    });
    String email = emailController.text;
    String password = passwordController.text;
    String name = nameController.text; // Retrieve user's name
    String phoneNumber = phoneController.text; // Retrieve user's phone number

    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // After successful sign-up, save additional user data to Firestore
      final user = userCredential.user;
      // if (user != null) {
      //   await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
      //     'name': name,
      //     'email': email,
      //     'phoneNumber': phoneNumber,
      //   });
      // }

      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Sign up successful!'),
          duration: Duration(seconds: 3), // Adjust the duration as needed
        ),
      );
      // Optionally, you can do something after successful sign-up, like navigating to another screen.
      // For example:
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        // Handle the specific error for email already in use
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('The email address is already in use by another account.'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to sign up. Please try again later.'),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to sign up. Please try again later.'),
        ),
      );
    } finally {
      setState(() {
        isLoading = false; // Set loading state to false when sign-in process ends
      });
    }
  }



}
