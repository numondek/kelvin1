import 'dart:convert';

import 'package:d8er1/data/model/user.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class LoginLogic{

  loginFuture({
     String? username,
     String? password,
  }) async {


    Uri url = Uri.parse('https://d8er-app.com/api/login/');
    Map body = {'username': username?.toLowerCase(), 'password': password};
    var encode = jsonEncode(body);

    try{
      var dataSend = await http.post(url,
          body: encode,
          headers: {'Content-Type': 'application/json; charset=UTF-8'});
      print(dataSend.statusCode);
      if (dataSend.statusCode == 200) {
        var jsonData = jsonDecode(dataSend.body);
        if (kDebugMode) {
          print(jsonData);
          print(dataSend.statusCode);
        }
        return User.fromJson(jsonData);

      }

      else if(dataSend.statusCode == 401){
        var jsonData = jsonDecode(dataSend.body);
        print(jsonData);
        if (kDebugMode) {
          print(jsonData['detail']);
        }
        String er = jsonData['detail'];
        throw Exception(er);

      }
      // var jsonData = jsonDecode(dataSend.body);
      //
      //
      // return User.fromJson(jsonData);
    } on Exception catch (error) {
      if (kDebugMode) {
        print(error);
      }

      final data = error.toString().substring(11);
      return User.withError(data);
    }
  }
}