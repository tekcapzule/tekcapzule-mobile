import 'package:flutter/material.dart';

class ActionIndicator {
  static final ActionIndicator _instance = ActionIndicator._internal();

  factory ActionIndicator() {
    return _instance;
  }

  ActionIndicator._internal();

  SnackBar getSnackBar(BuildContext context, String message) {
    return SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      elevation: 15,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Color.fromARGB(255, 83, 78, 78),
      action: SnackBarAction(
          textColor: Color.fromARGB(255, 252, 137, 137),
          label: 'Dismiss',
          onPressed: (() {
            ScaffoldMessenger.of(context).clearSnackBars();
          })),
    );
  }

  Future<AlertDialog?> getDialog(
      BuildContext context, String title, String message) {
    return showDialog<AlertDialog>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 63, 61, 62),
                fontSize: 20),
            content: Text(
              message,
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
          );
        });
  }
}
