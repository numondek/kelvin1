
import 'package:bloc/bloc.dart';
import 'package:d8er1/data/model/user.dart';
import 'package:d8er1/data/repository/user.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';





class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository userRepository = UserRepository();

  String? token;

  LoginBloc() : super(const LoginInitial()){
    on<LoginLoginEvent>((event, emit) async {
      emit(LoginLoading());
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final  result = await userRepository.loginLogic.loginFuture(username: event.username, password: event.password);
      print('hk{$result}');
      if(result.error != null){
        emit(LoginError(result.error));
      }else{
        emit(LoginLoaded(user: result));
        late String? token =LoginLoaded(user: result).user?.token.toString();
        prefs.setString('token', token.toString());

        emit(const LoginSuccess());

      }
    });

  }






}
