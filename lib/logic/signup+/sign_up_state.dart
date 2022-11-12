part of 'sign_up_bloc.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();
}

class SignUpInitial extends SignUpState {
  @override
  List<Object> get props => [];
}



class SignupLoading extends SignUpState {
  @override

  List<Object?> get props => [];
}

class SignupLoaded extends SignUpState {
  @override
  final User user;
  const SignupLoaded(this.user);

  List<Object?> get props => [user];
}

class SignupSuccess extends SignUpState {
  @override

  List<Object?> get props => [];
}

class SignupError extends SignUpState {   @override
  final String? message;
  const SignupError(this.message);

  List<Object?> get props => [message];
}
