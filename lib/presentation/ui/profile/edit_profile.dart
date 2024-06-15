// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:cv_project/core/sharedPref/shared_pref_class.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';

import 'package:http_parser/http_parser.dart';
import '../../widgets/button_app_load.dart';
import '../../widgets/import_all.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  // TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController()..text="";
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  File? fileUpload;
  String fileS = '';
  String? filename;
  String url="";

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  Future<void> getUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {


      // If the user is not signed in, display an error message
      if (user == null) {
         Go.logOut(context: context);
        return;
      }
    });

    emailController.text=user?.email??"";
    nameController.text=user?.displayName??"";
    url=user?.photoURL??"";
  }
  @override
  Widget build(BuildContext context) {
    return HidenKeyBoard(
        widgetScreen: Scaffold(

      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 22,right: 22),
        child:  Form(
          key: _formKey,
          child:Column(
            children: [
              SizedBox(height: 30+MediaQuery.of(context).padding.top,),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextApp(text: "  UpdateProfile  ",fontSize: 20,fontWeight: FontWeight.w700,),
                ],
              ),
              const SizedBox(height: 30,),

              SizedBox(height: 90,width: 90,
                child: InkWell(
                  onTap: () async {
                    FilePickerResult? result =
                    await FilePicker.platform
                        .pickFiles(
                      type: FileType.image,
                    );

                    if (result != null) {
                      File file = File(
                          result.files.single.path ??
                              '');
                      fileUpload = file;
                      fileS = result.files.single.path!;
                      var ext = fileS
                          .toString()
                          .split('.')
                          .last;
                      var pic = await http.MultipartFile
                          .fromPath(
                          'file', fileS.toString(),
                          contentType: MediaType(
                              fileS.toString(),
                              ext));
                      setState(() {
                        filename = pic.filename;
                      });

                      if (fileS != "") {
                        String? photoUrl = await uploadImageToFirebaseStorage(
                            file);
                        final user = FirebaseAuth.instance.currentUser;
                        await user?.updateProfile(
                          displayName: user.displayName,
                          // Keep the existing display name
                          photoURL: photoUrl,
                        );
                      }
                    }
                  },
                  child:  Stack(
                    children: [

                      if(fileS!='')...[
                        ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.file(File(fileS,), width: 90,height: 90,fit: BoxFit.fill,)),

                      ]else...[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child:  CachedNetworkImageApp(
                            width: 90,height: 90,
                            imageUrl: url,//"https://images.unsplash.com/photo-1554080353-a576cf803bda?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cGhvdG98ZW58MHx8MHx8fDA%3D",
                            errors: Image.asset(
                              "assets/images/cv.jpeg",
                              width: 90,
                              height: 90,
                            ),
                          ),
                        )
                      ],
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                          width: 30,height: 30,
                          // padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: const Center(
                            child: Icon(Icons.camera_alt,color: Colors.white,size: 20,),
                          ),
                        ),
                      )
                    ],
                  ),
                )
                ,),
              const SizedBox(height: 30,),

              EditTextBorder(
                controller: emailController,
                onChanged: (e){},
                validator: (value) =>
                !RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(value!)
                // !RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!)
                    ? 'Enter Valid Email like  info@gmail.com '
                    : null,
                enabled: false,
                hintText: "الاميل",
                labelText: "الاميل",
                prefixIcon: Image.asset("assets/images/mail.png",height: 20,width: 20,),
                // prefixIcon: const Icon(Icons.email,color: Colors.black,size: 20,),
                obscureText: false,
              ),


              const SizedBox(height: 15,),




              EditTextBorder(
                controller: nameController,
                onChanged: (e){},
                validator: (e) {
                  if (e!.isEmpty || e.length < 3) {
                    return "name";
                  }
                  return null;
                },
                enabled: true,
                hintText: "name",
                labelText: "name",
                prefixIcon: Image.asset("assets/images/user.png",height: 20,width: 20,),
                obscureText: false,
              ),


              const SizedBox(height: 15,),




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
                      // signUpF(context);
                      updateProfile(context);
                    }
                  },
                  textButton: "UpdateProfile",
                  colorsButton: primary2Color,
                  colorsText: Colors.white,
                  fontSize: 17,
                  maxHeight: 45,
                  maxWidth: MediaQuery.of(context).size.width*.78,
                  fontWeight: FontWeight.w400,
                ),
              ],

              const SizedBox(height:32,),




              ButtonApps(
                ontap: (){

                    logout(context);

                },
                textButton: "LogOut",
                colorsButton: primaryColor,
                colorsText: Colors.white,
                fontSize: 17,
                maxHeight: 45,
                maxWidth: MediaQuery.of(context).size.width*.78,
                fontWeight: FontWeight.w400,
              ),

            ],
          ),
        ),
      ),
    )
    );
  }

  Future<void> updateProfile(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('User not logged in'),
        ),
      );
      return;
    }

    try {
      await user.updateProfile(
        displayName: nameController.text,
        photoURL: url,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Profile updated successfully'),
        ),
      );
    } catch (e) {
      print('Error updating profile: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to update profile'),
        ),
      );
    }finally {
      setState(() {
        isLoading = false; // Set loading state to false when sign-in process ends
      });
    }
  }

  Future<String?> uploadImageToFirebaseStorage(imageFile) async {
    try {
      String userId = FirebaseAuth.instance.currentUser!.uid;
      String fileName = 'profile_photos/$userId.jpg';

      await FirebaseStorage.instance.ref(fileName).putFile(imageFile);


      String downloadURL = await FirebaseStorage.instance.ref(fileName).getDownloadURL();
      return downloadURL;
    } catch (e) {
      print('Error uploading image to Firebase Storage: $e');
      return null;
    }
  }

  Future<void> logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Logged out successfully'),
        ),
      );
      Go.logOut(context: context);
    } catch (e) {
      print('Error logging out: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to log out. Please try again later.'),
        ),
      );
    }

  }
}
