// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike_project/contants/contants.dart';

class ElevatedButtonCustom extends StatelessWidget {
  final Widget child;
  final Color color;
  final VoidCallback? onPressed;
  final double borderRadius;
  final double height;
  const ElevatedButtonCustom(
      {Key? key,
      required this.child,
      this.color = kPrimaryColor,
      required this.onPressed,
      this.borderRadius = 10,
      this.height = 50.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: ElevatedButton(
          onPressed: onPressed,
          child: child,
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              shadowColor: color),
        ),
      ),
    );
  }
}
