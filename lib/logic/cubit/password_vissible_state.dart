part of 'password_vissible_cubit.dart';

class PasswordVissibleState extends Equatable {
  bool? isPasswordVisible, isPasswordVisible1,isPasswordVisible2;
  PasswordVissibleState({this.isPasswordVisible,this.isPasswordVisible1,this.isPasswordVisible2});

  @override
  // TODO: implement props
  List<Object?> get props => [isPasswordVisible,isPasswordVisible1, isPasswordVisible2];

}


