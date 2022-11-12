part of 'create_profile_bloc.dart';

abstract class CreateProfileEvent extends Equatable {
  const CreateProfileEvent();
}

class CreateProfileLoading extends CreateProfileEvent {
  String? firstname;
  String? lastname;
  String? gender;
  String? number;
  String? location;
  String? mobileNetwork;
  String? email;
  int? dataamount =0;
  CreateProfileLoading({this.firstname,this.lastname,this.gender,this.location,this.email,this.number,this.dataamount, this.mobileNetwork});
  @override
  List<Object> get props => [];
}

class EditProfileLoading extends CreateProfileEvent {
  String? firstname;
  String? lastname;
  String? gender;
  String? number;
  String? location;
  String? mobileNetwork;
  String? email;
  int? dataamount =0;
  EditProfileLoading({this.firstname,this.lastname,this.gender,this.location,this.email,this.number,this.dataamount,this.mobileNetwork});
  @override
  List<Object> get props => [];
}