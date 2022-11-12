

class User {
  late  String? token;
  late String? signupMessage;
  String? error;


  User({  this.token, this.error, this.signupMessage});

  User.withError(String errorMessage) {
    error = errorMessage;


  }

  User.fromJson(Map<String, dynamic> json,) {
    token = json['access'];
    error = json['detail'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access'] = token;

    return data;
  }


}

class Error{
  late String error;

  Error.withError(String errorMessage) {
    error = errorMessage;
  }

}
