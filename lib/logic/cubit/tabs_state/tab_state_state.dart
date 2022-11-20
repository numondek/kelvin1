part of 'tab_state_cubit.dart';

class TabStateState extends Equatable {
  int? currentState;
  TabStateState({this.currentState});

  @override
  List<Object?> get props => [currentState];
}

