import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike_project/page/Home_Page/home_page.dart';

Future<dynamic> showAlertDialog(BuildContext context,
    {required String title,
    required String content,
    String? cancelActionText,
    required String defaultActionText}) {
  // if (!Platform.isIOS) {
  return showDialog(
    context: context,
    barrierDismissible: false, // tránh click zo khoảng trắng close dialog
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          if (cancelActionText != null)
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text(cancelActionText)),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                    (route) => false);
                // Navigator.of(context).pop(true);
                // Navigator.of(context).pushReplacementNamed('/HomePage');
              },
              child: Text(defaultActionText))
        ],
      );
    },
  );
  // }
  // return showCupertinoDialog(
  //   context: context,
  //   builder: (context) => CupertinoAlertDialog(
  //     title: Text(title),
  //     content: Text(content),
  //     actions: <CupertinoDialogAction>[
  //       if (cancelActionText != null)
  //         CupertinoDialogAction(
  //           child: Text(cancelActionText),
  //           onPressed: () {
  //             Navigator.of(context).pop(false);
  //           },
  //         ),
  //       CupertinoDialogAction(
  //         child: Text(defaultActionText),
  //         onPressed: () {
  //           Navigator.of(context).pop(true);
  //         },
  //       )
  //     ],
  //   ),
  // );
}
