import 'package:flutter/material.dart';

class InputTextCustom extends StatelessWidget {
  const InputTextCustom(
      {Key? key,
      required this.width,
      required this.height,
      required this.textLabel,
      required this.fontWeight_label,
      required this.fontFamily_label,
      required this.color_backgroud,
      required this.padding,
      required this.radius,
      required this.suffixIcon,
      required this.onChanged,
      required this.validator})
      : super(key: key);

  final double width;
  final double height;
  final String textLabel;
  final FontWeight fontWeight_label;
  final String fontFamily_label;
  final Color color_backgroud;
  final double padding;
  final double radius;
  final Icon suffixIcon;
  final Function(String) onChanged;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        autofocus: true,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            labelText: textLabel,
            labelStyle: TextStyle(
                fontWeight: fontWeight_label, fontFamily: fontFamily_label),
            hintText: "",
            fillColor: color_backgroud,
            filled: true,
            contentPadding: EdgeInsets.all(padding),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide.none),
            suffixIcon: suffixIcon),
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
