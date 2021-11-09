import 'package:flutter/material.dart';

class OutLinedButtonCustom extends StatelessWidget {
  final Widget child;
  final Color color;
  final VoidCallback? onPressed;
  final Color colorBorder;
  final Icon icon;
  const OutLinedButtonCustom(
      {Key? key,
      required this.child,
      required this.color,
      required this.onPressed,
      required this.colorBorder,required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height*0.06,
      width: size.width,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        label: child,
        style: OutlinedButton.styleFrom(
            primary: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
            side: BorderSide(color: colorBorder)),
        icon: icon,
      ),
    );
  }
}
