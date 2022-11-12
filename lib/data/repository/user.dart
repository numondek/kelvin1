


import 'package:d8er1/data/api/create_profile.dart';
import 'package:d8er1/data/api/login.dart';



import 'package:d8er1/data/api/signup.dart';
import 'package:d8er1/data/api/user_info.dart';



class UserRepository {
  final signUpLogic =   SignUpLogic();
  final loginLogic = LoginLogic();
  final userInfo = UserInfo_api();
  final createProfile = CreateProfile();




  loginFuture(){
    return loginLogic.loginFuture();
  }

  signupFuture(){
    return signUpLogic.signupFuture();
  }

  fetchData(){
    return userInfo.fetchData();
  }
  create(){
    return createProfile.create();
  }

}