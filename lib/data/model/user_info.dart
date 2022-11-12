class UserDetail{
  String? firstname;
  String? lastname;
  String? gender;
  String? number;
  String? location;
  String? email;
  String? mobileNetwork;
  int? dataamount;
  String? error;


  UserDetail({this.firstname,this.lastname,this.email,this.gender,this.dataamount,this.number,this.location, this.mobileNetwork});

  UserDetail.withError(String errorMessage) {
    error = errorMessage;
  }

  UserDetail.fromJson(Map<String, dynamic> json,) {

    error = json['detail'];
    firstname = json['First_Name'] ??= '';
    lastname = json['Last_Name'] ??= '';
    gender = json['Gender'] ??= '';
    location = json['City'] ??= '';
    number = json['Phone_number'] ??= '';
    dataamount = json['Data_balance'];
    mobileNetwork = json['Mobile_network'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['First_Name'] = firstname;
    data['Last_Name'] = lastname;
    data['Gender'] = gender;
    data['City'] = location;
    data['Phone_number'] = number;
    data['Data_balance'] = dataamount;
    data['Mobile_network'] = mobileNetwork;


    return data;
  }
}