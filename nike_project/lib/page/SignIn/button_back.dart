import 'package:flutter/material.dart';

class ButtonBack extends StatelessWidget {
  const ButtonBack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue[50]!),
          shape:
              MaterialStateProperty.all<OutlinedBorder>(const CircleBorder()),
          fixedSize: MaterialStateProperty.all<Size>(const Size(50, 50))),
      child: const Icon(
        Icons.arrow_back,
        color: Colors.blue,
      ),
      onPressed: () {},
    );
  }
}
