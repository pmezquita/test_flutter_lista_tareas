import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:lista_tareas/models/user_model.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitialState()) {
    on<SetUserEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<TogglePassword1>((event, emit) {
      emit(UserSetState(!state.obscurePassword1, state.obscurePassword2, state.user));
    });
    on<TogglePassword2>((event, emit) {
      emit(UserSetState(state.obscurePassword1, !state.obscurePassword2, state.user));
    });
  }
}
