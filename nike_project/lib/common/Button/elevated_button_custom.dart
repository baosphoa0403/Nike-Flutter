import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ElevatedButtonCustom extends StatelessWidget {
  final Widget child;
  final Color color;
  final VoidCallback? onPressed;
  final double borderRadius;
  final double height;
  final double width;

  const ElevatedButtonCustom(
      {Key? key,
      required this.child,
      required this.width,
      required this.color,
      required this.onPressed,
      required this.borderRadius,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: child,
        style: ElevatedButton.styleFrom(
            primary: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)))),
      ),
    );
  }
}
