import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:d8er1/logic/transactions/user_transaction_bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_transaction_event.dart';
part 'user_transaction_state.dart';

class UserTransactionBloc extends Bloc<UserTransactionEvent, UserTransactionState> {
  UserTransactionBloc() : super(UserTransactionInitial()) {
    on<UserTransactionEvent>((event, emit) {

    });
  }
}
