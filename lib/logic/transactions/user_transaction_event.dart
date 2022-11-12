part of 'user_transaction_bloc.dart';

abstract class UserTransactionEvent extends Equatable {
  const UserTransactionEvent();
}
class UserTransactionLoading extends UserTransactionEvent {
  @override
  List<Object> get props => [];
}
