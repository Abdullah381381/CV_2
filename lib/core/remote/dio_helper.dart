// ignore_for_file: type_annotate_public_apis, unused_local_variable

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:intl/intl.dart' as intl;
import 'package:shared_preferences/shared_preferences.dart';

import '../error/exceptions.dart';
import '../sharedPref/shared_pref_class.dart';

class DioHelper {

  static final encoding = Encoding.getByName('utf-8');


  static  getHeader(token) {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // var z=prefs..get("application_token");
    // print(token);
    var  headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      // "Authorization":"Bearer $token",
      'lang':intl.Intl.defaultLocale ?? 'en'
    };
    if(token!=null){
      headers['Authorization']= 'Bearer $token';
    }
    // print(headers);
    return headers;
  }

  static  getHeader2(token,z) {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // var z=prefs..get("application_token");

    // print(token);
    var  headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'applicationToken':'$z',
      // "Authorization":token==null?null:"Bearer $token",
      'lang':intl.Intl.defaultLocale ?? 'en'
    };
    if(token!=null){
      headers['Authorization']= 'Bearer $token';
    }
    // print(headers);
    // print("---------------------------");
    return headers;
  }

  static  jsonBody(body){
    String jsonBody = json.encode(body);
    return jsonBody;
  }

  static getAll({api,client}) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var z=prefs.getString('application_token');
    try {
       Response response;
      response = await client.get(
        Uri.parse(api),
        headers: DioHelper.getHeader2(gettoken(),z),
      );
       if (response.statusCode == 200) {
        // print('--------------------------->');
        // print('--------------------------->');
        // print('--------------------------->');
        // print('--------------------------->');
        // print(response.statusCode);
        // print(response.body);
        return response;
      }
     // else if (response.statusCode == 400) {
     //    return BadRequestException();
     //  }
     // else if (response.statusCode == 401) {
     //    return UnAuthorizedException();
     //  }
     // else if (response.statusCode == 403) {
     //    return UnAuthorizedException();
     //  }
     // else if (response.statusCode == 500) {
     //    return ServerException();
     //  }
      else {
        throw exceptionHandling(statusCode:response.statusCode);
      }
    } on SocketException {
      throw const SocketException('No Internet Connection');
    } on ClientException {
      throw const SocketException('Client Exception');
    }
  }

  static postAll({api,client,body}) async{
    try {
      final Response response = await client.post(
        Uri.parse(api),
        headers: DioHelper.getHeader(gettoken()),
        encoding:encoding,
          body: jsonBody(body)
      );
      // print(response.statusCode);
      // print(response.body);
      if (response.statusCode == 200||response.statusCode == 404||response.statusCode == 410) {
        return response;
      }
     else if (response.statusCode == 401) {
        throw UnAuthorizedException();
      }
      else {
        throw  exceptionHandling(statusCode: response.statusCode);
      }
    } on SocketException {
      throw const SocketException('No Internet Connection');
    } on ClientException {
      throw const SocketException('Client Exception');
    }
  }



  static reTokenApp({api,client,body,required type}) async{
    //   final Response response = await client.post(
    //     Uri.parse('${Apis.apiNew}create-application-token'),
    //     headers: DioHelper.getHeader(gettoken()),
    //   );
    //   // print(Apis.apiNew+"create-application-token");
    //   // print(response.body);
    //
    //   if(response.statusCode==200){
    //     Map ss= json.decode(response.body);
    //     // print(ss);
    //     // print(ss["data"]);
    //     // print(ss["data"]["application_token"]);
    //     SharedPreferences prefs = await SharedPreferences.getInstance();
    //     var z=prefs.setString('application_token',ss['data']['application_token']);
    //     // getAll(api: api,client: client);
    //     return response;
    //   }else{
    //     throw UnAuthorizedException();
    //   }
    }
}
