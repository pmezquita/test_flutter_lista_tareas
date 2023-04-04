part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

// TODO: verificar
class SetInitialUserEvent extends UserEvent{
  SetInitialUserEvent();
}

class SetUserEvent extends UserEvent {
  final UserModel user;
  SetUserEvent(this.user);
}

class TogglePassword1Event extends UserEvent{
  TogglePassword1Event();
}

class TogglePassword2Event extends UserEvent{
  TogglePassword2Event();
}
