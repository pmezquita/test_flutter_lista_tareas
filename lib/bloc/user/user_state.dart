part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final bool obscurePassword1;
  final bool obscurePassword2;
  final UserModel? user;

  const UserState({this.obscurePassword1 = true, this.obscurePassword2 = true, this.user});
}

class UserInitialState extends UserState {
  const UserInitialState() : super();
}

class UserSetState extends UserState {
  final bool newObscurePassword1;
  final bool newObscurePassword2;
  final UserModel? newUser;

  const UserSetState(this.newObscurePassword1, this.newObscurePassword2, this.newUser)
      : super(obscurePassword1: newObscurePassword1, obscurePassword2: newObscurePassword2, user: newUser);
}
