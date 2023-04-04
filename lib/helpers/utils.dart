import 'package:flutter/material.dart';

void showInSnackBar(GlobalKey<ScaffoldMessengerState> scaffoldKey, String value, {int? duracion}) {
  scaffoldKey.currentState?.hideCurrentSnackBar();
  scaffoldKey.currentState?.showSnackBar(SnackBar(
    content: Text(value),
    duration: Duration(seconds: duracion ?? 2),
  ));
}