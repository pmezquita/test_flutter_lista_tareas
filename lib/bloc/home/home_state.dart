part of 'home_bloc.dart';

@immutable
abstract class HomeState {
  final int selectedIndex;

  const HomeState({required this.selectedIndex});
}

class HomeInitialState extends HomeState {
  const HomeInitialState() : super(selectedIndex: 0);
}

class HomeSetState extends HomeState {
  final int newSelectedIndex;

  const HomeSetState(this.newSelectedIndex) : super(selectedIndex: newSelectedIndex);
}
