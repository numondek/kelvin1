import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'password_vissible_state.dart';

class PasswordVissibleCubit extends Cubit<PasswordVissibleState> {
  PasswordVissibleCubit() : super(PasswordVissibleState(isPasswordVisible: true,isPasswordVisible1: true,isPasswordVisible2: true));

  void passwordVissible(){
    if (state.isPasswordVisible == true) {
      print("false");
      emit(PasswordVissibleState(isPasswordVisible: false,isPasswordVisible1: state.isPasswordVisible1,isPasswordVisible2: state.isPasswordVisible2));
    }
    else{
      print("true");
      emit(PasswordVissibleState(isPasswordVisible: true,isPasswordVisible1: state.isPasswordVisible1,isPasswordVisible2: state.isPasswordVisible2));
    }

  }
  void passwordVissible1(){
    if (state.isPasswordVisible1 == true) {
      print(state.isPasswordVisible1);
      print("false");
      emit(PasswordVissibleState(isPasswordVisible1: false, isPasswordVisible: state.isPasswordVisible,isPasswordVisible2: state.isPasswordVisible2));
    }
    else{
      print("true");
      emit(PasswordVissibleState(isPasswordVisible1: true, isPasswordVisible: state.isPasswordVisible,isPasswordVisible2: state.isPasswordVisible2));
    }

  }
  void passwordVissible2(){
    if (state.isPasswordVisible2 == true) {
      print(state.isPasswordVisible2);
      print("false");
      emit(PasswordVissibleState(isPasswordVisible2: false, isPasswordVisible1: state.isPasswordVisible1 ,isPasswordVisible: state.isPasswordVisible));
    }
    else{
      print("true");
      emit(PasswordVissibleState(isPasswordVisible2: true, isPasswordVisible1: state.isPasswordVisible1 ,isPasswordVisible: state.isPasswordVisible));
    }

  }
}
