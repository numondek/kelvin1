part of 'user_transaction_bloc.dart';

abstract class UserTransactionState extends Equatable {
  const UserTransactionState();
}

class UserTransactionInitial extends UserTransactionState {
  @override
  List<Object> get props => [];
}

class UserTransactionLoadingState extends UserTransactionState{
  @override
  List<Object?> get props => [];

}

class UserTransactionLoaded extends UserTransactionState {
  UserTransactionLoaded( this.data);
  final List<UserTransaction> data;
  @override
  List<Object> get props => [data];
}


class UserErrorState extends UserTransactionState {
  UserErrorState( this.data);
  final String data;
  @override
  List<Object> get props => [data];
}

