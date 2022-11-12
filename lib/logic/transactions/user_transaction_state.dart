part of 'user_transaction_bloc.dart';

abstract class UserTransactionState extends Equatable {
  const UserTransactionState();
}

class UserTransactionInitial extends UserTransactionState {
  @override
  List<Object> get props => [];
}
class UserTransactionLoaded extends UserTransactionState {
  @override
  List<Object> get props => [];
}
