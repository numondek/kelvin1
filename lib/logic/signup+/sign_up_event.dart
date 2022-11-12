part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();
}

class SignupLoadingEvent extends SignUpEvent {
  String? username;
  String? email;
  String? password;

  SignupLoadingEvent({this.email,this.username,this.password});
  @override

  List<Object?> get props => [];
}
