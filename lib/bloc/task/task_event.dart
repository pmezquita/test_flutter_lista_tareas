part of 'task_bloc.dart';

@immutable
abstract class TaskEvent {}

class SetIsLoadingPicEvent extends TaskEvent {
  final bool isLoadingPic;

  SetIsLoadingPicEvent(this.isLoadingPic);
}

class SetDateEvent extends TaskEvent {
  final DateTime date;

  SetDateEvent(this.date);
}

class SetDayDateEvent extends TaskEvent {
  final int day;

  SetDayDateEvent(this.day);
}

class SetMonthDateEvent extends TaskEvent {
  final int month;

  SetMonthDateEvent(this.month);
}

class SetYearDateEvent extends TaskEvent {
  final int year;

  SetYearDateEvent(this.year);
}
