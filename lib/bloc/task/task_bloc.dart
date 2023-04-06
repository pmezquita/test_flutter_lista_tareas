import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'task_event.dart';

part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskInitialState()) {
    on<SetIsLoadingPicEvent>((event, emit) {
      emit(SetTaskState(event.isLoadingPic));
    });
  }
}
