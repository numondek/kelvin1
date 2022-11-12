part of 'user_info_bloc.dart';

abstract class UserInfoState extends Equatable {
  const UserInfoState();
}

class UserInfoInitial extends UserInfoState {
  @override
  List<Object> get props => [];
}

class UserInfoLoaded extends UserInfoState {
  final UserDetail userDetail;
  const UserInfoLoaded(this.userDetail);
  @override
  List<Object> get props => [userDetail];
}
