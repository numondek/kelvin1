part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginLoginEvent extends LoginEvent{
  late String username;
  late String password;
  LoginLoginEvent(this.username,this.password);
  @override

  List<Object?> get props => [username, password];

}


