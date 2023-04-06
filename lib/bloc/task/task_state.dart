part of 'task_bloc.dart';

@immutable
abstract class TaskState {
  final bool isLoadingPic;

  const TaskState({required this.isLoadingPic});
}

class TaskInitialState extends TaskState {
  const TaskInitialState() : super(isLoadingPic: false);
}

class SetTaskState extends TaskState {
  final bool newIsLoadingPic;

  const SetTaskState(this.newIsLoadingPic) : super(isLoadingPic: newIsLoadingPic);
}
