import 'package:flutter/material.dart';

class InputDropdown extends StatelessWidget {
  const InputDropdown({
    Key? key,
    this.labelText = "input",
    this.valueText = "string value",
    //this.valueStyle= TextStyle(color: Colors.black),
    this.onPressed,
    this.hintText,
    this.color = Colors.white,
  }) : super(key: key);

  final String labelText;
  final String valueText;
  //final TextStyle valueStyle;
  final VoidCallback? onPressed;
  final String? hintText;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return 
      // onTap: onPressed,
      // child: InputDecorator(
      //   decoration: InputDecoration(
      //     labelText: labelText,
      //   ),
      //   baseStyle: TextStyle(color: Colors.black),
        // child: Row(
        //  // mainAxisAlignment: MainAxisAlignment.center,
        //   mainAxisSize: MainAxisSize.min,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: <Widget>[
        //     Text(valueText, style: TextStyle(color: color)),
        //     Icon(Icons.arrow_drop_down,
        //         color: Theme.of(context).brightness == Brightness.light
        //             ? Colors.grey.shade700
        //             : Colors.white70),
        //   ],
        //  ),
         Center(
          child: TextField(
            maxLength: 100,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: labelText,

            ),
          ),
        );
      
   // );
  }
}
