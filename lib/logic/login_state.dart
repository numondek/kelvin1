part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  const LoginInitial();

  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class LoginLoaded extends LoginState {
  final User? user;
  const LoginLoaded({this.user});

  @override
  List<Object> get props => [];
}

class LoginError extends LoginState {
  final String? message;
  const LoginError(this.message);

  @override
  List<Object?> get props => [];
}


class LoginSuccess extends LoginState {
  const LoginSuccess();

  @override
  List<Object> get props => [];
}