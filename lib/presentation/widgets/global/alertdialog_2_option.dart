import 'package:flutter/material.dart';

class AlertDialog2Opt extends StatelessWidget {
  final String title;
  final String content;
  final String opt1Text;
  final String opt2Text;
  final VoidCallback? onPressed1Opt;
  final VoidCallback? onPressed2Opt;

  const AlertDialog2Opt(
      {Key? key,
      required this.title,
      required this.content,
      required this.opt1Text,
      required this.opt2Text,
      this.onPressed1Opt,
      this.onPressed2Opt})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(opt1Text),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(opt2Text),
        ),
      ],
    );
  }
}
