part of 'user_transaction_bloc.dart';

abstract class UserTransactionState extends Equatable {
  const UserTransactionState();
}

class UserTransactionInitial extends UserTransactionState {
  @override
  List<Object> get props => [];
}

class UserTransactionLoadingState extends UserTransactionEvent{
  @override
  List<Object?> get props => [];

}

class UserTransactionLoaded extends UserTransactionState {
  final UserTransaction userTransaction;
  const UserTransactionLoaded(this.userTransaction);
  @override
  List<Object> get props => [];
}

