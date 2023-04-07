import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:lista_tareas/helpers/utils.dart';

part 'task_event.dart';

part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitialState(DateTime.now())) {
    on<SetIsLoadingPicEvent>((event, emit) {
      emit(SetTaskState(event.isLoadingPic, state.date));
    });
    on<SetDateEvent>((event, emit) {
      emit(SetTaskState(state.isLoadingPic, event.date));
    });
    on<SetDayDateEvent>((event, emit) {
      emit(SetTaskState(
          state.isLoadingPic,
          DateTime(
            state.date.year,
            state.date.month,
            getDayValid(state.date.year, state.date.month, event.day),
          )));
    });
    on<SetMonthDateEvent>((event, emit) {
      emit(SetTaskState(
          state.isLoadingPic,
          DateTime(
            state.date.year,
            event.month,
            getDayValid(state.date.year, event.month, state.date.day),
          )));
    });
    on<SetYearDateEvent>((event, emit) {
      emit(SetTaskState(
          state.isLoadingPic,
          DateTime(
            event.year,
            state.date.month,
            getDayValid(event.year, state.date.month, state.date.day),
          )));
    });
  }
}
