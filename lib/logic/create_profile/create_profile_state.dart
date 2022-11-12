part of 'create_profile_bloc.dart';

abstract class CreateProfileState extends Equatable {
  const CreateProfileState();
}

class CreateProfileInitial extends CreateProfileState {
  @override
  List<Object> get props => [];
}

class CreateProfileLoaded extends CreateProfileState {
  final UserDetail? user;
  const CreateProfileLoaded({this.user});
  @override
  List<Object> get props => [];
}

class Error extends CreateProfileState {
  final String? message;
  const Error(this.message);

  @override
  List<Object?> get props => [];
}

