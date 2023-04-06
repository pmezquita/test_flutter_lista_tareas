import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitialState()) {
    on<SetInitialHomeEvent>((event, emit) {
      emit(const HomeInitialState());
    });
    on<SetHomeEvent>((event, emit) {
      emit(HomeSetState(event.selectedIndex));
    });
  }
}
