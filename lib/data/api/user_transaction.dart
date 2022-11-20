import 'dart:convert';

import 'package:d8er1/data/model/user_transaction.dart';
import 'package:http/http.dart' as http;

class UserTransactions{


  fetchTransaction({String? token}) async {
    Uri url = Uri.parse('https://d8er-app.com/api/transactions');
    var response = await http.get(url,
      headers: {"Authorization": "Bearer $token"},
    );

      if (response.statusCode == 200) {
        final List jsonData = jsonDecode(response.body);
        print(jsonData);
        return jsonData.map((e) => UserTransaction.fromJson(e)).toList();
      }else if (response.statusCode == 404) {
        var jsonData = jsonDecode(response.body);
        print(jsonData);
        String er = jsonData['message'];
        throw Exception(er);
      }
    // } catch (e) {
    //   final data = e.toString().substring(11);
    //   // return UserTransaction.withError(data);
    // }
  }
}