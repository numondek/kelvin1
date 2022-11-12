part of 'user_info_bloc.dart';

abstract class UserInfoEvent extends Equatable {
  const UserInfoEvent();
}

class UserInfoLoadingEvent extends UserInfoEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
