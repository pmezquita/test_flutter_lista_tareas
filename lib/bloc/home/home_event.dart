part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class SetInitialHomeEvent extends HomeEvent {
  SetInitialHomeEvent();
}

class SetHomeEvent extends HomeEvent {
  final int selectedIndex;

  SetHomeEvent(this.selectedIndex);
}
