import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:lista_tareas/models/user_model.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitialState()) {
    on<SetInitialUserEvent>((event, emit) {
      emit(UserInitialState());
    });
    on<SetUserEvent>((event, emit) {
      emit(UserSetState(true, true, event.user));
    });
    on<TogglePassword1Event>((event, emit) {
      emit(UserSetState(!state.obscurePassword1, state.obscurePassword2, state.user));
    });
    on<TogglePassword2Event>((event, emit) {
      emit(UserSetState(state.obscurePassword1, !state.obscurePassword2, state.user));
    });
  }
}
