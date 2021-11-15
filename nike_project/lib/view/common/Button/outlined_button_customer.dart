import 'package:flutter/material.dart';

class OutLinedButtonCustom extends StatelessWidget {
  final Widget child;
  final Color color;
  final VoidCallback? onPressed;
  final Color colorBorder;
  final Icon icon;
  final double borderRadius;
  final double height;
  final double width;
  const OutLinedButtonCustom(
      {Key? key,
      required this.child,
      required this.color,
      required this.onPressed,
      required this.colorBorder,
      required this.icon,
      required this.borderRadius,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: height,
      width: width,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        label: child,
        style: OutlinedButton.styleFrom(
            primary: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            ),
            side: BorderSide(color: colorBorder)),
        icon: icon,
      ),
    );
  }
}
