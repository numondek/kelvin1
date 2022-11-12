
import 'dart:convert';

import 'package:d8er1/data/model/user_info.dart';
import 'package:http/http.dart' as http;

class CreateProfile {
  create({
    String? firstname,
    String? lastname,
    String? gender,
    String? number,
    String? location,
    String? mobileNetwork,
    String? token
  }) async {
    Uri url = Uri.parse('https://d8er-app.com/api/create-wallet');
    Map body = {"First_Name": firstname, "Last_Name": lastname, "Phone_number": number, "Mobile_network": mobileNetwork, "City": location, "Gender": gender };
    var encode = jsonEncode(body);
    var response = await http.post(url,
      body: encode,
      headers: {"Authorization": "Bearer $token"},
    );
    try {
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        print(jsonData);
        return UserDetail.fromJson(jsonData);
      }else if (response.statusCode == 406) {
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

  edit({
    String? firstname,
    String? lastname,
    String? gender,
    String? number,
    String? location,
    String? mobileNetwork,
    String? token
    }) async {
        Uri url = Uri.parse('https://d8er-app.com/api/create-wallet');
        Map body = {"First_Name": firstname, "Last_Name": lastname, "Phone_number": number, "Mobile_network": mobileNetwork, "City": location, "Gender": gender };
        var encode = jsonEncode(body);
        var response = await http.post(url,
          body: encode,
          headers: {"Authorization": "Bearer $token"},
        );
        try {
          if (response.statusCode == 200) {
            var jsonData = jsonDecode(response.body);
            print(jsonData);
            return UserDetail.fromJson(jsonData);
          }else if (response.statusCode == 406) {
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