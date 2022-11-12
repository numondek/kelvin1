
import 'dart:convert';

import 'package:d8er1/data/model/user_info.dart';
import 'package:http/http.dart' as http;

class UserInfo_api {


  fetchData({String? token}) async {
    Uri url = Uri.parse('https://d8er-app.com/api/wallet-details');
    var response = await http.get(url,
      headers: {"Authorization": "Bearer $token"},
    );
    try {
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        print(jsonData);
        print(jsonData['First_Name']);
        return UserDetail.fromJson(jsonData);
      }else if (response.statusCode == 404) {
        var jsonData = jsonDecode(response.body);
        print(jsonData);
        String er = jsonData['message'];
        throw Exception(er);
      }  
    } catch (e) {
      final data = e.toString().substring(11);
      return UserDetail.withError(data);
    }
  }
}