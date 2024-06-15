// ignore_for_file: prefer_conditional_assignment, non_constant_identifier_names
import 'package:shared_preferences/shared_preferences.dart';



String device_token = 'device_token';
String idUSer = 'Id';
String token = 'token';
String name = 'name';//
String email = 'email';
String phone = 'phone';
String address = 'address';
String imagePath = 'imagePath';
String intro = 'intro';
String drivingCost = 'drivingCost';
String translations_hint = 'translations_hint';
String tabby_hint = 'tabby_hint';
String tabbyTokenKey = 'tabbyTokenKey';
String phonekey = 'phonekey';
String social_id = 'social_id';

String dateDayShowVergin = 'dateDayShowVergin';

SharedPreferences? prefs;


Future setUserToken({
   required String device_tokens,
   required String tokens,
   required String names,
   required String emails,
   required String addresss,
   required String phones,
   required String imagePaths,
   required String phonekeys,
   required String social_idApp,
    int? uid,
    }) async {
  if (prefs == null) {
    prefs = await SharedPreferences.getInstance();
  }
  await prefs?.setString(device_token, device_tokens);
  await prefs?.setString(token,tokens);
  await prefs?.setString(name,names);
  await prefs?.setString(address,addresss);
  await prefs?.setString(phonekey,phonekeys);
  await prefs?.setString(email,emails);
  await prefs?.setString(phone,phones);
  await prefs?.setString(imagePath,imagePaths);
  await prefs?.setInt(idUSer, uid!);
  await prefs?.setString(social_id, social_idApp);
}


Future setDataUser({
   required String names,
   required String emails,
   required String addresss,
   required String phones,
   required String imagePaths,
   required String phonekeys,
    }) async {
  if (prefs == null) {
    prefs = await SharedPreferences.getInstance();
  }
  await prefs?.setString(name,names);
  await prefs?.setString(address,addresss);
  await prefs?.setString(phonekey,phonekeys);
  await prefs?.setString(email,emails);
  await prefs?.setString(phone,phones);
  await prefs?.setString(imagePath,imagePaths);
}


//* ------------------------------------------------------

Future saveAppSettings({
   required String drivingCostApp,
   required String tabbyTokenKeyApp,
   required String translations_hintApp,
   required String tabby_hintApp,
    }) async {
  if (prefs == null) {
    prefs = await SharedPreferences.getInstance();
  }
  await prefs?.setString(drivingCost, drivingCostApp);
  await prefs?.setString(translations_hint, translations_hintApp);
  await prefs?.setString(tabby_hint, tabby_hintApp);
  await prefs?.setString(tabbyTokenKey, tabbyTokenKeyApp);
}
Future savePhoto({
   required String potos,
    }) async {
  if (prefs == null) {
    prefs = await SharedPreferences.getInstance();
  }
  await prefs?.setString(imagePath, potos);
}

Future changeToken({
  required String tokens,
}) async {
  if (prefs == null) {
    prefs = await SharedPreferences.getInstance();
  }

  // await prefs?.setString(token, tokens);
  //
  await prefs!.remove(idUSer);
  await prefs!.remove(token);
  await prefs!.remove(name);
  await prefs!.remove(phone);
  await prefs!.remove(address);
  await prefs!.remove(email);
}

Future saveAppIntro({
   required String intros,
    }) async {
  if (prefs == null) {
    prefs = await SharedPreferences.getInstance();
  }
  await prefs?.setString(intro, intros);
}








int? getUserId() {
  return prefs?.getInt(idUSer);
}



String? gettoken() {
  return prefs?.getString(token);
}



String? getDrivingCost() {
  return prefs?.getString(drivingCost);
}



String? getTabbyHint() {
  return prefs?.getString(tabby_hint);
}





String? getTranslations_hint() {
  return prefs?.getString(translations_hint);
}



String? getEmail() {
  return prefs?.getString(email);
}



String? getPhone() {
  return prefs?.getString(phone);
}


String? getTabbyTokenKey() {
  return prefs?.getString(tabbyTokenKey);
}



String? getPhoto() {
  return prefs?.getString(imagePath);
}


String? getSocialId() {
  return prefs?.getString(social_id);
}

String? getNameUser() {
  return prefs?.getString(name);
}


String? getDateDayShowVergin() {
  return prefs?.getString(dateDayShowVergin);
}



Future setShowVergin({
  required String dateDayShowVergins,
}) async {
  if (prefs == null) {
    prefs = await SharedPreferences.getInstance();
  }
  await prefs?.setString(dateDayShowVergin,dateDayShowVergins);
}


Future getTestLogin() async {
  if (prefs == null) {
    prefs = await SharedPreferences.getInstance();
  }
  return prefs?.getInt(idUSer);
}

Future clearAllData() async {
  if (prefs == null) {
    prefs = await SharedPreferences.getInstance();
  }
  await prefs?.clear();
}
