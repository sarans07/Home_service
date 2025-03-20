import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Messege{

  static void Show({
    String messege = "Done!",
    ToastGravity gravity= ToastGravity.BOTTOM,
    int timeInSecForIosWeb = 1,
    Color background = Colors.green,
    Color fontColor = Colors.black,
    double fontSize = 16.0,
})
  {
    Fluttertoast.showToast(
        msg: messege,
        toastLength: Toast.LENGTH_SHORT,
        gravity: gravity,
        timeInSecForIosWeb: timeInSecForIosWeb,
        backgroundColor: background,
        textColor: fontColor,
        fontSize: fontSize
    );
  }
}