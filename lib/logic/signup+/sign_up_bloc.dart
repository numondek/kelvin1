

import 'package:bloc/bloc.dart';
import 'package:d8er1/data/model/user.dart';
import 'package:d8er1/data/repository/user.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  UserRepository userRepository = UserRepository();


  SignUpBloc() : super(SignUpInitial()) {
    on<SignupLoadingEvent>((event, emit) async {
      emit(SignupLoading());
      final result = await userRepository.signUpLogic.signupFuture(username: event.username, password: event.password, email: event.email);
      if (result.error != null) {
        emit(SignupError(result.error));
      } else{
        emit(SignupLoaded(result));
        emit(SignupSuccess());
      }

    });
  }
}
