import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToastSuccess(String mess) => Fluttertoast.showToast(
      msg: mess,
      backgroundColor: Colors.green[400],
      gravity: ToastGravity.TOP_RIGHT,
      timeInSecForIosWeb: 3,
    );
void showToastFail(String mess) => Fluttertoast.showToast(
      msg: mess,
      backgroundColor: Colors.red[600],
      gravity: ToastGravity.TOP_RIGHT,
      timeInSecForIosWeb: 3,
    );

