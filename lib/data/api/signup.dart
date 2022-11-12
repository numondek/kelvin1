import 'dart:convert';


import 'package:d8er1/data/model/user.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


class SignUpLogic {


  signupFuture({
    String? username,
    String? email,
    String? password,
  }) async {
    Uri url = Uri.parse('https://d8er-app.com/api/register');
    Map body = {
      'username': username?.toLowerCase(),
      'email': email,
      'password': password,
      'password2': password
    };
    var encode = jsonEncode(body);
    try {
      var dataSend = await http.post(url,
          body: encode,
          headers: {'Content-Type': 'application/json; charset=UTF-8'});
      print(dataSend.statusCode);
      if (dataSend.statusCode == 201) {
        var jsonData = jsonDecode(dataSend.body);
        if (kDebugMode) {
          print(jsonData);
        }
        return User.fromJson(jsonData);

      }
      else  if(dataSend.statusCode == 400){
        var jsonData = jsonDecode(dataSend.body);
        if (kDebugMode) {
          print(jsonData['message']);
        }
        String er = jsonData['message'].toString();

        String email = jsonData['email'].toString();
        if(er == '[username already exists]') {
          throw Exception(er);
        }
        if(er == '[email already exists]') {
          throw Exception(er);
        }
        else{
          throw Exception(email);
        }
      }

    } on Exception catch (e) {
      if (kDebugMode) {
        print('error -------------- $e');
      }
      final data = e.toString().substring(11);
      return User.withError("$data");
    }
  }
}
