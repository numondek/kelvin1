
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:d8er1/data/model/user_info.dart';
import 'package:d8er1/data/repository/user.dart';
import 'package:equatable/equatable.dart';

part 'user_info_event.dart';
part 'user_info_state.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  UserRepository userRepository = UserRepository();



  UserInfoBloc() : super(UserInfoInitial()) {
    emit(UserInfoInitial());
    on<UserInfoLoadingEvent>((event, emit) async {
      String? token ;
      SharedPreferences prefs = await SharedPreferences.getInstance();

      token = prefs.get('token') as String?;


      print(token);

      final data = await userRepository
          .userInfo
          .fetchData(token: token);
      emit(UserInfoLoaded(data));

     // final  data = loginRepository.userInfo.fetchData();
     // emit(UserInfoLoaded(data));
    });
  }
}
