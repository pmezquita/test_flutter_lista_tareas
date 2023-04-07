import 'package:flutter/material.dart';

void showInSnackBar(GlobalKey<ScaffoldMessengerState> scaffoldKey, String value, {int? duracion}) {
  scaffoldKey.currentState?.hideCurrentSnackBar();
  scaffoldKey.currentState?.showSnackBar(SnackBar(
    content: Text(value),
    duration: Duration(seconds: duracion ?? 2),
  ));
}

int getDayValid(int year, int month, int day) {
  print("date recibido: " + DateTime(year,month).toIso8601String());
  print("día recibido: " + day.toString());
  final lastDayMonth = DateTime(year, month + 1, 0).day;
  print("ultimo día del mes: " + lastDayMonth.toString());
  return day <= lastDayMonth ? day : lastDayMonth;
}
