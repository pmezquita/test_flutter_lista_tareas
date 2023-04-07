part of 'task_bloc.dart';

@immutable
abstract class TaskState {
  final bool isLoadingPic;
  final DateTime date;

  const TaskState({required this.isLoadingPic, required this.date});
}

class TaskInitialState extends TaskState {
  final DateTime initDate;
  const TaskInitialState(this.initDate) : super(isLoadingPic: false, date: initDate);
}

class SetTaskState extends TaskState {
  final bool newIsLoadingPic;
  final DateTime newDate;

  const SetTaskState(this.newIsLoadingPic, this.newDate)
      : super(isLoadingPic: newIsLoadingPic, date: newDate);
}
