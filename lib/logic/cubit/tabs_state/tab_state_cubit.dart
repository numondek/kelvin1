import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tab_state_state.dart';

class TabStateCubit extends Cubit<TabStateState> {
  TabStateCubit() : super(TabStateState(currentState: 1));
  void firstState(){
    emit(TabStateState(currentState: 0));
  }
  void secondState(){
    emit(TabStateState(currentState: 1));
  }
  void thirdState(){
    emit(TabStateState(currentState: 2));
  }
}
