import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void snackBar(
    {required String msg, required Color color, required Color textColor}) {
  Fluttertoast.showToast(
    msg: msg,
    backgroundColor: color,
    toastLength: Toast.LENGTH_LONG,
    timeInSecForIosWeb: 5,
    gravity: ToastGravity.BOTTOM,
    textColor: Colors.white,
    fontSize: 16,
  );
}
