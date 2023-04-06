part of 'task_bloc.dart';

@immutable
abstract class TaskEvent {}

class SetIsLoadingPicEvent extends TaskEvent {
  final bool isLoadingPic;

  SetIsLoadingPicEvent(this.isLoadingPic);
}
