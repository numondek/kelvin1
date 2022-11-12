import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:d8er1/data/model/user_info.dart';
import 'package:d8er1/data/repository/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:equatable/equatable.dart';

part 'create_profile_event.dart';
part 'create_profile_state.dart';

class CreateProfileBloc extends Bloc<CreateProfileEvent, CreateProfileState> {
  UserRepository userRepository = UserRepository();

  CreateProfileBloc() : super(CreateProfileInitial()) {
    on<CreateProfileLoading>((event, emit) async {
      String? token ;
      SharedPreferences prefs = await SharedPreferences.getInstance();

      token = prefs.get('token') as String?;

      final result = UserRepository().createProfile.create(token: token,firstname: event.firstname,lastname: event.lastname,mobileNetwork: event.mobileNetwork,number: event.number, location: event.location,gender: event.gender);
      if (result.error != null) {
        emit(Error(result));
      }  else{
        emit(CreateProfileLoaded(user: result));
      }

    });

    on<EditProfileLoading>((event, emit) async {
      String? token ;
      SharedPreferences prefs = await SharedPreferences.getInstance();

      token = prefs.get('token') as String?;

      final result = UserRepository().createProfile.edit(token: token, firstname: event.firstname,lastname: event.lastname,mobileNetwork: event.mobileNetwork,number: event.number, location: event.location,gender: event.gender);
      if (result.error != null) {
        emit(Error(result));
      }  else{
        emit(CreateProfileLoaded(user: result));
      }

    });


  }
}
