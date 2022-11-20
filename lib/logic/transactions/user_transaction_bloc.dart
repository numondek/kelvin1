
import 'package:bloc/bloc.dart';
import 'package:d8er1/data/model/user_transaction.dart';
import 'package:d8er1/data/repository/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:equatable/equatable.dart';

part 'user_transaction_event.dart';
part 'user_transaction_state.dart';

class UserTransactionBloc extends Bloc<UserTransactionEvent, UserTransactionState> {
  UserRepository userRepository = UserRepository();


  UserTransactionBloc() : super(UserTransactionInitial()) {
    on<UserTransactionLoading>((event, emit) async {
      emit(UserTransactionLoadingState());
      String? token ;
      SharedPreferences prefs = await SharedPreferences.getInstance();

      token = prefs.get('token') as String?;


      print(token);
      final data = await userRepository
          .userTransactions
          .fetchTransaction(token: token);

      try{

        print('token');
        emit(UserTransactionLoaded(data));
      } catch(e){
        print('tokenkjbjk');
        emit(UserErrorState(e.toString()));
        emit(UserTransactionLoaded(data));
      }

    });
  }
}
