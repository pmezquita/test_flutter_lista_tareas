part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class SetUserEvent extends UserEvent {
  final UserModel user;
  SetUserEvent(this.user);
}

class TogglePassword1 extends UserEvent{
  TogglePassword1();
}

class TogglePassword2 extends UserEvent{
  TogglePassword2();
}
